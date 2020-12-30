import os
import fileinput
import re
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep


NOTEBOOKS_DIR = "notebooks"
PLUTO_URL_REGEX = r"http://localhost:([0-9]{4})/\?secret=(\w*)"


def get_path(notebook):
    """ Gets the path of a notebook given its filename. """
    return os.path.join(os.getcwd(), NOTEBOOKS_DIR, notebook)


def f_with_retry(f, retries=20, single_failure_message="not ready."):
    """
    Tries a function f 'retries' times catching exceptions. If the last retry
    fails, an exception is raised.
    """
    for tried in range(retries):
        try:
            return f()
        except Exception:
            print(f"Try {tried}: {single_failure_message}... repeating in 0.5s")
            sleep(0.5)
    raise Exception(f"Reached retry limit ({retries}). Aborting.")


def get_with_retry(driver, class_name, index):
    """
    Gets an HTML element with it's class name and retries it up to 20 times.
    """
    return f_with_retry(
        lambda: driver.find_elements_by_class_name(class_name)[index],
        single_failure_message="element {class_name} not ready",
    )


def click_with_retry(clickable):
    """
    Clicks an HTML element if already clickable. Retries up to 20 times.
    """
    return f_with_retry(
        lambda: clickable.click(), single_failure_message="not clickable yet"
    )


def download(driver, port, secret, notebook_filename):
    """
    Opens a notebook file with a selenium driver and clicks the download button.
    """
    path = get_path(notebook_filename)
    driver.get(f"localhost:{port}/open?path={path}&secret={secret}")

    print("Getting export menu.")
    toggle = get_with_retry(driver, "toggle_export", 1)
    print("Clicking export menu.")

    click_with_retry(toggle)
    print("Getting export button.")
    export_link = get_with_retry(driver, "export_card", 1)
    print("Clicking export button.")
    click_with_retry(export_link)


if __name__ == "__main__":
    # Reads the output from pluto and looks for the port and secret number.
    for line in fileinput.input():
        match = re.search(PLUTO_URL_REGEX, line)
        if match:
            port = match.group(1)
            secret = match.group(2)
            print(f"Pluto executing on port {port} with secret {secret}")
            break

    driver = webdriver.Chrome()
    for file in os.listdir(NOTEBOOKS_DIR):
        # Only download notebooks.
        if ".jl" in file:
            download(driver, port, secret, file)

    # Wait till the last click takes effect.
    sleep(5)
    driver.close()

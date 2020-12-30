import os
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep

SECRET = "UpYLRGw0"
URL_BASE = "http://localhost:1234/open"
NOTEBOOKS_DIR = "notebooks"


def get_path(notebook):
    return os.path.join(os.getcwd(), NOTEBOOKS_DIR, notebook)


def f_with_retry(f, retries=20, single_failure_message="not ready."):
    for tried in range(retries):
        try:
            return f()
        except Exception:
            print(f"Try {tried}: {single_failure_message}... repeating in 0.5s")
            sleep(0.5)
    raise Exception(f"Reached retry limit ({retries}). Aborting.")


def get_with_retry(driver, class_name, index):
    return f_with_retry(
        lambda: driver.find_elements_by_class_name(class_name)[index],
        single_failure_message="element {class_name} not ready",
    )


def click_with_retry(clickable):
    return f_with_retry(
        lambda: clickable.click(), single_failure_message="not clickable yet"
    )


def download(driver, notebook_filename):
    path = get_path(notebook_filename)
    driver.get(f"{URL_BASE}?path={path}&secret={SECRET}")

    print("Getting export menu.")
    toggle = get_with_retry(driver, "toggle_export", 1)
    print("Clicking export menu.")

    click_with_retry(toggle)
    print("Getting export button.")
    export_link = get_with_retry(driver, "export_card", 1)
    print("Clicking export button.")
    click_with_retry(export_link)


if __name__ == "__main__":
    driver = webdriver.Chrome()
    download(driver, "funciones_basicas.jl")

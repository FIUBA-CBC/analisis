deps:
	./install_julia_deps.sh

run:
	julia -e "using Pluto; Pluto.run()"

export:
	julia -e "using Pluto; Pluto.run()" | python export.py

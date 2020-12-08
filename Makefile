deps:
	./install_julia_deps.sh

run:
	julia -e "using Pluto; Pluto.run()"

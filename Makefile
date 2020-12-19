deps:
	./install_julia_deps.sh

docker-build:
	docker build . -t cbc

docker-run:
	docker run -p 1234:1234 cbc

run:
	julia -e "using Pluto; Pluto.run()"

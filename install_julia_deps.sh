#!/usr/bin/env bash

if [[ $(julia -v) =~ .*"julia version".* ]]; then
    echo "Julia está instalado."
else
    echo "Julia no está instalado. Instalando en $HOME/julia"
    wget https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.3-linux-x86_64.tar.gz
    tar zxvf julia-1.5.3-linux-x86_64.tar.gz
    mv julia-1.5.3 ${HOME}/julia
    rm -rf julia-*
    sudo ln -s ${HOME}/julia/bin/julia /usr/local/bin/julia
fi

julia -e "using Pkg; Pkg.activate(pwd()); Pkg.instantiate();"

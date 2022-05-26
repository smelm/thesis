
default: build

clean:
    -rm -rf build/
    mkdir build

prepare:
    mkdir -p build

    cp -r chapters build
    cp thesis.tex build
    cp sources.bib build
    

build: prepare
    #!/usr/bin/env bash
    cd build

    pdflatex thesis.tex
    bibtex thesis.aux
    pdflatex thesis.tex

    mv thesis.pdf ..

open:
    xdg-open thesis.pdf


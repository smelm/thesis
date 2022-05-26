
default: build

clean:
    -rm -rf build/
    mkdir build

build:
    #!/usr/bin/env bash
    mkdir -p build

    echo "copy sources"
    cp -r chapters build
    cp thesis.tex build
    cp sources.bib build

    cd build

    pdflatex thesis.tex
    bibtex thesis.tex
    pdflatex thesis.tex
    pdflatex thesis.tex

open: build
    xdg-open thesis.pdf


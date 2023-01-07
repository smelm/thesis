

tex := "pdflatex --halt-on-error --shell-escape"

default: build

compile:
    cd build
    {{tex}} thesis

clean:
    -rm -rf build/
    mkdir build

prepare: 
    mkdir -p build
    cp *.tex build
    cp *.bib build
    cp *.txt build
    cp *.rexregex build
    ln -sf ../images build
    
build: prepare
    #!/usr/bin/env bash
    cd build
    {{tex}} thesis
    mv thesis.pdf ..

lit: prepare
    #!/usr/bin/env bash
    cd build

    pdflatex --halt-on-error --shell-escape thesis
    pdflatex --halt-on-error --shell-escape thesis
    biber thesis
    pdflatex --halt-on-error --shell-escape thesis

    mv thesis.pdf ..


open:
    xdg-open thesis.pdf


setup:
    #!/usr/bin/env bash
    tmux
    tmux new-window -d
    tmux send-keys -t 1 "just watch" Enter
    vim thesis.tex

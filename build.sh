cd tex
pdflatex thesis.tex
bibtex thesis.tex
pdflatex thesis.tex
pdflatex thesis.tex

cd ..


if [[ $* == *--open* ]]
then
    xdg-open tex/thesis.pdf
fi

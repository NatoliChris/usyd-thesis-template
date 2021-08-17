all: pdf

pdf:
	-pdflatex -f -synctex=1 -interaction=nonstopmode thesis.tex
	-bibtex thesis
	-makeglossaries thesis
	-pdflatex -f -synctex=1 -interaction=nonstopmode thesis.tex
	-pdflatex -f -synctex=1 -interaction=nonstopmode thesis.tex

simple:
	-pdflatex -synctex=1 thesis.tex

single: simple

double:
	-pdflatex -synctex=1 thesis.tex
	-pdflatex -synctex=1 thesis.tex

watch:
	find . -iname "*.tex" -o -iname "*.bib" | entr make

watchsimple:
	find . -iname "*.tex" -o -iname "*.bib" | entr make simple

clean:
	rm -f *.aux *.log *.out *.toc *.lot *.lof *.bbl *.blg *.xml *-blx.bib *.cn *.acr *.alg *.glg *.gls *.ist *.acn *.glo

.PHONY: pdf all clean

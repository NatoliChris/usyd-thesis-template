all: pdf

pdf:
	-pdflatex -f -interaction=nonstopmode thesis.tex
	-bibtex thesis
	-pdflatex -f -interaction=nonstopmode thesis.tex
	-pdflatex -f -interaction=nonstopmode thesis.tex

watch:
	find . -iname "*.tex" -o -iname "*.bib" | entr make

clean:
	rm -f *.aux *.log *.out *.toc *.lot *.lof *.bbl *.blg *.xml *-blx.bib

.PHONY: pdf all clean

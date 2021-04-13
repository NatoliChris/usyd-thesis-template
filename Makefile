all: pdf

pdf:
	pdflatex -interaction=nonstopmode thesis.tex
	bibtex thesis
	pdflatex thesis.tex
	pdflatex thesis.tex

watch:
	find . -iname "*.tex" -o -iname "*.bib" | entr make

clean:
	rm -f *.aux *.log *.out *.toc *.lot *.lof *.bbl *.blg

.PHONY: pdf all clean

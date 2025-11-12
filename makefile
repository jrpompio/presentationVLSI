# Makefile para compilar main.tex con XeLaTeX y abrir con Okular

TEX   = xelatex
FLAGS = -interaction=nonstopmode -halt-on-error -file-line-error
SRC   = main.tex
PDF   = VLSI_presentation.pdf
SRCS  = $(wildcard *.tex) $(wildcard *.sty) $(wildcard *.bib)

all: $(PDF)

$(PDF): $(SRCS)
	$(TEX) $(FLAGS) -jobname=VLSI_presentation $(SRC)

view: $(PDF)
	okular $(PDF) >/dev/null 2>&1 &

clean:
	rm -f *.aux *.log *.out *.toc *.nav *.snm *.bcf *.run.xml *.vrb
	rm -f *.bbl *.blg *.fls *.fdb_latexmk *.synctex.gz

distclean: clean
	rm -f $(PDF)

.PHONY: all view clean distclean


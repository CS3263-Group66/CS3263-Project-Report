# Makefile for LaTeX project
MAIN = main

LATEX = pdflatex
BIBTEX = bibtex
LATEXFLAGS = -interaction=nonstopmode -halt-on-error

# Default target (always rebuild)
.PHONY: all
all:
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex
	-$(BIBTEX) $(MAIN)
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex
	$(LATEX) $(LATEXFLAGS) $(MAIN).tex

# Clean auxiliary files
.PHONY: clean
clean:
	find . -type f \( \
		-name "*.aux" -o \
		-name "*.log" -o \
		-name "*.out" -o \
		-name "*.toc" -o \
		-name "*.bbl" -o \
		-name "*.blg" -o \
		-name "*.lof" -o \
		-name "*.lot" -o \
		-name "*.fls" -o \
		-name "*.fdb_latexmk" \
	\) -delete

# Full clean (including PDF)
.PHONY: distclean
distclean: clean
	rm -f $(MAIN).pdf


#----------------------------------------------
# A simple Makefile for a simple job
#----------------------------------------------


TEXS = $(shell find . -name "*.tex" | sed -e 's/^\.\///')
PDFS=$(TEXS:.tex=.pdf)

default: dummy

clean:
	@ echo "Removing all homemade mess."
	./util/cleanupGitRepo.sh

latex: $(PDFS)
	@ echo "Done."

%.pdf:  %.tex
	@ echo $< | tr ' ' '\n' | perl -nle '{ $$f=$$n=$$_; $$n=~s/\..*$$//; \
		print `. util/env.sh; pdflatex -shell-escape $$f`; \
		print `. util/env.sh; bibtex $$n`;                 \
		print `. util/env.sh; pdflatex -shell-escape $$f`; \
		print `. util/env.sh; pdflatex -shell-escape $$f`; \
		print `. util/env.sh; pdflatex -shell-escape $$f`; }'

install:
	@ echo "Installing pygments from source"
	./util/installPygments.sh

dummy:
	@ echo "Dummy target, see my real targets!"


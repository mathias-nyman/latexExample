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
	@ echo $< | tr ' ' '\n' | perl -nle '{ $$f=$$n=$$b=$$_; $$n=~s/\..*$$//; \
		print `. util/env.sh; pdflatex -shell-escape $$f`; \
		print `. util/env.sh; bibtex $$n`;                 \
		print `. util/env.sh; pdflatex -shell-escape $$f`; \
		print `. util/env.sh; pdflatex -shell-escape $$f`; \
		print `. util/env.sh; pdflatex -shell-escape $$f`; \
		print `/bin/rm -f $$n.toc`; \
		print `/bin/rm -f $$n.snm`; \
		print `/bin/rm -f $$n.pyg`; \
		print `/bin/rm -f $$n.out`; \
		print `/bin/rm -f $$n.nav`; \
		print `/bin/rm -f $$n.log`; \
		print `/bin/rm -f $$n.blg`; \
		print `/bin/rm -f $$n.bbl`; \
		print `/bin/rm -f $$n.aux`; }'

install:
	@ echo "Installing pygments from source"
	./util/installPygments.sh

dummy:
	@ echo "Dummy target, see my real targets!"


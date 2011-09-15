
#----------------------------------------------
# A simple Makefile for a simple job
#----------------------------------------------


TEXS = $(shell find . -name "*.tex" | sed -e 's/^\.\///')


default: dummy

clean:
	@ echo "Removing all homemade mess."
	./util/cleanupGitRepo.sh

latex:
	@ echo "Compiling all tex files..."
	@ echo $(TEXS) | tr ' ' '\n' | perl -nle '{ $$f=$$n=$$_; $$n=~s/\..*$$//; \
		print `. util/env.sh; pdflatex -shell-escape $$f`; \
		print `. util/env.sh; bibtex $$n`;                 \
		print `. util/env.sh; pdflatex -shell-escape $$f`; \
		print `. util/env.sh; pdflatex -shell-escape $$f`; \
		print `. util/env.sh; pdflatex -shell-escape $$f`; }'
	@ echo "Done."


install:
	@ echo "Installing pygments from source"
	./util/installPygments.sh

dummy:
	@ echo "Dummy target, see my real targets!"


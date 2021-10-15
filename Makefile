.PHONY: clean distclean main

all: main

main: main.tex
	@latexmk -xelatex $<

clean:
	@latexmk -c

distclean:
	@latexmk -C

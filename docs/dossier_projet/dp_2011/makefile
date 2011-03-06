READER=evince

DossierTech2010Robotter.pdf : *.tex *.sty
	pdflatex DossierTech2011Robotter.tex && pdflatex DossierTech2011Robotter.tex
	rm -vf *.toc *.out *.aux *.log
	chmod 664 *.pdf
	
clean :
	rm -vf *.toc *.out *.aux *.log *.pdf

view : DossierTech2011Robotter.pdf
	$(READER) DossierTech2011Robotter.pdf &


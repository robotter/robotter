READER=evince

DossierTech2014Robotter.pdf : *.tex *.sty
	pdflatex DossierTech2014Robotter.tex && pdflatex DossierTech2014Robotter.tex
	rm -vf *.toc *.out *.aux *.log
	chmod 664 *.pdf
	
clean :
	rm -vf *.toc *.out *.aux *.log *.pdf

view : DossierTech2014Robotter.pdf
	$(READER) DossierTech2014Robotter.pdf &


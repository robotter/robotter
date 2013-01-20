READER=evince

DossierTech2013Robotter.pdf : *.tex *.sty
	pdflatex DossierTech2013Robotter.tex && pdflatex DossierTech2013Robotter.tex
	rm -vf *.toc *.out *.aux *.log
	chmod 664 *.pdf
	
clean :
	rm -vf *.toc *.out *.aux *.log *.pdf

view : DossierTech2013Robotter.pdf
	$(READER) DossierTech2013Robotter.pdf &


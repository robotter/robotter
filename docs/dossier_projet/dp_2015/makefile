READER=evince

DossierTech2015Robotter.pdf : *.tex *.sty
	pdflatex DossierTech2015Robotter.tex && pdflatex DossierTech2015Robotter.tex
	rm -vf *.toc *.out *.aux *.log
	chmod 664 *.pdf
	
clean :
	rm -vf *.toc *.out *.aux *.log *.pdf

view : DossierTech2015Robotter.pdf
	$(READER) DossierTech2015Robotter.pdf &


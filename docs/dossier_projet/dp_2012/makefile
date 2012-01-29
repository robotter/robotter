READER=evince

DossierTech2012Robotter.pdf : *.tex *.sty
	pdflatex DossierTech2012Robotter.tex && pdflatex DossierTech2012Robotter.tex
	rm -vf *.toc *.out *.aux *.log
	chmod 664 *.pdf
	
clean :
	rm -vf *.toc *.out *.aux *.log *.pdf

view : DossierTech2012Robotter.pdf
	$(READER) DossierTech2012Robotter.pdf &


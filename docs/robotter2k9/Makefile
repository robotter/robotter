robotter2k9.pdf : *.tex 
	pdflatex robotter2k9.tex && pdflatex robotter2k9.tex
	rm -vf *.toc *.out *.aux *.log

pdf : *.tex *.sty
	pdflatex -file-line-error robotter2k9.tex
	
clean :
	rm -vf *.toc *.out *.aux *.log *.pdf
	

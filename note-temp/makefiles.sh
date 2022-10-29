#!/bin/bash
#-> Compile the main file
xelatex --synctex=-1 main.tex
bibtex main
xelatex --synctex=-1 main.tex
xelatex --synctex=-1 main.tex
#clear aux files
rm -r *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml *.synctex *.nlo *.nls *.bak *.ind *.idx *.ilg *.lof *.lot *.ent-x *.tmp *.ltx *.los *.lol *.loc *.listing *.gz *.userbak *.nav *.snm *.vrb 
done


#!/bin/bash

#-> Get source filename
find . -maxdepth 1 -type f -name "*en.tex" | while read FileName; do 
#--- Process FileName.tex ---
echo "$FileName"
echo "${FileName%.tex}"
#-> Compile the main file
pdflatex --synctex=-1 "$FileName"
bibtex "${FileName%.tex}"
pdflatex --synctex=-1 "$FileName"
pdflatex --synctex=-1 "$FileName"
#-> Clear aux files
rm -r *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml *.synctex *.nlo *.nls *.bak *.ind *.idx *.ilg *.lof *.lot *.ent-x *.tmp *.ltx *.los *.lol *.loc *.listing *.gz *.userbak *.nav *.snm *.vrb 
done


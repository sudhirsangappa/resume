all:	resume.pdf cv.pdf

resume.pdf:	resume.tex
	$(eval $@_TMP := $(shell mktemp -d tmpXXXXXX))
	pdflatex -output-directory=$($@_TMP) "\newif\ifcv \cvfalse \input{resume.tex}"
	mv $($@_TMP)/resume.pdf resume.pdf
	rm -r $($@_TMP)

cv.pdf:		resume.tex
	$(eval $@_TMP := $(shell mktemp -d tmpXXXXXX))
	pdflatex -output-directory=$($@_TMP) "\newif\ifcv \cvtrue \input{resume.tex}"
	mv $($@_TMP)/resume.pdf cv.pdf
	rm -r $($@_TMP)

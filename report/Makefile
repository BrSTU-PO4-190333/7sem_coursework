docker-compose-script:
	cd /app/report

	latexmk -pdf -output-directory=/temp/ -jobname=KP.PO4.190333-07_81_00 main_1_PZ.tex
	latexmk -pdf -output-directory=/temp/ -jobname=KP.PO4.190333-07_90_00 main_3_prilA.tex
	latexmk -pdf -output-directory=/temp/ -jobname=KP.PO4.190333-07_91_00 main_4_prilB.tex

	latexmk -pdf -output-directory=/temp/ -jobname=KP.PO4.190333-07_81_00.bundle main.tex

	cp /temp/*.pdf /build/

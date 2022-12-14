type=КП
group=ПО4
card=190333
number=07
version=07

docker-compose-script:
	cd /app/report

	latexmk -pdf -output-directory=/temp/ -jobname=81 main_1_PZ.tex
	latexmk -pdf -output-directory=/temp/ -jobname=90 main_3_prilA.tex
	latexmk -pdf -output-directory=/temp/ -jobname=91 main_4_prilB.tex

	latexmk -pdf -output-directory=/temp/ -jobname=${type}.${group}.${card}-${number}_81_${version}.bundle main.tex

	mv /temp/81.pdf /temp/${type}.${group}.${card}-${number}_81_${version}.pdf 
	mv /temp/90.pdf /temp/${type}.${group}.${card}-${number}_90_${version}.pdf 
	mv /temp/91.pdf /temp/${type}.${group}.${card}-${number}_91_${version}.pdf 
	cp /temp/*.pdf /build/

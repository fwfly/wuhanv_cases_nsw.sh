
draw:
	./wuhanv_trend.sh > trend.txt
	cat trend.txt
	gnuplot wuhanv.gp
	cp wuhanv.png ~/Desktop/

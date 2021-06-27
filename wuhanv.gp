reset
set xlabel 'time'
set ylabel 'cases'
set term png enhanced font 'Verdana,5' size 1500,1000
set output 'wuhanv.png'

set xtics rotate by 90 right
set boxwidth 3.0
plot "trend.txt" using 2:xtic(1) with linespoints linewidth 2 title "nsw"

reset
set xlabel 'time'
set ylabel 'cases'
set term png enhanced font 'Verdana,10'
set output 'wuhanv.png'
set key left
set xtics rotate by 90 right
set boxwidth 3.0
plot "trend.txt" using 2:xtic(1) with linespoints linewidth 2 title "nsw"

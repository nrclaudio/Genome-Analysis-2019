set terminal canvas jsdir ""
set output "/domus/h1/clno2215/stunning-garbanzo/stunning-garbanzo/results/genomics/quast/Canu_Pilon_Quast_1-1/contigs_reports/nucmer_output/contig1.html"
set size 1,1
set grid
set key outside bottom right
set border 5
set tics scale 0
set xlabel "Reference" noenhanced
set ylabel "tig00000001_pilon" noenhanced
set format "%.0f"
set xrange [1:*]
set yrange [1:2773702]
set linestyle 1  lt 1 lc rgb "red" lw 3 pt 7 ps 0.5
set linestyle 2  lt 3 lc rgb "blue" lw 3 pt 7 ps 0.5
set linestyle 3  lt 2 lc rgb "yellow" lw 3 pt 7 ps 0.5
plot \
 "/domus/h1/clno2215/stunning-garbanzo/stunning-garbanzo/results/genomics/quast/Canu_Pilon_Quast_1-1/contigs_reports/nucmer_output/contig1.fplot" title "FWD" w lp ls 1, \
 "/domus/h1/clno2215/stunning-garbanzo/stunning-garbanzo/results/genomics/quast/Canu_Pilon_Quast_1-1/contigs_reports/nucmer_output/contig1.rplot" title "REV" w lp ls 2

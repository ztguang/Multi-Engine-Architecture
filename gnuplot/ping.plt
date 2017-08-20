# gnuplot ping.plt
# display ping.png
# mv ping.png /root/桌面

#set terminal png
#set term png font '/usr/share/fonts/wps-office/FZSongS_20100603.TTF,14'
#set term png font '/usr/share/fonts/windows-font/msyh.ttf,14'
set term png font '/usr/share/fonts/msttcore/times.ttf,14'

set output "ping.png"  

set xrange [1:10]
set yrange [0:5]
set ytics 0,1,5

set ytics nomirror
set y2range [0:200]
#set y2tics 5
set y2tics 0,40,200

set grid

# set key box reverse top Left Right samplen 2 spacing 1.2
set key at 5,4.9 top Right samplen 2

set xlabel "Node number, x=[1,10]"
set ylabel "Hops between N11 and Nx, x=[1,10]"
set y2label "Round-Trip Time between N11 and Nx (ms)"

#----------------------------- 立柱 histogram
set border 3 front linetype -1 linewidth 1.000
set boxwidth 0.2 absolute

set grid layerdefault linetype 0 linewidth 1.000, linetype 0 linewidth 1.000
#set key bmargin center horizontal Left reverse noenhanced autotitles columnhead nobox
set style histogram clustered gap 1 title offset character 2, 0.25, 0
#set datafile missing '-'
#set style data histograms

#set xtics border in scale 0,0 nomirror rotate by -15  offset character 0, 0, 0 autojustify
#set xtics  norangelimit font ",11"
set xtics   ()
set ytics border in scale 0,0 mirror norotate  offset character 0, 0, 0 autojustify
set ztics border in scale 0,0 nomirror norotate  offset character 0, 0, 0 autojustify
set cbtics border in scale 0,0 mirror norotate  offset character 0, 0, 0 autojustify
set rtics axis in scale 0,0 nomirror norotate  offset character 0, 0, 0 autojustify
set style fill transparent pattern 6 bo
#-----------------------------


#plot 'ping.dat' using 1:2 title "The Average RTT of ping" with lines ls 1 lw 1 lc "red"

#plot 'ping.dat' using 1:2 axis x1y1 title "Average RTT" with linespoints pointtype 2, \
#     'ping.dat' using 1:2 axis x1y2 title "CPU Utilization" with linespoints pointtype 3

plot 'ping.dat' using 1:2 axis x1y1 title "Hops" with lp pt 5 lw 1 lc "blue", \
     'ping.dat' using 1:3 axis x1y2 with boxes title "Round-Trip Time" fill transparent solid 0.8 lc rgb 'skyblue'



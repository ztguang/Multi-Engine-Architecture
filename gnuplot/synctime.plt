# gnuplot synctime.plt
# display synctime.png
# cp synctime.png /root/桌面

# http://www.plotshare.com/index.ws/plot/371391166

set term pngcairo size 640,480 transparent nocrop enhanced font 'Verdana,11'#Start of user script
#---------------------
synctime2 = 'synctime2'
synctime5 = 'synctime5'
synctime1 = 'synctime1'
synctime4 = 'synctime4'
synctime3 = 'synctime3'
set output 'synctime.png'

set yrange [0:150]
set ytics 0,10,150

set border 3 front linetype -1 linewidth 1.000
set boxwidth 0.7 absolute

#set style fill solid 1.00 noborder
set style fill solid 1.00 border -1

#set grid nopolar
#set grid noxtics nomxtics ytics nomytics noztics nomztics \
# nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics

set grid layerdefault linetype 0 linewidth 1.000,  linetype 0 linewidth 1.000
set key bmargin center horizontal Left reverse noenhanced autotitles columnhead nobox
set style histogram clustered gap 1 title offset character 2, 0.25, 0
set datafile missing '-'
set style data histograms

set ylabel "The time to receive data from M-MSD/client (ms)"
#set grid xtics

set xtics border in scale 0,0 nomirror rotate by -15 offset character 0, 0, 0 autojustify
set xtics  norangelimit font ",11"
set xtics   ()
set ytics border in scale 0,0 mirror norotate offset character 0, 0, 0 autojustify
set ztics border in scale 0,0 nomirror norotate offset character 0, 0, 0 autojustify
set cbtics border in scale 0,0 mirror norotate offset character 0, 0, 0 autojustify
set rtics axis in scale 0,0 nomirror norotate offset character 0, 0, 0 autojustify
set xlabel offset character 0, -2, 0 font "" textcolor lt -1 norotate
i = 23
set style fill transparent pattern 6 bo

#set title "Ocorrências com Flagrante"
plot 'synctime.dat' using 2:xtic(1) with boxes title columnhead fill transparent solid 0.8 lc rgb 'skyblue', '' using 3 with boxes title columnhead lc rgb 'royalblue'

reset;


PROGRAMS_TO_SET="gtk-3.0      \
                 plank        \
                 Thunar       \
                 transmission \
                 xfce";


for PROGRAM in $PROGRAMS_TO_SET; do
    $PROGRAM/install.sh
done;

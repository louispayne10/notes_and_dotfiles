#!/bin/bash

# '#RRGGBBAA'

BLANK='#00000000'
CLEAR='#ffffff22'
#DEFAULT='#ddddddcc'
#TEXT='#aaaaaa88'
#WRONG='#880000bb'
#VERIFYING='#bb00bbbb'

. $HOME/.cache/wal/colors.sh
DEFAULT="${background:1:6}CC"
TEXT="${foreground:1:6}88"
WRONG="FF${background:3:4}BB"
VERIFYING="${color7:1:6}BB"

i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--screen 1                   \
--blur 5                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %d-%b"       \
--keylayout 1                \


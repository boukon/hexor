#!/bin/bash
#
# printfは必要なプログラムです。
#
# 古い用法、
# $ hexor aaA0fa 00bf34 4
# aa1f00ce$
#
# 今の用法、
# 「$ hexor aa 0f ee」と同義語 「$ hexor $(hexor aa 0f) ee」です。
# d_mojiにフラグは「-n 3」です。
a=$1; b=$2
[ "$3" ] && d_moji=$3 || d_moji=2
a_b=$((${#a}-${#b}))
[ $a_b -gt 0 ] && printf -v b $b%0${a_b}d   || {
[ $a_b -lt 0 ] && printf -v a $a%0$((0-a_b))d; }
printf %0${#a}x $((0x$a ^ 0x$b))

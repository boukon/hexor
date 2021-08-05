#!/bin/bash
#
# printfは必要なプログラムです。
#
# 用法、
# $ hexor aaA0fa 00bf34 4
# aa1f00ce$
a=$1; b=$2
[ "$3" ] && d_moji=$3 || d_moji=2
a_b=$((${#a}-${#b}))
[ $a_b -gt 0 ] && printf -v b $b%0${a_b}d   || {
[ $a_b -lt 0 ] && printf -v a $a%0$((0-a_b))d; }
for ((i=0; i < ${#a}; i+=d_moji)) {
 printf %0${d_moji}x $((
  0x${a:$i:$d_moji} ^ 0x${b:$i:$d_moji}
 ))
}

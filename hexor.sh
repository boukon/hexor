#!/bin/bash
#
# printfは必要なプログラムです。
#
# 用法、
# $ hexor aaA0fa 00bf34 4
# aa1f00ce$

# Ensure `a' is longer than `b'
[[ ${#1} -ge ${#2} ]] && { a=$1; b=$2; } || { b=$1; a=$2; }

[ "$3" ] && d_moji=$3 || {
 # default to 2 hex digits to 1 byte; this is Bash's own behavior.
 # Bash automatically prepends, if necessary, a zero to the last or only byte
 printf %0${#a}x $((0x$a ^ 0x$b)) 
 exit
}

# Ensure no syntax errors e.g. $((0x ^ 0x12))
a_b=$((${#a}-${#b}))
[ $a_b -gt 0 ] && printf -v b $b%0$((${#a}-${#b}))d

for ((i=0; i < ${#a}; i+=d_moji)) { # odd-byte
 printf %0${d_moji}x $((
  0x${a:$i:$d_moji} ^ 0x${b:$i:$d_moji}
 ))
}

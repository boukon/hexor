#!/bin/bash
# 用法、
# $ hexor aaA0fa 00bf34 4
# aa1f00ce$
a="$1"
b="$2"
[ "$3" ] && d_digits="$3" || d_digits=2
while [[ ${#a} -lt ${#b} ]]
 do a+=0
done
while [[ ${#b} -lt ${#a} ]]
 do b+=0
done
for ((i=0; i < ${#a}; i+=d_digits)) {
 printf %0${d_digits}x $((
  0x${a:$i:$d_digits} ^ 0x${b:$i:$d_digits}
 ))
}

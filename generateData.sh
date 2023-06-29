#!/bin/bash
s=20
g=1000
t=16.11685
sp=10000
pp=200000
gen=20000000
sps=0.000001
simphy -rs "$s" -rl f:"$g" -rg 1 -sb f:0.0000001 -sd f:0 -st f:$gen -sl f:"$sp" -so f:1 -si f:1 -sp f:$pp -su ln:-17.27461,0.6931472 -hh f:1 -hs ln:1.5,1 -hl ln:1.551533,0.6931472 -hg ln:1.5,1 -cs 14907 -v 3 -o 10k.species -ot 0 -op 1 -od 1 > log.txt 

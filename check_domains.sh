#!/bin/bash
lag_1="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/mitos_hmm10_10/types/lagli_1.csv"
lag_2="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/mitos_hmm10_10/types/lagli_2.csv"

uniq="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/mitos_hmm10_10/types/uniq.txt"
common="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/mitos_hmm10_10/types/common.txt"

>$uniq
>$common
IFS=$'\n'
for i in $(cat $lag_1); do
check=$(grep $i $lag_2 | wc -l)
if [[ $check == 0 ]]
then
echo $i >> $uniq
else
echo $i >> $common
fi
done
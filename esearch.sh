#!/bin/bash
mkdir ~/Desktop/Lab2021/mit_virus/02_2022/Basidiomycota_genomes_fasta

#you need to correct the IDs in ID.txt: .1 and :
#you may download not existes ID (MILT558140) - it will be the 0 byte file

for i in $(cat ../ID.txt); 
do
esearch -db nucleotide -query "$i" | efetch -format fasta > ~/Desktop/Lab2021/mit_virus/02_2022/Basidiomycota_genomes_fasta/$i.fasta
done

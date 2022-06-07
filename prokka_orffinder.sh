#!/bin/bash
mkdir ~/Desktop/Lab2021/mit_virus/02_2022/Basidiomycota_genomes_prokka 
mkdir ~/Desktop/Lab2021/mit_virus/02_2022/Basidiomycota_genomes_orffinder
for i in $(cat ../ID.txt); 
do

prokka ~/Desktop/Lab2021/mit_virus/02_2022/Basidiomycota_genomes_fasta/$i.fasta --outdir  ~/Desktop/Lab2021/mit_virus/02_2022/Basidiomycota_genomes_prokka/$i --force --kingdom 'Mitochondria' --gcode 4 --cpus 3

~/Desktop/Lab2021/mit_virus/ORFfinder -in ~/Desktop/Lab2021/mit_virus/02_2022/Basidiomycota_genomes_fasta/$i.fasta -c true -g 4 -out ~/Desktop/Lab2021/mit_virus/02_2022/Basidiomycota_genomes_orffinder/$i

done
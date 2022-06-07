#!/bin/bash

#for mitos
all_one="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/aa_fasta/all/all.fasta"
types_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/mitos_hmm10_10/cons_types_fasta/cons_types"
types_fasta_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/mitos_hmm10_10/cons_types_fasta"
mkdir $types_fasta_directory

grep -w -A 1 -Ff $types_directory/cox1.csv $all_one --no-group-separator > $types_fasta_directory/cox1.fasta 

#geting length for mitos every type 
types_stat_direcoty="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/mitos_hmm10_10/cons_types_fasta/stat"
mkdir $types_stat_direcoty


bioawk -cfastx '{ print $name, length($seq) }' $types_fasta_directory/cox1.fasta  > $types_stat_direcoty/cox1.csv


#for orffinder
#for mitos
all_one="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/Basidiomycota_genomes_orffinder/all_aa_fasta/all.fasta"
types_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/orffinder_hmm10_10/cons_types"
types_fasta_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/orffinder_hmm10_10/cons_types/cons_types_fasta"
mkdir $types_fasta_directory

grep -w -A 1 -Ff $types_directory/cox1.csv $all_one --no-group-separator > $types_fasta_directory/cox1.fasta 

#geting length for mitos every type 
types_stat_direcoty="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/orffinder_hmm10_10/cons_types/stat"
mkdir $types_stat_direcoty


bioawk -cfastx '{ print $name, length($seq) }' $types_fasta_directory/cox1.fasta  > $types_stat_direcoty/cox1.csv

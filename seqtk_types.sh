#!/bin/bash

#for mitos
all_one="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/aa_fasta/all/all.fasta"
types_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/mitos_hmm10_10/types"
types_fasta_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/mitos_hmm10_10/types_fasta"
mkdir $types_fasta_directory

for i in $(cat ../endo_types.txt);
do
grep -w -A 1 -Ff $types_directory/$i.csv $all_one --no-group-separator > $types_fasta_directory/$i.fasta 
done

#for orffinder
all_one="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/Basidiomycota_genomes_orffinder/all_aa_fasta/all.fasta"
types_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/orffinder_hmm10_10/types"
types_fasta_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/orffinder_hmm10_10/types_fasta"
mkdir $types_fasta_directory

for i in $(cat ../endo_types.txt);
do
grep -w -A 1 -Ff $types_directory/$i.csv $all_one --no-group-separator > $types_fasta_directory/$i.fasta 
done


#deleting duplicates
#awk '/^>/ { f = !a[$0]++ } f' $all_one_dup > $all_one
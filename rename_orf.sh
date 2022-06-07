#!/bin/bash

all_orf_nt_raw="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/nt_fasta/all_nt_fasta/all.fasta"
all_orf_nt="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/nt_fasta/all_nt_fasta/all_ORF.fasta"
all_orf_aa="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/aa_fasta/all_aa_fasta/all.fasta"
new_all_orf_aa="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/aa_fasta/all_aa_fasta/all_new.fasta"
new_all_orf_nt="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/nt_fasta/all_nt_fasta/all_new.fasta"
dir_orf_nt="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/nt_fasta"
dir_orf_aa="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/aa_fasta"
help_file="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/help_file.fasta"
aa_seq_list="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/aa_fasta/aa_seq_list.txt"

#merging all in one with deleting "_" for IDs and one-line fasta
> $all_orf_nt_raw
cat $dir_orf_nt/*.fas | awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' | grep "\S" | sed 's/_//' >> $all_orf_nt_raw

> $all_orf_aa
cat $dir_orf_aa/*.faa | awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' | grep "\S" | sed 's/_//' >> $all_orf_aa

#geting dna seq only for predicted ORFs
grep ">" $all_orf_aa > $aa_seq_list
IFS=$'\n'
for i in $(cat $aa_seq_list)
do
grep -A1 $i $all_orf_nt_raw >> $all_orf_nt
done

# start renaming
>$new_all_orf_aa
>$new_all_orf_nt
>$help_file
> ../SP_ID.txt
#renaming for protein seq
for ID in $(cat ../ID_for_mitos.txt); 
do
SP=$(grep $ID ../ID_species.csv | awk '{print $1 }')
echo $ID 
echo ${SP}_${ID} >> ../SP_ID.txt
grep -A1 $ID $all_orf_aa > $help_file
num_seq=$(grep -o '>' $help_file | wc -l)
echo $num_seq
for ((i=1;i<=$num_seq;i++));
do
echo $i
sed -i "0,/.*>.*/s/.*>.*/>${SP}_${ID}_${i}/" $help_file
grep -m1 -A1 "\>" $help_file >> $new_all_orf_aa
sed -i 1,2d $help_file
done
done

#renaming for nucleotide seq
>$help_file
for ID in $(cat ../ID_for_mitos.txt); 
do
SP=$(grep $ID ../ID_species.csv | awk '{print $1 }')
echo $ID 
echo $SP
grep -A1 $ID $all_orf_nt > $help_file
num_seq=$(grep -o '>' $help_file | wc -l)
echo $num_seq
for ((i=1;i<=$num_seq;i++));
do
echo $i
sed -i "0,/.*>.*/s/.*>.*/>${SP}_${ID}_${i}/" $help_file
grep -m1 -A1 "\>" $help_file >> $new_all_orf_nt
sed -i 1,2d $help_file
done
done
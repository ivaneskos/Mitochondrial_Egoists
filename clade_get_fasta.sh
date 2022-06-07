#!/bin/bash

#for mitos
all_one_aa="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/aa_fasta/all_aa_fasta/all_new.fasta"
all_one_nt="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/nt_fasta/all_nt_fasta/all_new.fasta"

trees_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees"
trees_list="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/trees_list.txt"

for tree in $(cat $trees_list);
do
ls $trees_directory/$tree | grep -v "clades_list" > $trees_directory/$tree/clades_list.txt
> $trees_directory/leafs_number/${tree}_num_leafs.txt
for clade in $(cat $trees_directory/$tree/clades_list.txt)
do
echo $clade
cat $trees_directory/$tree/$clade/leafs_list.txt | wc -l >> $trees_directory/leafs_number/${tree}_num_leafs.txt
> $trees_directory/$tree/$clade/leafs_aa.fasta  
> $trees_directory/$tree/$clade/leafs_nt.fasta 
for leaf in $(cat $trees_directory/$tree/$clade/leafs_list.txt)
do
grep -w -A 1 -F $leaf $all_one_aa --no-group-separator >> $trees_directory/$tree/$clade/leafs_aa.fasta
grep -w -A 1 -F $leaf $all_one_nt --no-group-separator >> $trees_directory/$tree/$clade/leafs_nt.fasta 
done
# bioawk -cfastx '{print length($seq)}' $trees_directory/$tree/$clade/leafs_aa.fasta
# bioawk -cfastx '{print length($seq)}' $trees_directory/$tree/$clade/leafs_nt.fasta 
done
done
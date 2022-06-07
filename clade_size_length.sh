#!/bin/bash
trees_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees"
trees_list="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/trees_list.txt"

mkdir $trees_directory/PAML_results/PAML_all/alignment_length
for tree in $(cat $trees_list);
do
> $trees_directory/PAML_results/PAML_all/alignment_length/$tree.csv
> $trees_directory/PAML_results/PAML_all/leafs_number/$tree.csv
for clade in $(cat $trees_directory/$tree/clades_list.txt)
do
head -1 $trees_directory/$tree/$clade/for_PAML/${tree}_${clade}.pal2nal | awk '{print $2 }' >> $trees_directory/PAML_results/PAML_all/alignment_length/$tree.csv
head -1 $trees_directory/$tree/$clade/for_PAML/${tree}_${clade}.pal2nal | awk '{print $1 }' >> $trees_directory/PAML_results/PAML_all/leafs_number/$tree.csv
done
done

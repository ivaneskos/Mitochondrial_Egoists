#!/bin/bash
trees_list="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/trees_list.txt"
paml_results="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/PAML_results"
paml_tree_results_all="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/PAML_results/PAML_tree_all"
paml_results_all="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/PAML_results/PAML_all"
mkdir $paml_results_all
mkdir $paml_tree_results_all

for i in $(cat $trees_list)
do
cp $paml_results/$i/PAML_tree_dnds_table.csv $paml_tree_results_all/$i.csv
cat $paml_results/$i/PAML_dnds_table.csv | sed '1d' | awk '{print $3 }' > $paml_results_all/paired_$i.csv
done
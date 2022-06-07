#!/bin/bash

#for mitos_hmmsearch
new_all_orf_aa="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/aa_fasta/all_aa_fasta/all_new.fasta"
domains_list="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/all_domains_list.txt"
# domains_list="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/target_domains_list.txt"

hmmserch_table="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/renamed_mitos_hmm10_10/table_clean.txt"
result_csv_dir="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/renamed_mitos_hmm10_10/all_domains_csv"
# result_csv_dir="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/renamed_mitos_hmm10_10/domains_csv"

result_fasta_dir="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/renamed_mitos_hmm10_10/all_domains_fasta"
# result_fasta_dir="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/renamed_mitos_hmm10_10/domains_fasta"

result_stat_dir="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/renamed_mitos_hmm10_10/all_domains_fasta_stat"
# result_stat_dir="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/renamed_mitos_hmm10_10/all_domains_fasta_stat"

genomes_list="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/ID_for_mitos.txt"
all_domain_per_genome_stat="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/renamed_mitos_hmm10_10/all_domain_per_genome_stat"
all_uniq_genes_list="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/renamed_mitos_hmm10_10/all_uniq_genes.txt"
all_uniq_genes_per_genome="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/renamed_mitos_hmm10_10/all_domain_per_genome_stat/all_uniq_genes_per_genome.csv"

mkdir $result_csv_dir
mkdir $result_fasta_dir
mkdir $result_stat_dir
mkdir $all_domain_per_genome_stat

cat $hmmserch_table | awk  '{print $3 }' | sort | uniq > $domains_list
cat $hmmserch_table | awk  '{print $1 }' | sort | uniq > $all_uniq_genes_list

> $all_uniq_genes_per_genome
for genome in $(cat $genomes_list)
do
cat $all_uniq_genes_list | grep $genome | wc -l >> $all_uniq_genes_per_genome
done

for domain in $(cat $domains_list)
do
grep $domain $hmmserch_table | awk '{print $1 }' > $result_csv_dir/${domain}_genes_list.txt
grep -w -A 1 -Ff $result_csv_dir/${domain}_genes_list.txt $new_all_orf_aa --no-group-separator > $result_fasta_dir/${domain}_genes.fasta
bioawk -cfastx '{ print $name, length($seq) }' $result_fasta_dir/${domain}_genes.fasta > $result_stat_dir/${domain}_fasta_stat.csv
echo $domain > $all_domain_per_genome_stat/$domain.csv 
for genome in $(cat $genomes_list)
do
cat $result_csv_dir/${domain}_genes_list.txt | awk  '{print $1 }' | sort | uniq | grep $genome | wc -l >> $all_domain_per_genome_stat/$domain.csv
done
done


#!/bin/bash
fasta_dir="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/renamed_mitos_hmm10_10/domains_fasta"
size_filtered_fasta_dir="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/renamed_mitos_hmm10_10/domains_fasta_size_filtered"
mkdir $size_filtered_fasta_dir

domain="LAGLIDADG_1"
bioawk -cfastx '(length($seq)<320){print ">" $name"\n"$seq}' $fasta_dir/${domain}_genes.fasta | bioawk -cfastx '(length($seq)>220){print ">" $name"\n"$seq}' > $size_filtered_fasta_dir/${domain}_genes.fasta

domain="LAGLIDADG_2"
bioawk -cfastx '(length($seq)<220){print ">" $name"\n"$seq}' $fasta_dir/${domain}_genes.fasta | bioawk -cfastx '(length($seq)>170){print ">" $name"\n"$seq}' > $size_filtered_fasta_dir/${domain}_genes.fasta

domain="COX1"
bioawk -cfastx '(length($seq)>200){print ">" $name"\n"$seq}' $fasta_dir/${domain}_genes.fasta > $size_filtered_fasta_dir/${domain}_genes.fasta

domain="COX2"
bioawk -cfastx '(length($seq)<300){print ">" $name"\n"$seq}' $fasta_dir/${domain}_genes.fasta | bioawk -cfastx '(length($seq)>200){print ">" $name"\n"$seq}' > $size_filtered_fasta_dir/${domain}_genes.fasta

domain="COX3"
bioawk -cfastx '(length($seq)<300){print ">" $name"\n"$seq}' $fasta_dir/${domain}_genes.fasta | bioawk -cfastx '(length($seq)<300){print ">" $name"\n"$seq}' > $size_filtered_fasta_dir/${domain}_genes.fasta

domain="COX2_TM"
bioawk -cfastx '(length($seq)<300){print ">" $name"\n"$seq}' $fasta_dir/${domain}_genes.fasta | bioawk -cfastx '(length($seq)>200){print ">" $name"\n"$seq}' > $size_filtered_fasta_dir/${domain}_genes.fasta

domain="GIY-YIG"
cat $fasta_dir/${domain}_genes.fasta > $size_filtered_fasta_dir/${domain}_genes.fasta

domain="Intron_maturas2"
cat $fasta_dir/${domain}_genes.fasta > $size_filtered_fasta_dir/${domain}_genes.fasta


# LAGLIDADG_1
# LAGLIDADG_2
# LAGLIDADG_3
# GIY-YIG
# Intron_maturas2
# COX1
# COX2
# COX2_TM
# COX3
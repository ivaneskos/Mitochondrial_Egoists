#!/bin/bash
all_orf="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/nt_fasta/all_aa_fasta/all.fasta"
orf_sep="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/nt_fasta"
mkdir /media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/nt_fasta/all_aa_fasta/

> $all_orf
cat $orf_sep/*.fas >> $all_orf
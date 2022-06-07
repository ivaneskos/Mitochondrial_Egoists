#!/bin/bash

#hmmsearch for mitos2

new_all_orf_aa="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/aa_fasta/all_aa_fasta/all_new.fasta"
result_dir="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/renamed_mitos_hmm10_10"
pfam_hmm="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/Pfam-A.hmm"


mkdir $result_dir
hmmsearch -o $result_dir/output.txt -A $result_dir/align.txt --tblout $result_dir/table.txt --notextw -E 1e-10 --cpu 3 $pfam_hmm $new_all_orf_aa
grep -v "#" $result_dir/table.txt > $result_dir/table_clean.txt


#нужно удалить "partial" из аннотации вручную (или код придумать)

# > $all_orf
# #merging to one file
# for i in $(cat ../ID.txt); 
# do
# cat $orf_sep/$i | awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' | grep "\S" >> $all_orf
# done

# out_orf="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/out_orf.txt"
# out_prokka="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/out_prokka.txt"
# hmmsearch --tblout $out_orf -E 1e-5 --cpu 3 $pfam_hmm $all_orf
# hmmsearch --tblout $out_prokka -E 1e-5 --cpu 3 $pfam_hmm $all_orf


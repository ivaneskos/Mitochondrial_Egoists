#!/bin/bash
all_one_aa="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/aa_fasta/all_aa_fasta/all_new.fasta"
all_one_nt="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/mitos2_basidiomycota/nt_fasta/all_nt_fasta/all_new.fasta"

trees_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees"
trees_list="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/trees_list.txt"

parsing_script="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/PAML/PAML/dnds/parse_codeml_output.py"
codeml_param="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/PAML/PAML/codeml.ctl"

for tree in $(cat $trees_list);
do
mkdir $trees_directory/PAML_results
mkdir $trees_directory/PAML_results/$tree

echo "Gene_1	Gene_2	dnds	dN	dS" > $trees_directory/PAML_results/$tree/PAML_dnds_table.csv
> $trees_directory/PAML_results/$tree/PAML_number_of_dnds.csv

for clade in $(cat $trees_directory/$tree/clades_list.txt)
do
rm -r $trees_directory/$tree/$clade/for_PAML
mkdir $trees_directory/$tree/$clade/for_PAML
#for paiwise PAML

# sed -i "s/\*//g" $trees_directory/$tree/$clade/leafs_aa.fasta
clustalo -i $trees_directory/$tree/$clade/leafs_aa.fasta -o $trees_directory/$tree/$clade/for_PAML/aa_leafs.aln.faa
pal2nal.pl $trees_directory/$tree/$clade/for_PAML/aa_leafs.aln.faa $trees_directory/$tree/$clade/leafs_nt.fasta -output paml -nogap > $trees_directory/$tree/$clade/for_PAML/${tree}_${clade}.pal2nal
cp $codeml_param $trees_directory/$tree/$clade/for_PAML/codeml.ctl
sed -i "s/pal2nal_file/${tree}_${clade}.pal2nal/" $trees_directory/$tree/$clade/for_PAML/codeml.ctl
sed -i "s/codeml_txt/${tree}_${clade}.txt/" $trees_directory/$tree/$clade/for_PAML/codeml.ctl
cd $trees_directory/$tree/$clade/for_PAML
codeml 

python $parsing_script $trees_directory/$tree/$clade/for_PAML/${tree}_${clade}.txt > $trees_directory/$tree/$clade/for_PAML/codeml_output.csv
num_lines=$(cat $trees_directory/$tree/$clade/for_PAML/codeml_output.csv | sed '1d' | grep "\S" |  wc -l)
echo "$clade    $num_lines" >> $trees_directory/PAML_results/$tree/PAML_number_of_dnds.csv
if [[ num_lines!=0 ]]
then
cat $trees_directory/$tree/$clade/for_PAML/codeml_output.csv | sed '1d' | grep "\S" >> $trees_directory/PAML_results/$tree/PAML_dnds_table.csv
fi
# num_lines=$(cat $trees_directory/$tree/$clade/for_PAML/codeml_output.csv | sed -i 1d | grep "\S" |  wc -l)
# echo "$clade    $num_lines" >> $trees_directory/PAML_results/$tree/number_of_dnds.csv
# if [[ num_lines!=0 ]]
# then
# grep "\S" $trees_directory/$tree/$clade/for_PAML/codeml_output.csv >> $trees_directory/PAML_results/$tree/dnds_table.csv
# fi
done
done

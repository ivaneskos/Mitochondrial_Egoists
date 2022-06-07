library(stringr)
library(dplyr)
library(tidyr)
library(magrittr)
library(stringi)
library(data.table)
library(ggpubr)
library(todor)
library(ggplot2)
"%+%" <- function(...){
  paste0(...)
}
install.packages("rstatix")
install.packages("datarium")

setwd("/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/PAML_results/PAML_all")
domains_list <- read.table("/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/target_domains_list.txt", header = FALSE, sep = "\n")
domains_list <- split(domains_list, seq(nrow(domains_list)))

for (domain in domains_list){
  domain_file = 
   <- read.csv ("paired_COX1.csv", header = TRUE)
  for (){}
    
}
}
  



setwd("/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/trees/PAML_results/PAML_all") 
COX1 <- read.csv ("paired_COX1.csv", header = TRUE)
COX2 <- read.csv ("paired_COX2.csv", header = TRUE)
COX2_TM <- read.csv ("paired_COX2_TM.csv", header = TRUE)
COX3 <- read.csv ("paired_COX3.csv", header = TRUE)
Intron <- read.csv ("paired_Intron_maturas2.csv", header = TRUE)
LAGLIDADG_1 <- read.csv ("paired_LAGLIDADG_1.csv", header = TRUE)
LAGLIDADG_2 <- read.csv ("paired_LAGLIDADG_2.csv", header = TRUE)

max.len <- max(length(x), length(y))
x = c(x, rep(NA, max.len - length(x)))
y = c(y, rep(NA, max.len - length(y)))

max_len <- max(length(COX1), length(COX2))
, length(COX2_TM), length(COX3), length(Intron), length(LAGLIDADG_1), length(LAGLIDADG_2))
COX1 <- c(COX1, rep(NA, max_len - length(COX1)))

print (max_len)
for_violine_1 <- for_violine_1 %>% rename(all_CDS = V1)
for_violine_1$all_egoistic <- all_endo_intron[, c("all_endo_intron")]
for_violine_1$all_COX <- all_COX[, c("all_COX")]
for_violine_1 <- for_violine_1 %>% filter(all_CDS > 0)

test_1 <- stack(for_violine_1)
test_1 <- test_1 %>% rename(Gene_groups = ind)


ggplot(test_1, aes(x = Gene_groups, y = values, colour = Gene_groups, fill=Gene_groups)) + geom_violin() +
  xlab("") + ylab("Number of genes per genome") +
  scale_colour_manual(values=c("#178a90", "#125d14", "brown")) + 
  scale_fill_manual(values=c("#b4f8fc", "#DAF7A6", "#FFC300")) + 
  geom_jitter(shape=16, position=position_jitter(0.2), colour = "#6e6343", size=1) +
  geom_boxplot(width=0.05) + theme_classic()
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/violin_plots_all_CDS_all_endo_all_COX.png")



#len_diagram for MITOS2
all_stat_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/renamed_mitos_hmm10_10/domains_fasta_stat"
picture_directoty="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/renamed_mitos_hmm10_10/domains_fasta_picture"
annot_method="MITOS2"
dir.create(picture_directoty)

domains_list <- read.table("/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/target_domains_list.txt", header = FALSE, sep = "\n")
domains_list <- split(domains_list, seq(nrow(domains_list)))

for (domain in domains_list){
  print (domain)
  domains_fasta_stat_file=all_stat_directory %+% "/" %+% domain %+% "_fasta_stat.csv"
  stat_file <- read.table(domains_fasta_stat_file, header = FALSE)
  plot_name=annot_method %+% ": Distribution of " %+% domain %+% " lengths"
  pict_file_name= picture_directoty %+% "/" %+% domain %+%  "_lenth_distribution.png"
  
  ggplot(stat_file, aes(x=V2)) + geom_histogram(binwidth=10, color="black", fill="white") + 
  ggtitle(plot_name) + geom_vline(aes(xintercept = mean(V2)),color="blue", linetype="dashed", size=1) +
  xlab("length (aa)") + ylab("Number of sequences") + theme(plot.title = element_text(hjust = 0.5))
  ggsave(pict_file_name)
}


#cox1_diagram
all_stat_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/mitos_hmm10_10/cons_types_fasta/stat"
picture_directoty="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/mitos_hmm10_10/cons_types_fasta/types_picture"
dir.create(picture_directoty)

type_file_name=all_stat_directory %+% "/" %+% "cox1.csv"
if (file.info(type_file_name)$size == 0) { next }
type_file <- read.table(type_file_name, header = FALSE)
plot_name="MITOS: Distribution of COX1 lengths"
pict_file_name= picture_directoty %+% "/" %+% "cox1.png"
  ggplot(type_file, aes(x=V2)) + geom_histogram(binwidth=10, color="black", fill="white") + 
    ggtitle(plot_name) + geom_vline(aes(xintercept = mean(V2)),color="blue", linetype="dashed", size=1) +
    xlab("length (aa)") + ylab("Number of sequences")
  ggsave(pict_file_name)



#conservatives: parsing the table for mitos
all_seq_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/mitos_hmm10_10"
setwd(all_seq_directory)
all_seq_file=all_seq_directory %+% "/table_clean.txt"


Mitos <- read.table(all_seq_file, header = FALSE)
Mitos$space <- " "
Mitos$ID <- str_c(Mitos$V1, Mitos$space, Mitos$V19, Mitos$space, Mitos$V20, Mitos$space, Mitos$V21)
cox1 <- 
  Mitos %>% distinct() %>% filter(V3 == "COX1") %>% select(ID)

results_path=all_seq_directory %+% "/conservatives_types"
dir.create(results_path)
setwd(results_path)

write.table(cox1, file = "cox1.csv", quote = FALSE, row.names = FALSE, col.names = FALSE)



#conservatives: parsing the table for orffinder
all_seq_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/orffinder_hmm10_10"
setwd(all_seq_directory)
all_seq_file=all_seq_directory %+% "/table_clean.txt"


Mitos <- read.table(all_seq_file, header = FALSE)
Mitos$space <- " "
Mitos$ID <- str_c(Mitos$V1, Mitos$space, Mitos$V19, Mitos$space, Mitos$V20, Mitos$space, Mitos$V21)
cox1 <- 
  Mitos %>% distinct() %>% filter(V3 == "COX1") %>% select(ID)

results_path=all_seq_directory %+% "/conservatives_types"
dir.create(results_path)
setwd(results_path)

write.table(cox1, file = "cox1.csv", quote = FALSE, row.names = FALSE, col.names = FALSE)




#creating the diograms for distribution of length for each type of endonucleases
#mitos
types_list <- read.table("/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/endo_types.txt", header = FALSE, sep = "\n")
types_list <- split(types_list, seq(nrow(types_list)))

all_stat_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/mitos_hmm10_10/types_stat"
picture_directoty="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/mitos_hmm10_10/types_picture"
dir.create(picture_directoty)

for (type in types_list){
  type_file_name=all_stat_directory %+% "/" %+% type %+% ".csv"
  if (file.info(type_file_name)$size == 0) { next }
  type_file <- read.table(type_file_name, header = FALSE)
  plot_name="MITOS: Distribution of " %+% type %+% " lengths"
  pict_file_name= picture_directoty %+% "/" %+% type %+% ".png"
  
  ggplot(type_file, aes(x=V2)) + geom_histogram(binwidth=10, color="black", fill="white") + 
    ggtitle(plot_name) + geom_vline(aes(xintercept = mean(V2)),color="blue", linetype="dashed", size=1) +
    xlab("length (aa)") + ylab("Number of sequences")
  ggsave(pict_file_name)
}

#same, but for orffider
types_list <- read.table("/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/endo_types.txt", header = FALSE, sep = "\n")
types_list <- split(types_list, seq(nrow(types_list)))

all_stat_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/orffinder_hmm10_10/types_stat"
picture_directoty="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/orffinder_hmm10_10/types_picture"
dir.create(picture_directoty)

for (type in types_list){
  type_file_name=all_stat_directory %+% "/" %+% type %+% ".csv"
  if (file.info(type_file_name)$size == 0) { next }
  type_file <- read.table(type_file_name, header = FALSE)
  plot_name="ORFFINDER: Distribution of " %+% type %+% " lengths"
  pict_file_name= picture_directoty %+% "/" %+% type %+% ".png"
  
  ggplot(type_file, aes(x=V2)) + geom_histogram(binwidth=10, color="black", fill="white") + 
    ggtitle(plot_name) +
    geom_vline(aes(xintercept = mean(V2)),color="blue", linetype="dashed", size=1) +
    xlab("length (aa)") + ylab("Number of sequences")
  ggsave(pict_file_name)
}





#parsing the table for mitos
all_seq_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/mitos_hmm10_10"
setwd(all_seq_directory)
all_seq_file=all_seq_directory %+% "/table_clean.txt"


Mitos <- read.table(all_seq_file, header = FALSE)
Mitos$space <- " "
Mitos$ID <- str_c(Mitos$V1, Mitos$space, Mitos$V19, Mitos$space, Mitos$V20, Mitos$space, Mitos$V21)
mitos_lagli_1 <- 
  Mitos %>% distinct() %>% filter(V3 == "LAGLIDADG_1") %>% select(ID)
mitos_lagli_2 <- 
  Mitos %>% distinct() %>% filter(V3 == "LAGLIDADG_2") %>% select(ID)
mitos_lagli_3 <- 
  Mitos %>% distinct() %>% filter(V3 == "LAGLIDADG_3") %>% select(ID)
mitos_HNH <- 
  Mitos %>% distinct() %>% filter(V3 == "HNH") %>% select(ID)
mitos_GIY  <- 
  Mitos %>% distinct() %>% filter(V3 == "GIY-YIG") %>% select(ID)

results_path=all_seq_directory %+% "/types"
dir.create(results_path)
setwd(results_path)

write.table(mitos_lagli_1, file = "lagli_1.csv", quote = FALSE, row.names = FALSE, col.names = FALSE)
write.table(mitos_lagli_2, file = "lagli_2.csv", quote = FALSE, row.names = FALSE, col.names = FALSE)
write.table(mitos_lagli_3, file = "lagli_3.csv", quote = FALSE, row.names = FALSE, col.names = FALSE)
write.table(mitos_HNH, file = "HNH.csv", quote = FALSE, row.names = FALSE, col.names = FALSE)
write.table(mitos_GIY, file = "GIY.csv", quote = FALSE, row.names = FALSE, col.names = FALSE)




#for orffinder
all_seq_directory="/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/hmmerscan/orffinder_hmm10_10"
setwd(all_seq_directory)
all_seq_file=all_seq_directory %+% "/table_clean.txt"


Mitos <- read.table(all_seq_file, header = FALSE)
Mitos$space <- " "
Mitos$ID <- Mitos$V1
mitos_lagli_1 <- 
  Mitos %>% distinct() %>% filter(V3 == "LAGLIDADG_1") %>% select(ID)
mitos_lagli_2 <- 
  Mitos %>% distinct() %>% filter(V3 == "LAGLIDADG_2") %>% select(ID)
mitos_lagli_3 <- 
  Mitos %>% distinct() %>% filter(V3 == "LAGLIDADG_3") %>% select(ID)
mitos_HNH <- 
  Mitos %>% distinct() %>% filter(V3 == "HNH") %>% select(ID)
mitos_GIY  <- 
  Mitos %>% distinct() %>% filter(V3 == "GIY-YIG") %>% select(ID)

results_path=all_seq_directory %+% "/types"
dir.create(results_path)
setwd(results_path)

write.table(mitos_lagli_1, file = "lagli_1.csv", quote = FALSE, row.names = FALSE, col.names = FALSE)
write.table(mitos_lagli_2, file = "lagli_2.csv", quote = FALSE, row.names = FALSE, col.names = FALSE)
write.table(mitos_lagli_3, file = "lagli_3.csv", quote = FALSE, row.names = FALSE, col.names = FALSE)
write.table(mitos_HNH, file = "HNH.csv", quote = FALSE, row.names = FALSE, col.names = FALSE)
write.table(mitos_GIY, file = "GIY.csv", quote = FALSE, row.names = FALSE, col.names = FALSE)




#creating a massive with counts of mobile elements and IDs
ID <- read.table("ID.txt", header = FALSE)
helitrons <- read.table("/home/ivan/Desktop/Lab2021/mit_virus/02_2022/EDTA_results/Helitrons.csv", header = FALSE)
TIR <- read.table("/home/ivan/Desktop/Lab2021/mit_virus/02_2022/EDTA_results/TIR.csv", header = FALSE)
LTR <- read.table("/home/ivan/Desktop/Lab2021/mit_virus/02_2022/EDTA_results/LTR.csv", header = FALSE)
results <- data.frame(ID, TIR, helitrons, LTR) 
colnames(results)<- c("ID", "TIR", "helitron", "LTR")
helitrons_ID <-
  results %>% filter(helitrons!=0) %>% select(ID)
TIR_ID <-
  results %>% filter(TIR!=0) %>% select(ID)
LTR_ID <-
  results %>% filter(LTR!=0) %>% select(ID)
any_ID <-
  results %>% filter(LTR!=0 | TIR!=0 | helitrons!=0) %>% select(ID)
all_ID <-
  results %>% filter(LTR!=0 & TIR!=0 & helitrons!=0) %>% select(ID)

transposons_summary_table <- data.frame (Transposon_type  = c("DNA-transposons: cut-and-paste", "DNA-transposons: Helitrons", "RNA-transposons", "Any type"),
                  Number_of_species_with_transposon = c(25, 3, 1, 27)
)

ggplot(hel_length, aes(x=length)) + 
  geom_histogram(color="black", fill="white") +
  geom_vline(aes(xintercept=mean(width(seqs))), color="blue", linetype="dashed", size=1) + ggtitle("Distribution of helitron's length") +
  xlab("length (nt)")
ggsave("~/Desktop/Lab2021/mit_virus/02_2022/EDTA_mix/helitron/all/helitron_length.png")




#parsing_all
mtGenomes <- read.csv("organelles.csv", header = TRUE, sep = ",")
mtGenomes <-
  mtGenomes %>% separate(Replicons, c("NCBI", "Genbank"), "/")
our2 <- mtGenomes[, c("X.Organism.Name", "NCBI")]
write.table(our2, file = "ID_species.txt", sep = "\t", quote = FALSE, row.names = FALSE, col.names = FALSE)



#table of helitrons length
setwd("~/Desktop/Lab2021/mit_virus/02_2022/EDTA_mix/helitron/all")
library(Biostrings); 
seqs <- readDNAStringSet("helitrons_all.fa"); 
write.table(data.frame(name=names(seqs), length=width(seqs)), file = "helitron_length.txt", quote=F, row.names=F)
hel_length <- data.frame(name=names(seqs), length=width(seqs))

ggplot(hel_length, aes(x=length)) + 
  geom_histogram(color="black", fill="white") +
  geom_vline(aes(xintercept=mean(width(seqs))), color="blue", linetype="dashed", size=1) + ggtitle("Distribution of helitron's length") +
  xlab("length (nt)")
ggsave("~/Desktop/Lab2021/mit_virus/02_2022/EDTA_mix/helitron/all/helitron_length.png")

#table of ltr length
setwd("~/Desktop/Lab2021/mit_virus/02_2022/EDTA_mix/LTR/all")
library(Biostrings); 
seqs <- readDNAStringSet("LTR_Rhizoctonia.fa"); 
write.table(data.frame(name=names(seqs), length=width(seqs)), file = "ltr_length.txt", quote=F, row.names=F)
ltr_length <- data.frame(name=names(seqs), length=width(seqs))

ggplot(ltr_length, aes(x=length)) + 
  geom_histogram(color="black", fill="white") +
  geom_vline(aes(xintercept=mean(width(seqs))), color="blue", linetype="dashed", size=1) + ggtitle("Distribution of retrotransposon's length") +
  xlab("length (nt)")
ggsave("~/Desktop/Lab2021/mit_virus/02_2022/EDTA_mix/LTR/all/ltr_length.png")


#finding Endonucleases by default annotation

mtEndo <- read.csv("/home/ivan/Desktop/Lab2021/mit_virus/fungi/scripts/NCBI_list_endonuclease.txt", header = TRUE, sep = "\t")
mtEndo_LAGLIDADG <- read.csv("/home/ivan/Desktop/Lab2021/mit_virus/fungi/scripts/NCBI_list_endonuclease_LAGLIDADG.txt", header = TRUE, sep = "\t")
mtEndo_GIY <- read.csv("/home/ivan/Desktop/Lab2021/mit_virus/fungi/scripts/NCBI_list_endonuclease_GIY.txt", header = TRUE, sep = "\t")


our2 <- mtGenomes[, c("NCBI")]
our3 <- mtGenomes[, c("X.Organism.Name", "NCBI", "Size.Mb.", "CDS")]
our3$endo_num <- mtEndo[, c("endo_num")]
# our3$endo_LAGLIDADG <- mtEndo_LAGLIDADG[, c("endo_num")]
# our3$endo_GIY <- mtEndo_GIY[, c("endo_num")]
# our3_filt <- our3 %>% filter(CDS > 2)
# our3_filt_endo <- our3_filt %>% filter(endo_num > 0)
# our3_filt_endo$k <- our3_filt_endo$endo_num / our3_filt_endo$Size.Mb.

write.table(our3, file = "raw.csv", sep = "\t", quote = FALSE, row.names = FALSE)
write.table(our3_filt, file = "filt_CDS.csv", sep = "\t", quote = FALSE, row.names = FALSE)
write.table(our3_filt_endo, file = "filt_ENDO.csv", sep = "\t", quote = FALSE, row.names = FALSE)

ggplot(data = our3, aes(x=CDS, y=Size.Mb.)) + geom_point() + stat_smooth()
ggsave("~/Desktop/Lab2021/mit_virus/fungi/CDS_smooth.png")

ggplot(data = our3, aes(x=CDS, y=Size.Mb.)) + geom_point() + stat_smooth() + xlim(0, 125) 
ggsave("~/Desktop/Lab2021/mit_virus/fungi/CDS_smooth.png")

ggplot(data = our3_filt, aes(x=CDS, y=Size.Mb.)) + xlim(0, 125) + geom_point() + stat_smooth()
ggsave("~/Desktop/Lab2021/mit_virus/fungi/CDS_filt_smooth.png")

ggplot(data = our3_filt, aes(endo_num)) + geom_bar() + labs(title = "Endonuclease number distribution", y = "Number of endonucleases")
ggsave("~/Desktop/Lab2021/mit_virus/fungi/endo_num_disc.png")

ggplot(data = our3_filt, aes(x=endo_num, y=Size.Mb.)) + xlim(0, 65) + geom_point() + stat_smooth()
ggsave("~/Desktop/Lab2021/mit_virus/fungi/endo_smooth.png")

ggplot(data = our3_filt_endo, aes(x=endo_num, y=Size.Mb.)) + xlim(0, 65) + geom_point() + stat_smooth()
ggsave("~/Desktop/Lab2021/mit_virus/fungi/endo_filt_smooth.png")

ggplot(data = our3_filt_endo, aes(x=endo_num, y=k)) + geom_point() + stat_smooth()  + labs(y = "k = endo_num / genome_size")
ggsave("~/Desktop/Lab2021/mit_virus/fungi/k_filt_smooth.png")

f_CDS <- ggplot(data = our3, aes(x=CDS, y=Size.Mb.)) + geom_point() + stat_smooth()
f_CDS
png(filename="~/Desktop/Lab2021/mit_virus/fungi/CDS_smooth.png")

ggplot(data = our3_filt_endo, aes(x=endo_LAGLIDADG, y=Size.Mb.)) + xlim(0, 60) + geom_point() + stat_smooth()
ggsave("~/Desktop/Lab2021/mit_virus/fungi/LAGLIDADG.png")

ggplot(data = our3_filt_endo, aes(x=endo_GIY, y=Size.Mb.)) + xlim(0, 8) + geom_point() + stat_smooth()
ggsave("~/Desktop/Lab2021/mit_virus/fungi/GIY.png")

f_GIY <- ggplot(data = our3, aes(x=endo_GIY, y=Size.Mb.)) + geom_point() + geom_smooth(method = "lm")
f_GIY
ggsave("GIY")


cor_endo <- cor(our3$Size.Mb., our3$endo_num, method = "pearson")
cor_endo
cor_CDS <- cor(our3$Size.Mb., our3$CDS, method = "pearson")
cor_CDS
cor_LAGLIDADG <- cor(our3$Size.Mb., our3$endo_LAGLIDADG, method = "pearson")
cor_LAGLIDADG
cor_GIY <- cor(our3$Size.Mb., our3$endo_GIY, method = "pearson")
cor_GIY

write.table(our2, file = "ID.txt", sep = "\t", quote = FALSE, row.names = FALSE)
write.table(our3, file = "size.csv", sep = "\t", quote = FALSE, row.names = FALSE)

hist(mtGenomes$Size.Mb., breaks=100, , xlim=c(0,0.3), main = paste("mtGenomes sizes distribution"))

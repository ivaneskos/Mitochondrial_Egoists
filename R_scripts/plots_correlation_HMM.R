install.packages("ggpubr")
library(stringr)
library(dplyr)
library(tidyr)
library(magrittr)
library(stringi)
library(data.table)
library(ggpubr)
library(todor)
library(ggplot2)
library(ggpubr)
"%+%" <- function(...){
  paste0(...)
}

setwd("/media/ivan/HDD2TB/ivan/Desktop/Lab2021/mit_virus/02_2022/for_R_scripts")
NCBI <- read.csv ("NCBI_table.csv", header = TRUE, sep=",")
MITOS_raw <- read.csv ("MITOS_CDS_number.csv", header = FALSE)
MITOS_hmmsearch <- read.csv ("MITOS_hmmsearch.csv", header = FALSE)
MITOS_hmmsearch$size <- NCBI[, c("Size.Mb.")] * 1000
MITOS_hmmsearch$MITOS_raw <- MITOS_raw[, c("V1")]

ggplot(data = NCBI, aes(y=all_endo, x=cds_density)) + geom_point() +
  ggtitle("CDS density ~ endonuclease number correlation") + geom_smooth(method=lm) +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Number of endonucleases ") + xlab("all_CDS/genome_size") + expand_limits(x=0, y=0)
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_endo/CDS_density_genome_size_correlation.png")



size <- read.csv ("size_genomes.csv", header = TRUE)
all_endo <- read.csv ("HMM_CDS_all_endo.csv", header = TRUE)
all <- read.csv ("HMM_CDS_all.csv", header = TRUE)
all_endo_intron <- read.csv ("HMM_CDS_all_endo_intron.csv", header = TRUE)
all_COX <- read.csv ("HMM_CDS_all_COX.csv", header = TRUE)
COX2 <- read.csv ("HMM_CDS_COX2.csv", header = TRUE)



all_endo$size <- size[, c("genome_size")]
all_endo$all_CDS <- all[, c("CDS_all")]
all_endo$all_COX <- all_COX[, c("all_COX")]
all_endo$COX2 <- COX2[, c("COX2")]
all_endo$cds_density <- all_endo$all_CDS / all_endo$size
all_endo$COX_density <- all_endo$all_COX / all_endo$size
all_endo$endo_density <- all_endo$all_endo / all_endo$size


all_endo <- all_endo %>% filter(all_CDS > 0)

ggplot(data = all_endo, aes(y=cds_density, x=size)) + geom_point() + stat_smooth() +
  ggtitle("CDS_density ~ genome size correlation") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("all_CDS/genome_size") + xlab("genome size") + expand_limits(x=0, y=0)
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_COX/CDS_density_correlation.png")

ggplot(data = all_endo, aes(y=COX_density, x=size)) + geom_point() + stat_smooth() +
  ggtitle("COX_density ~ genome size correlation") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("all_COX/genome_size") + xlab("genome size") + expand_limits(x=0, y=0)
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_COX/COX_density_correlation.png")

ggplot(data = all_endo, aes(y=endo_density, x=size)) + geom_point() + stat_smooth() +
  ggtitle("endo_density ~ genome size correlation") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("all_endo/genome_size") + xlab("genome size") + expand_limits(x=0, y=0)
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_COX/endo_density_correlation.png")


######################

ggplot(data = all_endo, aes(y=all_endo, x=cds_density)) + geom_point() + stat_smooth() +
  ggtitle("CDS density ~ endonuclease number correlation") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Number of endonucleases ") + xlab("all_CDS/genome_size") + expand_limits(x=0, y=0)
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_endo/CDS_density_endonuclease_number_correlation.png")



ggplot(data = all_endo, aes(x=all_CDS, y=all_endo)) + geom_point() + stat_smooth() +
  ggtitle("CDS ~ endonuclease number correlation") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("all_CDS") + ylab("Number of endonucleases") + expand_limits(x=0, y=0)
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_endo/CDS_endonuclease_number_correlation.png")


ggplot(data = all_endo, aes(x=all_CDS, y=all_endo_intron)) + geom_point() + stat_smooth() +
  ggtitle("CDS ~ endonuclease+intron number correlation") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("all_CDS") + ylab("Number of endonucleases and intron") + expand_limits(x=0, y=0)
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_endo/CDS_endonuclease_intron_number_correlation.png")


ggplot(data = all_endo, aes(x=all_CDS, y=all_COX)) + geom_point() + stat_smooth() +
  ggtitle("CDS ~ all COX number correlation") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("all_CDS") + ylab("Number of COX") + expand_limits(x=0, y=0)
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_COX/CDS_COX_number_correlation.png")

ggplot(data = all_endo, aes(x=all_CDS, y=COX2)) + geom_point() + stat_smooth() +
  ggtitle("CDS ~ COX2 number correlation") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("all_CDS") + ylab("Number of COX2") + expand_limits(x=0, y=0)
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_COX/CDS_COX2_number_correlation.png")


ggplot(data = all_endo, aes(x=cds_density, y=all_COX)) + geom_point() + stat_smooth() +
  ggtitle("CDS density ~ COX number correlation") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("all_CDS/genome_size") + ylab("Number of COX") + expand_limits(x=0, y=0)
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_COX/CDS_density_COX_number_correlation.png")


#violin plots
#ggplot(stack(for_violine), aes(x = factor(ind, levels = names(df)), y = values)) + geom_boxplot()

setwd("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_endo")

for_violine <- read.csv ("HMM_CDS_all.csv", header = TRUE)
all_endo <- read.csv ("HMM_CDS_all_endo.csv", header = TRUE)
all_COX <- read.csv ("HMM_CDS_all_COX.csv", header = TRUE)


for_violine$all_endo <- all_endo[, c("all_endo")]
for_violine$all_COX <- all_COX[, c("all_COX")]

for_violine <- for_violine %>% filter(all_COX > 0)

test <- stack(for_violine)
test <- test %>% rename(Gene_groups = ind)

ggplot(test, aes(x = Gene_groups, y = values, colour = Gene_groups, fill=Gene_groups), xTickLabelFont=c(14,"bold", "#993333")) + geom_violin() +
  xlab("") + ylab("Number of genes per genome") + 
  scale_colour_manual(values=c("#125d14", "brown", "#178a90")) + 
  scale_fill_manual(values=c("#DAF7A6", "#FFC300", "#b4f8fc")) + 
  geom_jitter(shape=16, position=position_jitter(0.2), colour = "#6e6343", size=1) +
  geom_boxplot(width=0.05) + theme_classic() 
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/violin_plots_all_endo_all_COX.png")

##################################################violin plots for all domains
setwd("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/HMM_CDS_types")

domains <- read.csv ("HMM_CDS_all.csv", header = TRUE)
cox1 <- read.csv ("HMM_CDS_COX1.csv", header = TRUE)
cox2 <- read.csv ("HMM_CDS_COX2.csv", header = TRUE)
cox3 <- read.csv ("HMM_CDS_COX3.csv", header = TRUE)
giy_yig <- read.csv ("HMM_CDS_GIY-YIG.csv", header = TRUE)
lagli_1 <- read.csv ("HMM_CDS_LAGLIDADG_1.csv", header = TRUE)
lagli_2 <- read.csv ("HMM_CDS_LAGLIDADG_2.csv", header = TRUE)
lagli_3 <- read.csv ("HMM_CDS_LAGLIDADG_3.csv", header = TRUE)

domains$COX1 <- cox1[, c("COX1")]
domains$COX2 <- cox2[, c("COX2")]
domains$COX3 <- cox3[, c("COX3")]
domains$GIY_YIG <- giy_yig[, c("GIY_YIG")]
domains$lagli_1 <- lagli_1[, c("LAGLIDADG_1")]
domains$lagli_2 <- lagli_2[, c("LAGLIDADG_2")]
domains$lagli_3 <- lagli_3[, c("LAGLIDADG_3")]

all_endo <- all_endo %>% filter(all_CDS > 0)

domains_1 <- stack(domains)
domains_1 <- domains_1 %>% rename(Gene_groups = ind)

ggplot(domains_1, aes(x = Gene_groups, y = values, colour = Gene_groups, fill=Gene_groups)) + geom_violin() +
  xlab("") + ylab("Number of genes in each genomes") +
  scale_colour_manual(values=c("#178a90", "#125d14", "brown", "#93098b", "#1708d3", "#606313", "#581845", "#f9040f", "#055a04")) + 
  scale_fill_manual(values=c("#b4f8fc", "#DAF7A6", "#FFC300", "#f5ccf2", "#cfcbfa", "#ebeeab", "#eedafc", "#fddadc", "#d5fcd5")) + 
  geom_jitter(shape=16, position=position_jitter(0.2), colour = "#6e6343", size=0.5) +
  ggtitle("Number of genes for each domain") +
  geom_boxplot(width=0.05) + theme_classic()
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/violine_plots_all_domains.png")


###################################more plots
setwd("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_COX_all_endo_new")

domains <- read.csv ("HMM_CDS_all.csv", header = TRUE)
cox1 <- read.csv ("HMM_CDS_COX1.csv", header = TRUE)
cox2 <- read.csv ("HMM_CDS_COX2.csv", header = TRUE)
cox3 <- read.csv ("HMM_CDS_COX3.csv", header = TRUE)
lagli_1 <- read.csv ("HMM_CDS_LAGLIDADG_1.csv", header = TRUE)
lagli_2 <- read.csv ("HMM_CDS_LAGLIDADG_2.csv", header = TRUE)
domains$COX_1_2_3 <- cox1$COX1 + cox2$COX2 + cox3$COX3
domains$LAGLIDADG_1_2 <- lagli_1$LAGLIDADG_1 + lagli_2$LAGLIDADG_2

domains <- domains %>% filter(all_CDS > 0)

test_1 <- stack(domains)
test_1 <- test_1 %>% rename(Gene_groups = ind)


ggplot(test_1, aes(x = Gene_groups, y = values, colour = Gene_groups, fill=Gene_groups)) + geom_violin() +
  xlab("") + ylab("Number of genes per genome") +
  scale_colour_manual(values=c("#178a90", "#125d14", "brown")) + 
  scale_fill_manual(values=c("#b4f8fc", "#DAF7A6", "#FFC300")) + 
  geom_jitter(shape=16, position=position_jitter(0.2), colour = "#6e6343", size=1) +
  geom_boxplot(width=0.05) + theme_classic()
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_COX_all_endo_new/violin_plots_all_CDS_all_COX_all_lagli.png")

  
  
###########################################plots for trees
setwd("/home/yana/Desktop/Vanyata/PAML_tree_all")

cox1 <- read.csv ("COX1.csv", header = TRUE)
cox2 <- read.csv ("COX2.csv", header = TRUE)
cox3 <- read.csv ("COX3.csv", header = TRUE)
lagli_1 <- read.csv ("LAGLIDADG_1.csv", header = TRUE)
lagli_2 <- read.csv ("LAGLIDADG_2.csv", header = TRUE)
 
cox1$COX2 <- cox2[, c("COX2_omega")]
cox1$COX3 <- cox3[, c("COX3_omega")] 
cox1$Lagli_1 <- lagli_1[, c("LAGLIDADG_1_omega")]
cox1$Lagli_2 <- lagli_2[, c("LAGLIDADG_2_omega")]


test_2 <- stack(cox1)
test_2 <- test_2 %>% rename(Gene_groups = ind)

ggplot(test_2, aes(x = Gene_groups, y = values, colour = Gene_groups, fill=Gene_groups)) + geom_violin() +
  xlab("") + ylab("omega") +
  scale_colour_manual(values=c("#178a90", "#125d14", "brown", "#93098b", "#1708d3")) + 
  scale_fill_manual(values=c("#b4f8fc", "#DAF7A6", "#FFC300", "#f5ccf2", "#cfcbfa")) + 
  geom_jitter(shape=16, position=position_jitter(0.2), colour = "#6e6343", size=1) +
  ggtitle("dN/dS ratio for each subtrees") +
  geom_boxplot(width=0.05) + theme_classic()
ggsave("/home/yana/Desktop/Vanyata/PAML_tree_all/violin_plots_dNdS_for_trees.png")

                

#plots for trees
setwd("/home/yana/Desktop/Vanyata/PAML_all")

cox1 <- read.csv ("paired_COX1.csv", header = TRUE)
cox2 <- read.csv ("paired_COX2.csv", header = TRUE)
cox3 <- read.csv ("paired_COX3.csv", header = TRUE)
lagli_1 <- read.csv ("paired_LAGLIDADG_1.csv", header = TRUE)
lagli_2 <- read.csv ("paired_LAGLIDADG_2.csv", header = TRUE)

cox1$COX2 <- cox2[, c("COX_2")]
cox1$COX3 <- cox3[, c("COX_3")] 
cox1$Lagli_1 <- lagli_1[, c("lagli_1")]
cox1$Lagli_2 <- lagli_2[, c("lagli_2")]


test_3 <- stack(cox1)
test_3 <- test_3 %>% rename(Gene_groups = ind)

ggplot(test_3, aes(x = Gene_groups, y = values, colour = Gene_groups, fill=Gene_groups)) + geom_violin() +
  xlab("") + ylab("omega") +
  scale_colour_manual(values=c("#178a90", "#125d14", "brown", "#93098b", "#1708d3", "#606313")) + 
  scale_fill_manual(values=c("#b4f8fc", "#DAF7A6", "#FFC300", "#f5ccf2", "#cfcbfa", "#ebeeab")) + 
  geom_jitter(shape=16, position=position_jitter(0.2), colour = "#6e6343", size=1) +
  ggtitle("Pairwise dN/dS ratio for each subtrees") +
  geom_boxplot(width=0.05) + theme_classic()
ggsave("/home/yana/Desktop/Vanyata/PAML_all/violin_plots_dNdS_for_trees.png")





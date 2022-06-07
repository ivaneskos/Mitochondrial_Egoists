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

setwd("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_COX_all_endo_new")

size <- read.csv ("size_genomes.csv", header = TRUE)
CDS_all <- read.csv ("HMM_CDS_all.csv", header = TRUE)
cox1 <- read.csv ("HMM_CDS_COX1.csv", header = TRUE)
cox2 <- read.csv ("HMM_CDS_COX2.csv", header = TRUE)
cox3 <- read.csv ("HMM_CDS_COX3.csv", header = TRUE)
lagli_1 <- read.csv ("HMM_CDS_LAGLIDADG_1.csv", header = TRUE)
lagli_2 <- read.csv ("HMM_CDS_LAGLIDADG_2.csv", header = TRUE)
RVT_1 <- read.csv ("RVT_1.csv", header = TRUE)

size$all_CDS <- CDS_all[, c("all_CDS")]
size$COX_1_2_3 <- cox1$COX1 + cox2$COX2 + cox3$COX3
size$LAGLIDADG_1_2 <- lagli_1$LAGLIDADG_1 + lagli_2$LAGLIDADG_2
size$cds_density <- size$all_CDS / size$genome_size
size$COX_density <- size$COX_1_2_3 / size$genome_size
size$endo_density <- size$LAGLIDADG_1_2 / size$genome_size
size$RVT_1 <- RVT_1[, c("RVT_1")]

size <- size %>% filter(all_CDS > 0)

#all_CDS - number of endonucleases
ggplot(data = size, aes(y=LAGLIDADG_1_2, x=all_CDS)) + geom_point() + stat_smooth() +
  ggtitle("CDS ~ endonuclease (lagli1, lagli2) number correlation") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("number of endonuclease genes") + xlab("all CDS") + expand_limits(x=0, y=0)
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_COX_all_endo_new/plots/CDS_endonuclease_number_correlation.png")


#CDS dencity - genome size
ggplot(data = size, aes(y=cds_density, x=genome_size)) + geom_point() + stat_smooth() +
  ggtitle("CDS density ~ genome size correlation") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("all_CDS/genome_size") + xlab("genome size, kb") + expand_limits(x=0, y=0)
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_COX_all_endo_new/plots/CDS_density_genome_size_correlation.png")

#endo (lagli) dencity - genome size
ggplot(data = size, aes(y=endo_density, x=genome_size)) + geom_point() + stat_smooth() +
  ggtitle("Endonuclease (lagli1, lagli2) density ~ genome size correlation") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("LAGLI_1,2/genome_size") + xlab("genome size, kb") + expand_limits(x=0, y=0)
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_COX_all_endo_new/plots/lagli_density_genome_size_correlation.png")

#CDS ~ all COX number correlation
ggplot(data = size, aes(y=COX_1_2_3, x=all_CDS)) + geom_point() + stat_smooth() +
  ggtitle("all CDS ~ all COX number correlation") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Number of COX") + xlab("all CDS") + expand_limits(x=0, y=0)
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_COX_all_endo_new/plots/all_CDS_all_COX_number_correlatio.png")

#all_endo ~ genome size
ggplot(data = size, aes(y=LAGLIDADG_1_2, x=genome_size)) + geom_point() + stat_smooth() +
  ggtitle("Endonuclease number (lagli_1,2) ~ genome size correlation") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Number of Endonucleases") + xlab("genome size, kb") + expand_limits(x=0, y=0)
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_COX_all_endo_new/plots/all_endo_genome_size_correlatio.png")

#RVT_1 ~ genome size
ggplot(data = size, aes(y=RVT_1, x=genome_size)) + geom_point() + stat_smooth() +
  ggtitle("number of RVT_1 genes ~ genome size correlation") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Number of RVT_1 genes") + xlab("genome size, kb") + expand_limits(x=0, y=0)
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_COX_all_endo_new/plots/RVT_1_genome_size_correlatio.png")

#all_CDS ~ genome size
ggplot(data = size, aes(y=all_CDS, x=genome_size)) + geom_point() + stat_smooth() +
  ggtitle("MITOS2 + hmmsearch results for all domains") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Number of CDS") + xlab("genome size, kb") + expand_limits(x=0, y=0)
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/renamed_mitos_hmm10_10/domains_csv/all_COX_all_endo_new/plots/all_CDS_genome_size_correlatio.png")


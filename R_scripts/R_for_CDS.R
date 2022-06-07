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
setwd("/home/yana/Desktop/Vanyata/CDS")

size <- read.csv("size_genomes.csv", header = TRUE, sep = ",")
CDS_number <- read.csv("CDS_number.csv", header = TRUE, sep = ",")
size_CDS <- read.csv("size_CDS.csv", header = TRUE, sep = ",")
ggplot(data = size_CDS, aes(x=genome_size, y=CDS_number)) + geom_point() + stat_smooth() +
  ggtitle("MITOS2 results") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Genome size (kb)") + ylab("Number of CDS")
ggsave("/home/yana/Desktop/Vanyata/CDS/MITOS2_results.png")


CDS_number_ORF <- read.csv("CDS_number_ORFfinder.csv", header = FALSE)
new_all <- merge(CDS_number_ORF, size_CDS, by=0)
ggplot(data = new_all, aes(x=genome_size, y=V1)) + geom_point() + stat_smooth() +
ggtitle("ORFfinder results") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Genome size (kb)") + ylab("Number of CDS")
ggsave("/home/yana/Desktop/Vanyata/CDS/ORFfinder_results.png")

CDS_default <- read.csv("CDS_default.csv", header = TRUE)
new_all <- merge(CDS_default, new_all, by=0)
ggplot(data = new_all, aes(x=genome_size, y=CDS)) + geom_point() + stat_smooth() +
  ggtitle("NCBI annotation") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Genome size (kb)") + ylab("Number of CDS")
ggsave("/home/yana/Desktop/Vanyata/CDS/NCBI_results.png")

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

#parsing_all
mtGenomes <- read.csv("organelles.csv", header = TRUE, sep = ",")
mtGenomes <-
  mtGenomes %>% separate(Replicons, c("NCBI", "Genbank"), "/")
our2 <- mtGenomes[, c("X.Organism.Name", "NCBI")]
write.table(our2, file = "ID_species.txt", sep = "\t", quote = FALSE, row.names = FALSE, col.names = FALSE)

mtEndo <- read.csv("/home/ivan/Desktop/Lab2021/mit_virus/fungi/scripts/NCBI_list_endonuclease.txt", header = TRUE, sep = "\t")
mtEndo_LAGLIDADG <- read.csv("/home/ivan/Desktop/Lab2021/mit_virus/fungi/scripts/NCBI_list_endonuclease_LAGLIDADG.txt", header = TRUE, sep = "\t")
mtEndo_GIY <- read.csv("/home/ivan/Desktop/Lab2021/mit_virus/fungi/scripts/NCBI_list_endonuclease_GIY.txt", header = TRUE, sep = "\t")


our2 <- mtGenomes[, c("NCBI")]
our3 <- mtGenomes[, c("X.Organism.Name", "NCBI", "Size.Mb.", "CDS")]
our3$endo_num <- mtEndo[, c("endo_num")]
our3$endo_LAGLIDADG <- mtEndo_LAGLIDADG[, c("endo_num")]
our3$endo_GIY <- mtEndo_GIY[, c("endo_num")]
our3_filt <- our3 %>% filter(CDS > 2)
our3_filt_endo <- our3_filt %>% filter(endo_num > 0)
our3_filt_endo$k <- our3_filt_endo$endo_num / our3_filt_endo$Size.Mb.

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

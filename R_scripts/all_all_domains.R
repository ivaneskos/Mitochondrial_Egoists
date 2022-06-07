#all domains

setwd("/home/yana/Desktop/Vanyata/all_domain_per_genome_stat")

domains <- read.csv ("all_CDS.csv", header = TRUE)

COX1 <- read.csv ("COX1.csv", header = TRUE)
COX2 <- read.csv ("COX2.csv", header = TRUE)
COX2_TM <- read.csv ("COX2_TM.csv", header = TRUE)
Cytochrom_B_C <- read.csv ("Cytochrom_B_C.csv", header = TRUE)
Cytochrom_B_N_2 <- read.csv ("Cytochrom_B_N_2.csv", header = TRUE)
Cytochrome_B <- read.csv ("Cytochrome_B.csv", header = TRUE)
Oxidored_q2 <- read.csv ("Oxidored_q2.csv", header = TRUE)
Oxidored_q3 <- read.csv ("Oxidored_q3.csv", header = TRUE)
Oxidored_q4 <- read.csv ("Oxidored_q4.csv", header = TRUE)

NADH5_C <- read.csv ("NADH5_C.csv", header = TRUE)
NADHdh <- read.csv ("NADHdh.csv", header = TRUE)
Fun_ATP_synt_8 <- read.csv ("Fun_ATP_synt_8.csv", header = TRUE)
ATP_synt_A <- read.csv ("ATP_synt_A.csv", header = TRUE)
ATP_synt_C <- read.csv ("ATP_synt_C.csv", header = TRUE)
Proton_antipo_M <- read.csv ("Proton_antipo_M.csv", header = TRUE)
Proton_antipo_N <- read.csv ("Proton_antipo_N.csv", header = TRUE)
VAR1 <- read.csv ("VAR1.csv", header = TRUE)

DNA_pol_B_2 <- read.csv ("DNA_pol_B_2.csv", header = TRUE)
RNA_pol <- read.csv ("RNA_pol.csv", header = TRUE)
RVT_1 <- read.csv ("RVT_1.csv", header = TRUE)

Intron_maturas2 <- read.csv ("Intron_maturas2.csv", header = TRUE)
GIIM <- read.csv ("GIIM.csv", header = TRUE)
NUMOD1 <- read.csv ("NUMOD1.csv", header = TRUE)
NUMOD3 <- read.csv ("NUMOD3.csv", header = TRUE)
GIY_YIG <- read.csv ("GIY_YIG.csv", header = TRUE)
LAGLIDADG_1 <- read.csv ("LAGLIDADG_1.csv", header = TRUE)
LAGLIDADG_2 <- read.csv ("LAGLIDADG_2.csv", header = TRUE)
LAGLIDADG_3 <- read.csv ("LAGLIDADG_3.csv", header = TRUE)

domains$COX1 <- COX1[, c("COX1")]
domains$COX2 <- COX2[, c("COX2")]
domains$COX2_TM <- COX2_TM[, c("COX2_TM")]
domains$Cytoch_B_C <- Cytochrom_B_C[, c("Cytochrom_B_C")]
domains$Cytoch_B_N_2 <- Cytochrom_B_N_2[, c("Cytochrom_B_N_2")]
domains$Cytoch_B <- Cytochrome_B[, c("Cytochrome_B")]
domains$Oxidored_q2 <- Oxidored_q2[, c("Oxidored_q2")]
domains$Oxidored_q3 <- Oxidored_q3[, c("Oxidored_q3")]
domains$Oxidored_q4 <- Oxidored_q4[, c("Oxidored_q4")]

domains$NADH5_C <- NADH5_C[, c("NADH5_C")]
domains$NADHdh <- NADHdh[, c("NADHdh")]
domains$ATP_synt_8 <- Fun_ATP_synt_8[, c("Fun_ATP.synt_8")]
domains$ATP_synt_A <- ATP_synt_A[, c("ATP.synt_A")]
domains$ATP_synt_C <- ATP_synt_C[, c("ATP.synt_C")]
domains$Prot_antipo_M <- Proton_antipo_M[, c("Proton_antipo_M")]
domains$VAR1 <- VAR1[, c("VAR1")]

domains$DNA_pol_B_2 <- DNA_pol_B_2[, c("DNA_pol_B_2")]
domains$RNA_pol <- RNA_pol[, c("RNA_pol")]
domains$RVT_1 <- RVT_1[, c("RVT_1")]

domains$Intron_maturas2 <- Intron_maturas2[, c("Intron_maturas2")]
domains$GIIM <- GIIM[, c("GIIM")]
domains$NUMOD1 <- NUMOD1[, c("NUMOD1")]
domains$NUMOD3 <- NUMOD3[, c("NUMOD3")]
domains$GIY_YIG <- GIY_YIG[, c("GIY_YIG")]
domains$LAGLI_1 <- LAGLIDADG_1[, c("LAGLIDADG_1")]
domains$LAGLI_2 <- LAGLIDADG_2[, c("LAGLIDADG_2")]
domains$LAGLI_3 <- LAGLIDADG_3[, c("LAGLIDADG_3")]

domains <- domains %>% filter(all_CDS > 0)

domains <- stack(domains)
domains <- domains %>% rename(Gene_groups = ind)

ggplot(domains, aes(x = Gene_groups, y = values, colour = Gene_groups, fill=Gene_groups)) + geom_violin() +
  xlab("") + ylab("Number of genes in each genomes") +
  scale_colour_manual(values=c("#178a90", "#125d14", "brown", "#93098b", "#1708d3", "#606313", "#581845", "#f9040f", "#055a04", "#044e3a")) + 
  scale_fill_manual(values=c("#b4f8fc", "#DAF7A6", "#FFC300", "#f5ccf2", "#cfcbfa", "#ebeeab", "#eedafc", "#fddadc", "#d5fcd5", "#bdf8e8")) + 
  geom_jitter(shape=16, position=position_jitter(0.2), colour = "#6e6343", size=0.5) +
  ggtitle("Number of genes for each domain - conservative domains part1") +
  geom_boxplot(width=0.05) + theme_classic()
ggsave("/home/yana/Desktop/Vanyata/all_domain_per_genome_stat/violine_plots_conservative domains_part1.png")

ggplot(domains, aes(x = Gene_groups, y = values, colour = Gene_groups, fill=Gene_groups)) + geom_violin() +
  xlab("") + ylab("Number of genes in each genomes") +
  scale_colour_manual(values=c("#178a90", "#125d14", "brown", "#93098b", "#1708d3", "#606313", "#581845", "#f9040f", "#055a04", "#044e3a")) + 
  scale_fill_manual(values=c("#b4f8fc", "#DAF7A6", "#FFC300", "#f5ccf2", "#cfcbfa", "#ebeeab", "#eedafc", "#fddadc", "#d5fcd5", "#bdf8e8")) + 
  geom_jitter(shape=16, position=position_jitter(0.2), colour = "#6e6343", size=0.5) +
  ggtitle("Number of genes for each domain - conservative domains part2") +
  geom_boxplot(width=0.05) + theme_classic()
ggsave("/home/yana/Desktop/Vanyata/all_domain_per_genome_stat/violine_plots_conservative domains_part2.png")




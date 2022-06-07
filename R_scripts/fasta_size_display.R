setwd("/home/yana/Desktop/Vanyata/30_05_vanya/domains_fasta_size_filtered/plots_length_distr/domains_fasta_stat")
COX1 <- read.csv ("COX1_fasta_stat.csv", header = FALSE, sep = "\t")
COX2 <- read.csv ("COX2_fasta_stat.csv", header = FALSE, sep = "\t")
COX2_TM <- read.csv ("COX2_TM_fasta_stat.csv", header = FALSE, sep = "\t")
COX3 <- read.csv ("COX3_fasta_stat.csv", header = FALSE, sep = "\t")
GIY_YIG <- read.csv ("GIY-YIG_fasta_stat.csv", header = FALSE, sep = "\t")
lagli_1 <- read.csv ("LAGLIDADG_1_fasta_stat.csv", header = FALSE, sep = "\t")
lagli_2 <- read.csv ("LAGLIDADG_2_fasta_stat.csv", header = FALSE, sep = "\t")
lagli_3 <- read.csv ("LAGLIDADG_3_fasta_stat.csv", header = FALSE, sep = "\t")

ggplot(COX1, aes(x=V2)) + 
  geom_histogram(color="black", fill="white") +
  geom_vline(aes(xintercept=200), color="red", linetype="dashed", size=1) +
  geom_vline(aes(xintercept=550), color="red", linetype="dashed", size=1) +
  ggtitle("Distribution of COX1 length") +
  xlab("length (nt)")
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/domains_fasta_size_filtered/plots_length_distr/COX1_length.png")


ggplot(COX2, aes(x=V2)) + 
  geom_histogram(color="black", fill="white") +
  geom_vline(aes(xintercept=200), color="red", linetype="dashed", size=1) + 
  geom_vline(aes(xintercept=300), color="red", linetype="dashed", size=1) +
  ggtitle("Distribution of COX2 length") +
  xlab("length (nt)")
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/domains_fasta_size_filtered/plots_length_distr/COX2_length.png")


ggplot(COX2_TM, aes(x=V2)) + 
  geom_histogram(color="black", fill="white") +
  geom_vline(aes(xintercept=200), color="red", linetype="dashed", size=1) + 
  geom_vline(aes(xintercept=300), color="red", linetype="dashed", size=1) +
  ggtitle("Distribution of COX2_TM length") +
  xlab("length (nt)")
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/domains_fasta_size_filtered/plots_length_distr/COX2_TM_length.png")


ggplot(COX3, aes(x=V2)) + 
  geom_histogram(color="black", fill="white") +
  geom_vline(aes(xintercept=300), color="red", linetype="dashed", size=1) +
  geom_vline(aes(xintercept=0), color="red", linetype="dashed", size=1) +
  ggtitle("Distribution of COX3 length") +
  xlab("length (nt)")
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/domains_fasta_size_filtered/plots_length_distr/COX3_length.png")


ggplot(COX3, aes(x=V2)) + 
  geom_histogram(color="black", fill="white") +
  geom_vline(aes(xintercept=300), color="red", linetype="dashed", size=1) +
  geom_vline(aes(xintercept=0), color="red", linetype="dashed", size=1) +
  ggtitle("Distribution of COX3 length") +
  xlab("length (nt)")
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/domains_fasta_size_filtered/plots_length_distr/COX3_length.png")


ggplot(GIY_YIG, aes(x=V2)) + 
  geom_histogram(color="black", fill="white") +
  geom_vline(aes(xintercept=200), color="red", linetype="dashed", size=1) +
  geom_vline(aes(xintercept=0), color="red", linetype="dashed", size=1) +
  ggtitle("Distribution of GIY_YIG length") +
  xlab("length (nt)")
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/domains_fasta_size_filtered/plots_length_distr/GIY_YIG_length.png")


ggplot(lagli_1, aes(x=V2)) + 
  geom_histogram(color="black", fill="white") +
  geom_vline(aes(xintercept=320), color="red", linetype="dashed", size=1) +
  geom_vline(aes(xintercept=220), color="red", linetype="dashed", size=1) +
  ggtitle("Distribution of Laglidadg_1 length") +
  xlab("length (nt)")
ggsave("/home/yana/Desktop/Vanyata/30_05_vanya/domains_fasta_size_filtered/plots_length_distr/Laglidadg_1_length.png")







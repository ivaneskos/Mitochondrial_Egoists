setwd("/home/yana/Desktop/Vanyata/leafs_number")

cox1 <- read.csv ("COX1.csv", header = TRUE)
cox2 <- read.csv ("COX2.csv", header = FALSE)
cox3 <- read.csv ("COX3.csv", header = FALSE)
lagli_1 <- read.csv ("LAGLIDADG_1.csv", header = FALSE)
lagli_2 <- read.csv ("LAGLIDADG_2.csv", header = FALSE)

cox1$COX2 <- cox2[, c("V1")]
cox1$COX3 <- cox3[, c("V1")] 
cox1$Lagli_1 <- lagli_1[, c("V1")]
cox1$Lagli_2 <- lagli_2[, c("V1")]


test_2 <- stack(cox1)
test_2 <- test_2 %>% rename(Gene_groups = ind)

ggplot(test_2, aes(x = Gene_groups, y = values, colour = Gene_groups, fill=Gene_groups)) + geom_violin() +
  xlab("") + ylab("leaves number") + ylim(1, 10) +
  scale_colour_manual(values=c("#178a90", "#125d14", "brown", "#93098b", "#1708d3")) + 
  scale_fill_manual(values=c("#b4f8fc", "#DAF7A6", "#FFC300", "#f5ccf2", "#cfcbfa")) + 
  geom_jitter(shape=16, position=position_jitter(0.2), colour = "#6e6343", size=1) +
  ggtitle("leaves number for each clade for each domain") +
  geom_boxplot(width=0.05) + theme_classic()
ggsave("/home/yana/Desktop/Vanyata/leafs_number/leaves_number_violine.png")

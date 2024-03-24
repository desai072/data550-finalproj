here::i_am("code/02_Make_Figure1.R"
)

data <- readRDS(
  file = here::here("data/data_clean.rds")
)

library(ggplot2)
library(stringr)
library(dplyr)


perc_by_race <- data %>% 
  group_by(race) %>% 
  summarise(perc = (sum(cancer_ever == "Yes")/n()*100))

fig1 <- ggplot(perc_by_race, aes(x = race, y = perc)) +
  geom_bar(stat = "identity", fill = "darkolivegreen") +
  labs(x = "Race/Ethnicity",
       y = "Percentage with Cancer (%)" ) +
  theme(legend.position = "None") +
  scale_x_discrete(labels = function(x) str_wrap(x, width = 10)) +
  theme_linedraw() 

ggsave(
  here::here("output/figure1.png"),
  plot = fig1,
  device = "png"
)
here::i_am("code/00_Clean_Data.R")

library(dplyr)

abs_path_to_demo <- here::here("data", "demo.csv")
demo <- read.csv(abs_path_to_demo, header = TRUE)

abs_path_to_ques <- here::here("data", "ques.csv")
ques <- read.csv(abs_path_to_ques, header = TRUE)

combined <- merge(x = demo,
                  y = ques,
                  by = "SEQN",
                  all= F) %>%  
  dplyr::select(c("RIAGENDR", "RIDAGEYR", "INDFMPIR", "RIDRETH3", "MCQ220", "MCQ230A", "MCQ230B", "MCQ230C", "MCQ230D")) %>% 
  filter(!is.na(INDFMPIR)  & !is.na(MCQ220) & MCQ220 != "Don't know") %>% 
  droplevels.data.frame()

names(combined) <- c("gender", "age", "pir", "race", "cancer_ever", "cancer_type_a", "cancer_type_b", "cancer_type_c", "cancer_morethan_3")

saveRDS(
  combined, 
  file = here::here("data/data_clean.rds")
)
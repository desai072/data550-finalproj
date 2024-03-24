here::i_am("code/01_Make_Table1.R"
)

data <- readRDS(
  file = here::here("data/data_clean.rds")
)

library(gtsummary)
library(labelled)

data$race <- factor(data$race, levels = c("Non-Hispanic White", "Non-Hispanic Black", "Non-Hispanic Asian", "Mexican American", 
                                                  "Other Hispanic", "Other Race - Including Multi-Racial"))

var_label(data) <- list (
  gender = "Gender",
  age = "Age (Years)",
  pir = "Income to Poverty Ratio",
  race = "Race",
  cancer_ever = "Had/Have Cancer"
)

table1 <- data %>% 
  select("gender", "age", "pir", "race", "cancer_ever") %>% 
  tbl_summary(by=cancer_ever, value = starts_with("cancer_ever") ~ 'Yes') %>% 
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Cancer or Malignancy**") %>% 
  add_overall()

saveRDS(
  table1,
  file = here::here("output/table1.rds")
)
here::i_am("code/03_Render_Report.R")

library(rmarkdown)

rmarkdown::render(here::here("Final_Report.Rmd"),
                  output_file = "Final_Report.html")

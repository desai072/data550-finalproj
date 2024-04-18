report/Final_Report.html: code/03_Render_Report.R Final_Report.Rmd data/data_clean.rds output/table1.rds output/figure1.png
	Rscript code/03_Render_Report.R

data/data_clean.rds: code/00_Clean_Data.R data/demo.csv data/ques.csv
	Rscript code/00_Clean_Data.R
	
output/table1.rds: code/01_Make_Table1.R data/data_clean.rds
	Rscript code/01_Make_Table1.R

output/figure1.png: code/02_Make_Figure1.R data/data_clean.rds
	Rscript code/02_Make_Figure1.R
	
.PHONY: clean
clean:
	rm -f data/data_clean.rds rm -f output/*.rds && rm -f output/*.png rm -f report/*.html 
	
.PHONY: install
install:
	Rscript -e "renv::restore()"
	
.PHONY: report_mac
report_mac:
	docker run -v "$$(pwd)/report":/data550-finalproj/report sid072/final-proj
	
.PHONY: report_win
report_win:
	docker run -v "/$$(pwd)/report":/data550-finalproj/report sid072/final-proj
	
.PHONY: build
build:
	docker build -t sid072/final-proj .
	
.PHONY: pull
pull:
	docker pull sid072/final-proj
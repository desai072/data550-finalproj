# Final Project

> DATA 550, Spring 2024

## Generating the Final Report

The project directory contains a `Makefile` with rules to generate the final report. The final report will contain a brief introduction to the data and the analysis objectives, a Table 1 with a description, as well as a Figure 1 with a description.

*In order to generate the final report, please type `Make` in the terminal window.*

## Synchronizing the Package Repository

The `Makefile` also contains a rule to synchronize a user's package repository with the set of packages used in the project.

*In order to synchronize your package repository, please type `Make install` in the terminal window*

## The Code Files

The `code/00_Make_Clean.R` file cleans the data

-   It reads in the demographics and questionnaire datasets from the `data/` folder
-   It merges the two datasets and cleans the merged dataframe
-   Saves the merged dataframe as a `.rds` object in `data/` folder

The `code/01_Make_Table1.R` file creates Table 1

-   Reads in cleaned, merged data from `data/` folder
-   The created table is stored as a `.rds` object in the `output/` folder

The `code/02_Make_Figure1.R` file creates Figure 1

-   Reads in cleaned, merged data from `data/` folder
-   The created figure is stored as a `.png` file in the `output/` folder

The `code/03_Render_Report.R` renders the `Final_Report.Rmd` file

-   The created html file should appear in the main folder

The `Final_Report.Rmd` file

-   Reads in and inserts the Table 1 and Figure 1 file from the `output/` folder

# Final Project

> DATA 550, Spring 2024

The project directory contains a `Makefile` with rules to generate the final report. The final report will contain a brief introduction to the data and the analysis objectives, a Table 1 with a description, as well as a Figure 1 with a description.

## Generating the Final Report (Option #1 Recommended):

## Option #1: Using Docker & DockerHub

### Step 1: Building Docker Image

The `Makefile` contains rules to pull or build the project image.

*In order to build the image, please type `Make build` in the terminal window.*

OR

*In order to pull the image from DockerHub, please type `Make pull` in the terminal window.*

### Step 2: Generate Final Report

The `Makefile` contains a rule to run the image. This will generate the Final Report file locally in the project directory.

-   Mac users: *Please type `Make report_mac` in the terminal window.*

-   Windows users: *Please type `Make report_win` in the terminal window.*

## Option #2: Generating the Final Report Locally

### Synchronize the Package Repository

The `Makefile` also contains a rule to synchronize a user's package repository with the set of packages used in the project.

*In order to synchronize your package repository, please type `Make install` in the terminal window.*

### Generate Final Report

*In order to generate the final report, please type `Make` in the terminal window.*

## Project Organization

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

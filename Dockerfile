FROM rocker/r-ubuntu as base

RUN apt-get update
RUN apt-get install -y pandoc
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y libfontconfig1-dev

#make & set overall project directory
RUN mkdir /data550-finalproj
WORKDIR /data550-finalproj

#copy renv files
RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN R -e "renv::restore()"

#copy other files
COPY README.md /data550-finalproj
COPY Final_Report.Rmd /data550-finalproj
COPY Makefile /data550-finalproj

#mkdir
RUN mkdir code
RUN mkdir data
RUN mkdir output
RUN mkdir report

#further copying
COPY data/demo.csv data
COPY data/ques.csv data

COPY code/00_Clean_Data.R code
COPY code/01_Make_Table1.R code
COPY code/02_Make_Figure1.R code
COPY code/03_Render_Report.R code

CMD make && mv Final_Report.html report
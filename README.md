# README

This repository contains the code used in the manuscript, **Genome-Wide Transcriptional Regulation Mediated by Biochemically Distinct Forms of SWI/SNF**, currently submitted.

Most of the computationally time-consuming analysis was done using a Rocks cluster, so the scripts associated this are not very portable and have many hard-coded links to data and scripts.

The results of these files are stored for generation of the figures, and wherever possible I've included the raw data for those figures.

Clone the Repo - then: 

    sh runFirst.sh
   
This may take a while but will download the larger files that are needed to make figures. 
If you want even  more raw data (fastq files) see the GEO submission (GSE69568). 

Then to create the figures run: 

    sh createFigs.sh


A more commented version of those scripts is found in pseudomake - which also includes the pre-preprocessing steps. It is not intended to be run directly. 

Please contact me if you have any questions. 


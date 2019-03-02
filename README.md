# pp4rs - programming practices for reproducible research (UZH)

This repo contains the final project for the pp4rs course at UZH.
It works as a draft template for reproducible research workflow using snakemake.

## What this repo does:

This repo replicates a figure and some simple results from Laincz & Peretto (2006): “Scale Effects in Endoge- nous Growth Theory: An Error of Aggregation Not Specification”.
It takes real GDP and population data from the Penn World Tables, cleans the data, and checks whether the real GDP growth rate and log of population show any signs of scale effects.
That is, evidence that big countries would be growing faster.
It also takes an additional mapping dataset with country-continent codes to group the plotted results between countries and continents.

## How to build this repo:
You need to have R and snakemake installed.
In addition, all required R packages are listed in REQUIREMENTS.txt.

To build, navigate the terminal working directory to this folder and type `snakemake`

NOTE: the snakefile was written on Mac OS X, so the path statements will not be working properly on Windows machines.

The final paper, pp4rs_assignment.pdf, will be copied to the root directory when all programs have been compiled.

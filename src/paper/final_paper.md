---
title: PP4RS Final project
author: jlehtomaa
---

# Introduction

This is a course project work to create the first version of a snakemake workflow.
The numbers illustrated here will check for a link between the population size and GDP growth rate, referred to as scale effects in endogenous growth theory.
The workflow will use R to clean data and create a very simple regression and markdown + pandoc to draft a pdf version of the paper. Lorem ipsum. Blah blah.

# Literature
This bit will check that the BibTex integration works correctly.
I will replicate the figure presented in @Laincz2006, but add some additional features such as grouping by continent.

# Data
The dataset is taken from the Penn World Tables.
Data include real GDP and population data for 156 countries for the period 1970-2010.

The summary of the statistics looks as follows:
\input{out/tables/summary_stat.tex}


# Results

As expected, there seems only to be a very weak link between population size and real GDP growth.
The linear regression is presented in figure 1 below.

![Average real GDP growth for 1970 - 2010 and log of 1970 population](out/figures/fig_01.png)

Another table using stargazer, which, for this simplest regression, looks kinda weird.

Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?

\input{out/tables/model_results.tex}

# Conclusions
Blah blah blah.

# References #

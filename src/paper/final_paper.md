---
title: PP4RS Final project
author: jlehtomaa
---

# Introduction

This is a course project work to create the first draft version of a reproducible research workflow using Snakemake.
The numbers illustrated here will check for a link between the population size and GDP growth rate, which in endogenous growth theory is referred to as scale effects.
The workflow will use R to clean data and create the simplest possible liner regression.
A markdown manuscript will then be converted to pdf using Pandoc.
Lorem ipsum. Blah blah blah. Blah blah.

# Literature
This chapter will check that the BibTex integration works correctly.
I will replicate the figure presented on page 266 in @Laincz2006.
I will also add some additional features, such as grouping and color coding by continent.
Also the data I use will be slightly newer.

# Data
The dataset is taken from the Penn World Tables.
After some cleaning, the dataset includes real GDP and population data for 121 countries for the period 1970-2010.

The summary of the statistics looks as follows:
\input{out/tables/summary_stat.tex}


# Results

As expected, there seems to be only very weak positive link between population size and real GDP growth.
The linear regression is presented in figure 1 below.

![Average real GDP growth for 1970 - 2010 and log of 1970 population](out/figures/fig_01.png)

Another table using stargazer, which, for this simplest regression, looks kinda weird.

Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?

\input{out/tables/model_results.tex}

# Conclusions
Blah blah blah.

# References #

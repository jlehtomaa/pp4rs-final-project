library(optparse)
library(rlist)
library(magrittr)
library(purrr)
library(stargazer)
library(readr)
library(dplyr)

# CLI parsing
option_list = list(
  make_option(c("-d", "--data"),
              type = "character",
              default = NULL,
              help = "a csv file name",
              metavar = "character"),
  make_option(c("-o", "--out"),
              type = "character",
              help = "output file name",
              metavar = "character")
);

opt_parser = OptionParser(option_list = option_list);
opt = parse_args(opt_parser);

if (is.null(opt$data)){
  print_help(opt_parser)
  stop("Input data must be provided", call. = FALSE)
}


# Load data
print("Loading data")
df<- readRDS(opt$data)

stargazer(df,
          type = "latex",
          style = "qje",
          out = opt$out)


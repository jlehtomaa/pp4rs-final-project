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
              help = "an rds file name",
              metavar = "character"),
  make_option(c("-o", "--out"),
              type = "character",
              default = "out.tex",
              help = "output file name",
              metavar = "character")
);

opt_parser = OptionParser(option_list = option_list);
opt = parse_args(opt_parser);

if (is.null(opt$data)){
  print_help(opt_parser)
  stop("Data must be provided", call. = FALSE)
}

# Load data
print("Loading data")
df<- read_csv(opt$data)

stargazer(as.data.frame(df),
          type = "latex",
          out = opt$out)

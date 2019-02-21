library(optparse)
library(readr)
library(rlist)

# CLI parsing
option_list = list(
  make_option(c("-d", "--data"),
              type = "character",
              default = NULL,
              help = "a csv file name",
              metavar = "character"),
  make_option(c("-o", "--out"),
              type = "character",
              default = "out.rds",
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
data_complete <- read_csv(opt$data)


linear_regression <- lm(avg_pc_gdp_growth ~ ln_pop, data = data_complete)


# Save output
list.save(linear_regression, opt$out)
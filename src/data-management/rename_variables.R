library(dplyr)
library(tibble)
library(tidyr)
library(optparse)
library(readr)

# CLI parsing
option_list = list(
  make_option(c("-d", "--data"),
              type = "character",
              default = NULL,
              help = "CSV dataset file name",
              metavar = "character"),
  make_option(c("-o", "--out"),
              type = "character",
              default = "out.csv",
              help = "output file name [default = %default]",
              metavar = "character")
);

opt_parser = OptionParser(option_list = option_list);
opt = parse_args(opt_parser);

if (is.null(opt$data)){
  print_help(opt_parser)
  stop("At least one argument must be supplied (input file).n", call. = FALSE)
}


print("Loading data")
rawdata_long <- read_csv(opt$data)

# CLEAN DATA
rawdata_wide <- rawdata_long %>%
  spread(key = "VariableCode",
         value = "AggValue")

rawdata_renamed <- rawdata_wide %>%
  rename(country = RegionCode,
         year = YearCode,
         population = pop,
         real_gdp = rgdpo)


# Save data
print("saving output")
write_csv(rawdata_renamed, opt$out)

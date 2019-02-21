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
              help = "a csv file name",
              metavar = "character"),
  make_option(c("-m", "--metadata"),
              type = "character",
              default = NULL,
              help = "CSV additional dataset file name",
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
  stop("Input data must be provided", call. = FALSE)
}
if (is.null(opt$metadata)){
  print_help(opt_parser)
  stop("At least one argument for metadata must be supplied (input file).n", call. = FALSE)
}

# Load data
print("Loading data")
rawdata_renamed <- read_csv(opt$data)
codes_raw <- read_csv(opt$metadata)
# ...only include countries for which there is data available from the refyear onwards
refyear <-  1970
sample_countries <- rawdata_renamed %>% 
  filter(year == refyear) %>% 
  filter(population > 0.5) %>% 
  select(country) %>% 
  droplevels()

sample_list <- lapply(sample_countries$country, as.character)

continent_codes <- codes_raw %>% 
  rename(country = Three_Letter_Country_Code,
         continent = Continent_Name) %>%
  select(country, continent) %>% 
  filter(country %in% sample_list) %>% 
  distinct(country,  .keep_all = TRUE) %>% 
  droplevels()

pop_clean <- rawdata_renamed %>% 
  filter(year == refyear,
         country %in% sample_list) %>% 
  select(country, population) %>% 
  droplevels() %>% 
  left_join(continent_codes, by = "country")

growth_clean <- rawdata_renamed %>% 
  filter(country %in% sample_list) %>% 
  droplevels()


# MUTATE DATA
growth_complete <- growth_clean %>% 
  group_by(country) %>% 
  mutate(gdp_percap = real_gdp / population,
         pc_gdp_growth = (gdp_percap - lag(gdp_percap)) / lag(gdp_percap)) %>%
  select(country, year, pc_gdp_growth) %>% 
  summarize(avg_pc_gdp_growth = mean(pc_gdp_growth, na.rm = TRUE))

pop_complete <- pop_clean %>% 
  mutate(ln_pop = log(population)) %>% 
  select(-population)

data_final <- left_join(pop_complete, growth_complete, by = "country")

# Save output
print("saving output")
write_csv(data_final, opt$out)
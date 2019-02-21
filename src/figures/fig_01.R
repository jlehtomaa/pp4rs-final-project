library(optparse)
library(readr)
library(dplyr)
library(ggplot2)
library(tibble)

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
data_complete <- read_csv(opt$data)

fig01 <- data_complete %>%
  ggplot(aes(x = ln_pop, y = avg_pc_gdp_growth)) +
  geom_point(aes(color = continent)) +
  geom_smooth(method='lm', se = FALSE) +
  labs(x = "Ln 1970 population", y = "Average per cap. GDP growth rate", color = "Continent") +
  theme(legend.position = "bottom") 

# Save output
ggsave(opt$out, fig01, height = 5, width = 7)

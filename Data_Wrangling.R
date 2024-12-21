install.packages("dslabs")
path <- system.file("extdata", package = "dslabs")
list.files(path)
filename <- "murders.csv"
fullpath <- file.path(path, filename)
fullpath
file.copy(fullpath, getwd())
file.exists(filename)
library(tidyverse)
read_lines("murders.csv", n_max = 3)

dat <- read_csv(filename)

dat <- read_csv(filename, col_types = cols(
  state = col_character(),
  abb = col_character(),
  region = col_character(),
  population = col_integer(),
  total = col_integer()
  ))

dat

head(dat)

filtered_data <- dat %>% 
  filter(region == "South") %>% 
  select(state, population)


filtered_data

print(filtered_data)
select(filtered_data)
head(filtered_data)

table(filtered_data)
View(filtered_data)

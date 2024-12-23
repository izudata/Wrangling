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


dat2 <- read.csv(filename)
dat2

class(dat)
class(dat2)


url <- "https://raw.githubusercontent.com/rafalab/dslabs/master/inst/extdata/murders.csv"
dat <- read_csv(url)
dat


dat <- read_csv(url, col_types = cols(
  state = col_character(),
  abb = col_character(),
  region = col_character(),
  population = col_integer(),
  total = col_integer()
))
dat

url2 <- "https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"
dat3 <- read_csv(url2, col_names = FALSE)
 head(dat3)
dat3



library(tidyverse)
library(dslabs)
data("gapminder")

glimpse(gapminder)

tidy_data <- gapminder %>% 
  filter(country %in% c("South Korea", "Germany")) %>% 
  select(country, year, fertility)
head(tidy_data)


tidy_data %>% 
  ggplot(aes(year, fertility, colour = country)) +
  geom_point()

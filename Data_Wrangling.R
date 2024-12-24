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


path2 <- system.file("extdata", package = "dslabs")
originalfilename <- file.path(path2, "fertility-two-countries-example.csv")
wide_data <- read_csv(originalfilename, col_types = cols(
  .default = col_double(),
  country = col_character()
))


wide_data %>% 
  select (country, '1960':'1967')


wide_data %>% pivot_longer('1960':'2015')


wide_data %>% pivot_longer(-country)


new_tidy_data <- wide_data %>% 
  pivot_longer(-country, names_to = "year", values_to = "fertility")
head(new_tidy_data)

class(tidy_data$year)
class(new_tidy_data$year)

new_tidy_data <- wide_data %>% 
  pivot_longer(-country, names_to = "year", values_to = "fertility",
               names_transform = list(year=as.numeric))
head(new_tidy_data)

class(new_tidy_data$year)


new_tidy_data %>% 
  ggplot(aes(year, fertility, colour = country)) +
  geom_point()

View(new_tidy_data)


new_tidy_data <- new_tidy_data %>% 
  pivot_wider(names_from = year,values_from = fertility)
select(new_tidy_data, country, '1960':'1965')


path3 <- system.file("extdata", package = "dslabs")
list.files(path3)
fname <-  "life-expectancy-and-fertility-two-countries-example.csv"
fnewpath <- file.path(path3,fname)
file.copy(fnewpath, getwd())

fname2 <- file.path(path3,fname)

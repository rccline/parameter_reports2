library(tidyverse)
library(rmarkdown)
library(here)

# Get dataset from openintro library
nba <- openintro::nba_players_19  

# input = here("doc-params", "Table-Params.Rmd")

# render(input = "E:/Physalia-MostOutOf-R/doc-params/Table-Params.Rmd")

render(input = here("doc-params", "Table-Params.Rmd"))

getwd()

team <- unique(nba$team)
teaml <- list(team)
class(teaml)
teaml# state <- bad_drivers %>%
#   pull(state)

output_dir <- here("output")

rm(reports)
reports <- tibble(
  input = here("doc-params", "Table-Params.Rmd"),
  # output_file = stringr::str_c("../output/", team, "-.html"),
  output_file = stringr::str_c(output_dir,"/", team, "-.html"),
  params = map(nba, ~list(team = .))
  # params = list(teams=teaml)
)


head(reports) 

reports %>% 
  pwalk(rmarkdown::render) # , input= "./output/report.Rmd")

# pwalk and map are from purrr package

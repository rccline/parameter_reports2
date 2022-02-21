library(tidyverse)
library(rmarkdown)
library(here)

# Get dataset from openintro library
nba <- openintro::nba_players_19  

### Check to see if each runs  
# input = here("doc-params", "Table-Params.Rmd")

# render(input = "E:/Physalia-MostOutOf-R/doc-params/Table-Params.Rmd")

# render(input = here("doc-params", "Table-Params.Rmd"))


# create iterative reports ------------------------------------------------ 
## If you have run the code prevously, first, clear the output directory 
## before running code again.  

team <- unique(nba$team)

output_dir <- here("output")

reports <- tibble(
  input = here("docs", "Table-Params.Rmd"), 
  # output_file = stringr::str_c("../output/", team, "-.html"), 
  # or, use here()  for output file created in line 17 above 
  output_file = stringr::str_c(output_dir,"/", team, "-.html"),
  params = map(team, ~list(team = .))
 )

## Check input, output_file and params  
head(reports) 

reports %>% 
  pwalk(rmarkdown::render) 

# pwalk and map are from purrr package  


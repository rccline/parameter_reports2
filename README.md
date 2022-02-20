# parameter_reports2
Example of Parameterized RMarkdown Reports

The script *script/iterate.R* is intended to create parameterized reports from */docs/Table-Params.Rmd*  and send the output files to */output* folder.  

There is an error in lines 25 to 32 in iterate.R when creating the *params* parameter.   

```
reports <- tibble(
  input = here("doc-params", "Table-Params.Rmd"),
  # output_file = stringr::str_c("../output/", team, "-.html"),
  output_file = stringr::str_c(output_dir,"/", team, "-.html"),
  params = map(nba, ~list(team = .))
  # params = list(teams=teaml)
) 

```  

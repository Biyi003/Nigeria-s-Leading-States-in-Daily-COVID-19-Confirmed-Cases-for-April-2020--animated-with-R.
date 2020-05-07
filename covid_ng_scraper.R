#load necessary library
library(rvest)

webpage <- read_html("https://web.archive.org/web/20200423070934/http://covid19.ncdc.gov.ng/")

# empty list to add table data to
tabl <- list()

# scrape table with id custom3
tabl <- webpage %>%
  html_nodes("#custom3") %>% 
  html_table(fill = TRUE) %>%
  .[[1]]

#write data into file
df <- write.csv(tabl,"april_covid_ng/covid_ng_2204.csv", row.names = FALSE)
#load needed libraries
library(dplyr)
library(tidyverse)

#read in data
d1 <- read.csv("april_covid_ng/covid_ng_0104.csv")

#merge the needed columns
d1 <- cbind(d1[1], d1[2])

#rename columns
d1 <- d1 %>% 
  rename(
    states = States.Affected,
    confirmedCases = No..of.Cases..Lab.Confirmed.
  )

#remove unneeded row
d1 <- d1[-c(26),]

#create new column to account for date
nc <- data.frame(c(rep(1,25)))


#rename column
nc <- nc %>% 
  rename(
    Day = colnames(nc)
  )

#merge dataframes
df <- cbind(d1,nc)


## for 19th and 20th
#changing data types
df$confirmedCases <- as.numeric(as.character(df$confirmedCases))
##

#write the new data to a csv file
write.csv(df,"clean_data/new_0104.csv", row.names = FALSE)

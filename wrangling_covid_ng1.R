#set work directory

#load necessary libraries
library(dplyr)
library(tidyverse)

#read in the data
frm <- read.csv(".april_covid_ng/covid_ng_0104.csv")

#select the needed columns
d1 <- frm %>% select(States, Numbers)

#rename columns
d1 <- d1 %>% 
  rename(
    states = States,
    confirmedCases = Numbers
  )

#select needed columns again
d2 <- frm %>% select(States.1, Numbers.1)

#rename columns
d2 <- d2 %>% 
  rename(
    states = States.1,
    confirmedCases = Numbers.1
  )
#merge dataframes
dnu <- rbind(d1, d2)

#delete an unneeded row; row 38 in this case
dnu = dnu[-c(38),]

#create a new data frame accounting for date
nc <- data.frame(c(rep(1,37)))

#rename column
nc <- nc %>% 
  rename(
    Day = colnames(nc)
  )

#merge dataframes
df <- cbind(dnu,nc)

#write new data to file
write.csv(df,"clean_data/new_0104.csv", row.names = FALSE)
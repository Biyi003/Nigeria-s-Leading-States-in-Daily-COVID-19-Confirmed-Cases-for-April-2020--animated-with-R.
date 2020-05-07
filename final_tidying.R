library(tidyverse)

da1 <- read_csv("clean_data/new_0104.csv")

da2 <- read_csv("clean_data/new_0204.csv")

da3 <- read_csv("clean_data/new_0304.csv")

da5 <- read_csv("clean_data/new_0504.csv")

da6 <- read_csv("clean_data/new_0604.csv")

da7 <- read_csv("clean_data/new_0704.csv")

da8 <- read_csv("clean_data/new_0804.csv")

da9 <- read_csv("clean_data/new_0904.csv")

da10 <- read_csv("clean_data/new_1004.csv")

da11 <- read_csv("clean_data/new_1104.csv")

da12 <- read_csv("clean_data/new_1204.csv")

da13 <- read_csv("clean_data/new_1304.csv")

da14 <- read_csv("clean_data/new_1404.csv")

da15 <- read_csv("clean_data/new_1504.csv")

da16 <- read_csv("clean_data/new_1604.csv")

da17 <- read_csv("clean_data/new_1704.csv")

da18 <- read_csv("clean_data/new_1804.csv")

da19 <- read_csv("clean_data/new_1904.csv")

da20 <- read_csv("clean_data/new_2004.csv")

da22 <- read_csv("clean_data/new_2204.csv")

da23 <- read_csv("clean_data/new_2304.csv")

da24 <- read_csv("clean_data/new_2404.csv")

da25 <- read_csv("clean_data/new_2504.csv")

da26 <- read_csv("clean_data/new_2604.csv")

da27 <- read_csv("clean_data/new_2704.csv")

da28 <- read_csv("clean_data/new_2804.csv")

da29 <- read_csv("clean_data/new_2904.csv")

da30 <- read_csv("clean_data/new_3004.csv")

da <- rbind(da1, da2 , da3, da5, da6, da7, da8, da9, da10, da11, da12, da13, da14, da15, da16, da17, da18, da19, da20, da22, da23, da24, da25, da26, da27, da28, da29, da30)

write.csv(da, "clean_data/april_all.csv", row.names = FALSE)
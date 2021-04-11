library(tidyverse) #Needed to perform data tidying operations

#First, read the csv files by using the read_csv() functions.
#Then for each data, perform the data tidying operations so that the tables can be joined properly.
#Rename the countries' names to maintain the data consistency, and exclude the US from the tables.
Beds <- read_csv("C:/Users/johnt/Documents/Data Science/beds.csv")
Beds <- Beds %>% filter(Year == 2015)
Beds <- Beds %>% filter(Country != "United States of America")
Beds <- Beds %>% select(`Country`, `Number of Beds` = `Hospital beds (per 10 000 population)`)
Beds <- Beds %>% mutate(Country = replace(Country, Country == "Republic of Korea", "South Korea"))
Beds <- Beds %>% mutate(Country = replace(Country, Country == "Iran (Islamic Republic of)", "Iran"))
Beds <- Beds %>% mutate(Country = replace(Country, Country == "United Kingdom of Great Britain and Northern Ireland", "United Kingdom"))

Demographics <- read_csv("C:/Users/johnt/Documents/Data Science/demographics.csv")
Demographics <- Demographics %>% select(`Country Name`, `Series Code`, `YR2015`)
Demographics <- Demographics %>% pivot_wider(names_from = `Series Code`, values_from=`YR2015`)
Demographics <- Demographics %>% replace(is.na(.), 0) #Replace the NAs with the zeros.
Demographics <- Demographics %>% select(`Country` = `Country Name`, `POP TOTAL` = `SP.POP.TOTL`, `POP URBAN` = `SP.URB.TOTL`)
Demographics <- Demographics %>% mutate(Country=replace(Country, Country=="Korea, Dem. People's Rep.", "South Korea"))
Demographics <- Demographics %>% mutate(Country=replace(Country, Country=="Korea, Rep.", "South Korea"))
Demographics <- Demographics %>% mutate(Country=replace(Country, Country=="Iran, Islamic Rep.", "Iran"))
Demographics <- Demographics %>% filter(Country != "United States")

#Now combine all of the tables together into one whole main table.
Demographics_AND_Beds <- Demographics %>% inner_join(Beds)
#This main table will be the result obtained from data tidying and table joining.

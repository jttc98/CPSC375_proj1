library(tidyverse) #Needed to perform data tidying operations

#First, read the csv files by using the read_csv() functions.
#Then for each data, perform the data tidying operations so that the tables can be joined properly.
Demographics <- read_csv("C:/Users/johnt/Documents/Data Science/demographics.csv")
Demographics <- Demographics %>% select(`Country Name`, `Series Code`, `YR2015`)
Demographics <- Demographics %>% replace(is.na(.), 0) #Replace the NAs with the zeros.
Demographics <- Demographics %>% select(`Country` = `Country Name`)
#Rename the countries' names to maintain the data consistency.
Demographics <- Demographics %>% mutate(Country=replace(Country, Country=="Korea, Dem. People's Rep.", "South Korea"))
Demographics <- Demographics %>% mutate(Country=replace(Country, Country=="Korea, Rep.", "South Korea"))
Demographics <- Demographics %>% mutate(Country=replace(Country, Country=="Iran, Islamic Rep.", "Iran"))
#Exclude the US from the Demographics table.
Demographics <- Demographics %>% filter(Country != "United States")

#Now combine all of the tables together into one whole main table.
#This main table will be the result obtained from data tidying and table joining.

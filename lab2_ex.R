#to install package
install.packages("tidyverse")
#to look at the package you installed
.libPaths()
#to load package (need to do it everytime you close out on R)
library(readr)
library(tidyverse)

apple_data
#data is in form of a tibble (not data frame)

#subset data by column condition
brazil <- filter(apple_data, region == "Brazil")
#OR
brazil <- apple_data %>% 
  filter(region == "Brazil")

#selecting one variable/column
regions <- select(apple_data, region)
#OR
regions <-apple_data %>% 
  select(region)

#counting the different transportation (a column) types
count(apple_data,transportation_type)
#OR
apple_data %>% 
  count(transportation_type)

#order data by a column (regions)
alpha_order <- arrange(apple_data, regions)

#frequency table
table(regions)

#lowest/highest mobility 
summarise(long_apple, min(mobility_rate))
#ignore missing data
summarise(long_apple, max(mobility_rate), na.rm = TRUE)

#reshaping dataset to make individual day columns into one column with dates
#wide > long 
#new column name will be titled "day"
#input range of columns to put in new column "day"
long_apple<- gather(apple_data, key = day, value = mobility_rate, `2020-01-13`:`2020-08-20`)

tiktokData <- read_csv("2023H1_raw_data_law_English.csv")
#OR
tiktokData1<- read.csv("~/Desktop/SOC 367S: Data Science & Society/2023H1_raw_data_law_English.csv")

japan <- tiktokData %>% 
  filter(location_value == "Japan")
#old school way
japan1 <- tiktokData[tiktokData$location_value=="Japan",]

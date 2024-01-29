install.packages("tidyverse")
library(tidyverse)

 X<-3
 Y<-4

#This is how you create a variable in R. Remember not to use the "=" sign

 MikeKyrzsciecw <- 999
 
list.files("/Users/christopherbail/Documents/")
#this is how you browse a "folder" and "directory"

list.file

getwd()
setwd("~/Desktop")

#this is how you create a vector in R

#numeric vector
my_vector<- c(1,200,3,4)
#string vector
my_string_vector<- c("Mike", "Tom", "Abdul", "Grant")
my_string_vector[1]

#create a dataframe
mytibble<-tibble(likes = my_vector, names =my_string_vector)

mytibble$likes[2]

mytibble %>% filter(likes)

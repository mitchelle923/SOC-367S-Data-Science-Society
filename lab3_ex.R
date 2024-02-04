library(tidyverse)
apple_data <- read_csv("apple_mobility_data.csv")
#the values under each day is the rate of social distancing by day
long_data <- gather(apple_data, 
                    key = day, 
                    value = mobility_data, 
                    `2020-01-13`:`2020-08-20`)
country_avgs <- long_data %>% 
  filter(transportation_type == "walking") %>%
  group_by(country) %>%
  summarise(average = mean(mobility_data, na.rm = TRUE)) %>%
  filter(!is.na(country))

#BAR GRAPH
#"weight" because bar graphs don't graph relationships between x and y
ggplot(country_avgs, aes(y=reorder(country, average), weight = average)) +
  geom_bar(fill = "blue", color = "black") + xlab("Relative Rate of Walking Direction Requests")+ ylab("Country")
  theme_minimal()


ggplot(country_avgs, aes(y=reorder(average, x = country), weight = average)) +
  geom_bar(fill = "blue") +labs(title = "Average Mobility by Country",x = "Walking Directions Request Rate", y = "Country") +
  theme_minimal()

#LINE GRAPH
#character >> date
library(lubridate)
long_data$day #strings
long_data$day <- as_date(long_data$day) #date

italy_spain_data <- long_data %>% 
  filter(country %in% c("Italy", "Spain"),
         transportation_type == "walking") %>% 
  group_by(country, day) %>% 
  summarise(walking_avg = mean(mobility_data, na.rm = TRUE))

ggplot(italy_spain_data, aes(x = day, y = walking_avg, group = country, colour = country)) + 
  geom_line()+ facet_wrap(~country)
  theme_bw()+ylab("Relative Volume of Walking Direction Requests")


library(rgdal)
library(threejs)
data(LeMis)
graphjs(LeMis)
# Coursera Exploratory data analysis final project
# José Castillo Rabazo
# third plot of the assignment

#Have total emissions from PM2.5 decreased in the 
#Baltimore City, Maryland from 1999 to 2008?

library(dplyr)
library(ggplot2)

#Data loading
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

#Merge the two data sets
NEI %>% group_by(year) %>% filter(fips == "24510") %>%
  filter(type == "ON-ROAD") %>% 
  summarise(total = sum(Emissions)) -> NEIsub

#Create plot device
png("./plot5.png")
#Create plot
ggplot(NEIsub, aes(factor(year), total)) +
  geom_bar(stat = "identity") + 
  labs(x = "Year", y = "Tons of PM2.5", 
       title = "Total emissions from car sources in Baltimore city")
dev.off() #Close device

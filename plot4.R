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
NEISCC <- merge(NEI, SCC, by = "SCC")
coal <- grepl("coal", NEISCC$Short.Name,
              ignore.case = TRUE)
NEISCCsub <- NEISCC[coal, ]

add <- aggregate(Emissions ~ year, NEISCCsub, sum)

#Create plot device
png("./plot4.png")
#Create plot
ggplot(add, aes(factor(year), Emissions)) +
  geom_bar(stat = "identity") + 
  labs(x = "Year", y = "Tons of PM2.5", 
       title = "Total emissions from coal sources")
dev.off() #Close device

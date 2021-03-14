# Coursera Exploratory data analysis final project
# José Castillo Rabazo
# second plot of the assignment

#Have total emissions from PM2.5 decreased in the 
#Baltimore City, Maryland from 1999 to 2008?

library(dplyr)

#Data loading
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
#Selecting total PM2.5 data for each year using dplyr
NEI %>% group_by(year) %>% 
  filter(fips == "24510") %>% summarise(total = sum(Emissions)) -> NEI_short2
#Create plot device
png("./plot2.png")
#Create plot
plot(NEI_short2, main = "Total PM2.5 Emissions in Baltimore City per year",
     xlab = "Year", ylab = "Tons of PM2.5", type = "l")
dev.off() #Close device

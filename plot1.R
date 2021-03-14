# Coursera Exploratory data analysis final project
# José Castillo Rabazo
# First plot of the assignment

#Have total emissions from PM2.5 decreased 
#in the United States from 1999 to 2008? [Base plotting system]

library(dplyr)

#Data loading
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
#Selecting total PM2.5 data for each year using dplyr
NEI %>% group_by(year) %>% summarise(total = sum(Emissions)) -> NEI_short
#Create plot device
png("./plot1.png")
#Create plot
plot(NEI_short, main = "Total PM2.5 Emissions in the US per year",
     xlab = "Year", ylab = "Tons of PM2.5", type = "l")
dev.off() #Close device

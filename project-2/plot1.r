summary = readRDS("summarySCC_PM25.rds")
source = readRDS("Source_Classification_Code.rds")
te=tapply(summary$Emissions,summary$year,sum)
years = unique(summary$year)
plot(years,te,xlab = "Year",ylab = "Total PM Emissions",pch = 19,type = "l",col = "red")
title("Total PM emissions")
dev.copy(png,"plot1.png")
dev.off()
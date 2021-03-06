summary = readRDS("summarySCC_PM25.rds")
source = readRDS("Source_Classification_Code.rds")
library(ggplot2)
library(dplyr)
type_wise = summary%>%group_by(year,type)%>%summarise(summation = sum(Emissions))
qplot(year,summation,data = type_wise,color = type,geom = "line",ylab = "Total Emissions",main = "Total Emissions from different types")
dev.copy(png,"plot3.png")
dev.off()

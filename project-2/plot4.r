summary = readRDS("summarySCC_PM25.rds")
source = readRDS("Source_Classification_Code.rds")
library(ggplot2)
x = grepl("Comb+(.*)Coal",source$Short.Name)
source1 = source[x,]
source2 = source1[,c(1,3)]
mrg = merge(summary,source2,by.x = "SCC",by.y = "SCC")
years = unique(summary$year)
te = tapply(mrg$Emissions,mrg$year,sum)
qplot(years,te,geom = "line",ylab = "Total EMissions",main = "Emissions from coal-combustion related sources",col = "red")
dev.copy(png,"plot4.png")
dev.off()

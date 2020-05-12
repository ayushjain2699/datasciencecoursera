summary = readRDS("summarySCC_PM25.rds")
source = readRDS("Source_Classification_Code.rds")
library(ggplot2)
x = grepl("Highway Veh",source$Short.Name)
source1 = source[x,]
source2 = source1[,c(1,3)]
mrg = merge(summary,source2,by.x = "SCC",by.y = "SCC")
cond = mrg$fips == "24510"
mrg = mrg[cond,]
years = unique(summary$year)
te = tapply(mrg$Emissions,mrg$year,sum)
qplot(years,te,geom = "line",ylab = "Total EMissions",main = "Emissions from motor vehicles in Baltimore",col = "red")

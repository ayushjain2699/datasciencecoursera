summary = readRDS("summarySCC_PM25.rds")
source = readRDS("Source_Classification_Code.rds")
library(ggplot2)
x = grepl("Highway Veh",source$Short.Name)
source1 = source[x,]
source2 = source1[,c(1,3)]
mrg = merge(summary,source2,by.x = "SCC",by.y = "SCC")
cond = mrg$fips%in% c("24510","06037")
mrg = mrg[cond,]
library(dplyr)
type_wise = mrg%>%group_by(year,fips)%>%summarise(summation = sum(Emissions))
type_wise$fips = factor(type_wise$fips,labels = c("Los Angeles Country","Baltimore City)"))
names(type_wise)[2] = "Location"
qplot(year,summation,data = type_wise,color = Location,geom = "line",ylab = "Total Emissions",main = "Total Emissions from motor vehicles")
dev.copy(png,"plot6.png")
dev.off()

data = read.table("household_power_consumption.txt",sep = ";",na.strings = "?",skip = 1)
cond = grepl("1/2/2007"|"2/2/2007",data$V1)
data = data[cond,]
data2 = data[1:2880,]
library(lubridate)
library(stringr)
data2$V10 = paste(data2$V1,data2$V2)
data2$V10 = ymd_hms(data2$V10)
plot(data2$V10,data2$V3,type = "l",xlab = "",ylab = "Global Active Power(kilowatts)")
dev.copy(png,"plot2.png")
dev.off()
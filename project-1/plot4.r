data = read.table("household_power_consumption.txt",sep = ";",na.strings = "?",skip = 1)
cond = grepl("1/2/2007"|"2/2/2007",data$V1)
data = data[cond,]
data3 = data[1:2880,]
library(lubridate)
library(stringr)
data3$V10 = paste(data3$V1,data3$V2)
data3$V10 = ymd_hms(data3$V10)
par(mfrow = c(2,2))
with(data3,{}
)
with(data3,{plot(data3$V10,data3$V3,type = "l",xlab = "",ylab = "Global Active Power(kilowatts)")
plot(data3$V10,data2$V5,type = "l",xlab = "datetime",ylab = "Voltage")
plot(data3$V10,data3$V7,type = "l",xlab = "",col = "black",ylab = "Energy sub metering")
points(data3$V10,data3$V8,type = "l",col = "red")
points(data3$V10,data3$V9,type = "l",col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = c(1,1,1))
plot(data3$V10,data2$V4,type = "l",xlab = "datetime",ylab = "Global_reactive_Power(kilowatts)")
}
)
dev.copy(png,"plot4.png")
dev.off()

par(mfrow = c(2, 2))
library(sqldf)
par(mar = c(4,4,4,2))
#png('plot4.png')
data <- read.csv.sql("/home//ahsan/Coursera//Exploratory data analysis/household_power_consumption.txt", sql = "SELECT * from file 
WHERE Date in ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)
dateTime <- paste(data$Date,data$Time, " ")
dateTime <- strptime(dateTime, format = "%d/%m/%Y %H:%M:%S")
data <- cbind.data.frame(data, dateTime)
with(data,plot(Global_active_power~dateTime,type = "l", xlab = "", ylab = "Global active Power (killowats)"))
with(data,plot(Voltage~dateTime,type = "l", xlab = "", ylab = "Voltage"))
with(data,plot(Sub_metering_1~dateTime,type = "l", xlab = "", ylab = "Energy sub metering"))
with(data,lines(Sub_metering_2~dateTime,col = "red"))
with(data,lines(Sub_metering_3~dateTime,,col = "blue"))
#legend("topright", lwd = 1, col = c("black", "red","blue" ), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

with(data,plot(Global_reactive_power~dateTime,type = "l", xlab = "", ylab = "Global_reactive_power"))
dev.copy(png,'plot4.png')
dev.off()

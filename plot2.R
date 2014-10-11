library(sqldf)
data <- read.csv.sql("/home//ahsan/Coursera//Exploratory data analysis/household_power_consumption.txt", sql = "SELECT * from file 
WHERE Date in ('1/2/2007','2/2/2007') ", sep = ";", header = TRUE)
dateTime <- paste(data$Date,data$Time, " ")
dateTime <- strptime(dateTime, format = "%d/%m/%Y %H:%M:%S")
data <- cbind.data.frame(data, dateTime)
png('plot2.png')
with(data,plot(Global_active_power~dateTime,type = "l", xlab = "", ylab = "Global active Power (killowats)"))
dev.off()

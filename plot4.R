## plot4.R - program to create plot1.png image file

## Change to working directory containing data file
setwd("C:/Users/garfield/ExData_Plotting1")

## Read data
full_data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Select only data required for the plot from the dates 2007-02-01 and 2007-02-02
MyData <- full_data[full_data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(MyData$Date, MyData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(MyData$Global_active_power)
globalReactivePower <- as.numeric(MyData$Global_reactive_power)
voltage <- as.numeric(MyData$Voltage)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, as.numeric(MyData$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(datetime, as.numeric(MyData$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(MyData$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"), bty="n")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

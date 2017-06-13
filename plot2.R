## plot2.R - program to create plot1.png image file

## Change to working directory containing data file
setwd("C:/Users/garfield/ExData_Plotting1")

## Read data
full_data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Select only data required for the plot from the dates 2007-02-01 and 2007-02-02
MyData <- full_data[full_data$Date %in% c("1/2/2007","2/2/2007") ,]

#
datetime <- strptime(paste(MyData$Date, MyData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(MyData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
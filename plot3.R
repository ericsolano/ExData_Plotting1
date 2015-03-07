######## Exploratory Data Analysis ####################
###     Course Project 1
###      
###           Plot 3
######################################################


## rough estimate of required memory
##    nrows <- 2075259
##    ncols <- 9
##   mem <- nrows * ncols * 8  (bytes)
##   mem <- mem/1024/1024  = 142 Mb

colnames <- c('Date', 'Time' , 'Global_active_power',
              'Global_reactive_power', 'Voltage', 
              'Global_intensity', 'Sub_metering_1', 
              'Sub_metering_2', 'Sub_metering_3')

energy <- read.table("household_power_consumption.txt", header=TRUE,
                     sep=";", skip=66637, nrows=2880, col.names=colnames)

DateTime <- paste(energy$Date, energy$Time)
dates <- strptime(DateTime, "%d/%m/%Y %H:%M:%S") 

png("plot3.png",width=480, height=480, units="px")


plot(dates, energy$Sub_metering_1, pch='.', type='l', col="black",
     xlab='', ylab="Energy sub metering")

lines(dates, energy$Sub_metering_2, pch='.', type='l', col="red")
lines(dates, energy$Sub_metering_3, pch='.', type='l', col="blue")

legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, cex=.8, pt.cex = 1,
       col= c("black", "red", "blue"))

dev.off()


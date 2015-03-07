
######## Exploratory Data Analysis ####################
###     Course Project 1
###      
###           Plot 4
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

png("plot4.png",width=480, height=480, units="px")

par(mfrow=c(2,2))
par(mar=c(4.2,4.0,2.8,2.8))

# plot 1-1
plot(dates, energy$Global_active_power, pch='.', type='l',
     xlab='', ylab="Global Active Power")

#plot 1-2
plot(dates, energy$Voltage, pch='.', type='l',
     xlab='datetime', ylab="Voltage")

## plot 2-1
plot(dates, energy$Sub_metering_1, pch='.', type='l', col="black",
     xlab='', ylab="Energy sub metering")

lines(dates, energy$Sub_metering_2, pch='.', type='l', col="red")
lines(dates, energy$Sub_metering_3, pch='.', type='l', col="blue")

legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, cex=.9, pt.cex = 1,
       col= c("black", "red", "blue"), bty = "n")

#plot 2-2
plot(dates, energy$Global_reactive_power, pch='.', type='l',
     xlab='datetime', ylab="Global_reactive_power")


dev.off()

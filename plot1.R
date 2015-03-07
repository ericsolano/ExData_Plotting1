
######## Exploratory Data Analysis ####################
###
###     Course Project 1
###      
###           Plot 1
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


png("plot1.png",width=480, height=480, units="px")

hist(energy$Global_active_power, col="red", breaks=11, 
     main= "Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()
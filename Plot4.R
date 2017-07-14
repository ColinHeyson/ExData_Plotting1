
library(data.table)
library(dplyr)
dataset <- fread('C:/Users/u55p54/Desktop/test_csv/coursera/household_power_consumption.txt',
                 na.strings = c('?'))
# Combine data & time fields into one properly formatted POSIXct datetime field
dataset$datetime <- as.POSIXct(paste(dataset$Date, dataset$Time), format = '%d/%m/%Y %H:%M:%S')
dataset$Date <- as.Date(dataset$Date, '%d/%m/%Y')
dataset <- subset(dataset, Date >= "2007-02-01" & Date <= "2007-02-02")

# Set work directory
setwd('C:/Users/u55p54/Desktop/test_csv/coursera')
## Plot 4
# Set-up the png output with 480 x 480 pixelation
png('Plot4.png', width = 480, height = 480)

#set 2 x 2 panel situation
par(mfrow = c(2, 2))

#top left plot
plot(dataset$Global_active_power ~ dataset$datetime, col = 'black', type = 'l',
     ylab = 'Global Active Power', xlab = NA)

#top right plot
plot(dataset$Voltage ~ dataset$datetime, col = 'black', type = 'l',
     ylab = 'Voltage', xlab = 'datetime')

#bottom left plot
plot(dataset$Sub_metering_1 ~ dataset$datetime, type = 'l',
     main = 'Global Active Power', xlab = NA, ylab = 'Energy sub metering')
lines(dataset$Sub_metering_2 ~ dataset$datetime, col = 'red', lwd = 1.5)
lines(dataset$Sub_metering_3 ~ dataset$datetime, col = 'blue', lwd = 1.5)
legend("topright", legend = c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'), lwd=c(1.5, 1.5, 1.5), bty = 'n')

#bottom right plot
plot(dataset$Global_reactive_power ~ dataset$datetime, type = 'l',
     ylab = 'Global_reactive_power', xlab = 'datetime')
dev.off()
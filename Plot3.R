
library(data.table)
library(dplyr)
dataset <- fread('C:/Users/u55p54/Desktop/test_csv/coursera/household_power_consumption.txt',
                 na.strings = c('?'))
# Combine data & time fields into one properly formatted POSIXct datetime field
dataset$datetime <- as.POSIXct(paste(dataset$Date, dataset$Time), format = '%d/%m/%Y %H:%M:%S')
dataset$Date <- as.Date(dataset$Date, '%d/%m/%Y')
dataset <- subset(dataset, Date >= "2007-02-01" & Date <= "2007-02-02")

setwd('C:/Users/u55p54/Desktop/test_csv/coursera')
## Plot 3
# Set-up the png output with 480 x 480 pixelation
png('Plot3.png', width = 480, height = 480)

plot(dataset$Sub_metering_1 ~ dataset$datetime, type = 'n',
     main = 'Global Active Power', xlab = NA, ylab = 'Energy sub metering')
lines(dataset$Sub_metering_1 ~ dataset$datetime, col = 'black', lwd = 1.5)
lines(dataset$Sub_metering_2 ~ dataset$datetime, col = 'red', lwd = 1.5)
lines(dataset$Sub_metering_3 ~ dataset$datetime, col = 'blue', lwd = 1.5)
legend("topright", legend = c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'), lwd=c(1.5, 1.5, 1.5))
dev.off()
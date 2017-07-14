
library(data.table)
library(dplyr)
dataset <- fread('C:/Users/Colin/Documents/exdata_data_household_power_consumption/household_power_consumption.txt',
                na.strings = c('?'))
# Combine data & time fields into one properly formatted POSIXct datetime field
dataset$datetime <- as.POSIXct(paste(dataset$Date, dataset$Time), format = '%d/%m/%Y %H:%M:%S')
dataset$Date <- as.Date(dataset$Date, '%d/%m/%Y')
dataset <- subset(dataset, Date >= "2007-02-01" & Date <= "2007-02-02")

## Plot 1
# Set-up the png output with 480 x 480 pixelation
png('Plot1.png', width = 480, height = 480)

hist(dataset$Global_active_power, col = 'red',
     main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')

dev.off()

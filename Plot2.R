
library(data.table)
library(dplyr)
dataset <- fread('C:/Users/u55p54/Desktop/test_csv/coursera/household_power_consumption.txt',
                 na.strings = c('?')) # missing values are ? in this dataset

# Combine data & time fields into one properly formatted POSIXct datetime field
dataset$datetime <- as.POSIXct(paste(dataset$Date, dataset$Time), format = '%d/%m/%Y %H:%M:%S')
dataset$Date <- as.Date(dataset$Date, '%d/%m/%Y')
dataset <- subset(dataset, Date >= "2007-02-01" & Date <= "2007-02-02")

# Set-up the png output with 480 x 480 pixelation
png('Plot2.png', width = 480, height = 480)

#Plot 2
plot(dataset$Global_active_power ~ dataset$datetime, col = 'black', type = 'n',
     main = 'Global Active Power', ylab = 'Global Active Power (kilowatts)', xlab = NA)
lines(dataset$Global_active_power ~ dataset$datetime)

dev.off()
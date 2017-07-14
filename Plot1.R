
library(data.table)
library(dplyr)
dataset <- fread('C:/Users/Colin/Documents/exdata_data_household_power_consumption/household_power_consumption.txt')
dataset$Date <- as.Date(dataset$Date, '%d/%m/%Y')
dataset <- subset(dataset, Date >= "2007-02-01" & Date <= "2007-02-02")
dataset$Time <- strptime(dataset$Time, format = "%H:%M:%S")

## define a function to take blanks or emptys into nas
empty_as_na <- function(x){
    if("factor" %in% class(x)) x <- as.character(x) ## since ifelse wont work with factors
    ifelse(x %in% c("", " ", "NA", '$', '?'), NA, x)
}

## transform all columns
dataset %>% mutate_each(funs(empty_as_na)) -> dataset

#Plot 1
hist(as.numeric(dataset$Global_active_power), col = 'red',
     main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')

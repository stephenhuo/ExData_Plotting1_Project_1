
## Read data
household_data <- read.csv ("household_power_consumption.txt", sep = ";", na.strings="?")
household_data <- as.data.frame(household_data)

## generate sub_set 
sub_set <- subset(household_data, as.Date(Date,format="%d/%m/%Y") == as.Date("01/02/2007", format="%d/%m/%Y") | 
                          as.Date(Date,format="%d/%m/%Y") == as.Date("02/02/2007",format="%d/%m/%Y"))



## Create a second subset when Date and time are convined with format %d/%m/%Y %H:%M:%S using as.POSIXct
sub_set$DateTime = as.POSIXct(paste(sub_set$Date, sub_set$Time), format="%d/%m/%Y %H:%M:%S")
## define plot sieze and create png file
png('plot2.png',width=480,height=480)
## create plot
plot(sub_set$Global_active_power ~ sub_set$DateTime, type='l', 
     ylab='Global Active Power (kilowatts)',xlab='')

## close device
dev.off()

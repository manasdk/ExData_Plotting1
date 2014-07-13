# read and the create the subset for necessary dates.
data <- read.csv('household_power_consumption.txt', sep=';', na.strings= '?', header = TRUE)
data <- subset(data, data$Date == '1/2/2007' | data$Date == '2/2/2007')
# create plot
png(filename = 'plot1.png', width = 480, height = 480, units = 'px')
hist(data$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.off()
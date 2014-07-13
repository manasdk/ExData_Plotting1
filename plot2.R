# read and the create the subset for necessary dates.
data <- read.csv('household_power_consumption.txt', sep=';', na.strings= '?', header = TRUE)
data <- subset(data, data$Date == '1/2/2007' | data$Date == '2/2/2007')
# date_time field
date_time <- paste(data$Date, data$Time, sep =' ')
date_time <- strptime(date_time, format='%d/%m/%Y %H:%M:%S')
# plot
png(filename = 'plot2.png', width = 480, height = 480, units = 'px')
plot(date_time, data$Global_active_power, type='l', ylab = 'Global Active Power (kilowatts)', xlab = '')
dev.off()
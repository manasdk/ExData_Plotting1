# read and the create the subset for necessary dates.
data <- read.csv('household_power_consumption.txt', sep=';', na.strings= '?', header = TRUE)
data <- subset(data, data$Date == '1/2/2007' | data$Date == '2/2/2007')
# date_time field
date_time <- paste(data$Date, data$Time, sep =' ')
date_time <- strptime(date_time, format='%d/%m/%Y %H:%M:%S')

# plots
png(filename = 'plot4.png', width = 480, height = 480, units = 'px')
par(mfrow = c(2,2))
#plot 1
plot(date_time, data$Global_active_power, type='l', ylab = 'Global Active Power', xlab = '')
#plot 2
plot(date_time, data$Voltage, type='l', ylab = 'Voltage', xlab = 'datetime')
#plot 3
plot(date_time, data$Sub_metering_1, type='l', col='black', ylab = 'Energy sub metering', xlab = '')
lines(date_time, data$Sub_metering_2, type='l', lwd=1.5, col='red') 
lines(date_time, data$Sub_metering_3, type='l', lwd=1.5, col='blue') 
legend('topright', lty=1, lwd=1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
#plot 4
plot(date_time, data$Global_reactive_power, type='l', ylab = 'Global_reactive_power', xlab = 'datetime')
dev.off()
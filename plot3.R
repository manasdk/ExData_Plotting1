# read and the create the subset for necessary dates.
data <- read.csv('household_power_consumption.txt', sep=';', na.strings= '?', header = TRUE)
data <- subset(data, data$Date == '1/2/2007' | data$Date == '2/2/2007')
# date_time field
date_time <- paste(data$Date, data$Time, sep =' ')
date_time <- strptime(date_time, format='%d/%m/%Y %H:%M:%S')
# plot
png(filename = 'plot3.png', width = 480, height = 480, units = 'px')
plot(date_time, data$Sub_metering_1, type='l', ylab = 'Energy sub metering', xlab = '', col='black')
lines(date_time, data$Sub_metering_2, type='l', lwd=1.5, col='red') 
lines(date_time, data$Sub_metering_3, type='l', lwd=1.5, col='blue') 
legend('topright', lty=1, lwd=1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()
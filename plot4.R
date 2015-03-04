source('plot-utils.R')

# Uncomment to get correct names of weekdays on different locales
#Sys.setlocale(category = "LC_TIME", locale = "en_GB.utf8")

data <- load_data()

png(file='plot4.png', width=480, height=480, bg='transparent')

# Grid
par(mfrow=c(2,2), cex=0.75)

# Top left
plot(
    as.POSIXlt(data$datetime),
    data$Global_active_power, 
    main='',
    type='l',
    ylab='Global Active Power',
    xlab=''
)

# Top right
plot(
    as.POSIXlt(data$datetime),
    data$Voltage, 
    main='',
    type='l',
    ylab='Voltage',
    xlab='datetime'
)

# Bottom left
plot(
    as.POSIXlt(data$datetime),
    data$Sub_metering_1, 
    main='',
    type='l',
    ylab='Energy sub metering',
    xlab=''
)
lines(
    as.POSIXlt(data$datetime),
    data$Sub_metering_2,
    col='red'
)
lines(
    as.POSIXlt(data$datetime),
    data$Sub_metering_3,
    col='blue'
)
legend(
    'topright', 
    legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
    lty=c(1, 1, 1),
    bty='n',
    col=c('black', 'red', 'blue')
)

# Bottom right
plot(
    as.POSIXlt(data$datetime),
    data$Global_reactive_power, 
    main='',
    type='l',
    ylab='Global_reactive_power',
    xlab='datetime'
)

dev.off()
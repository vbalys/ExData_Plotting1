source('plot-utils.R')

# Uncomment to get correct names of weekdays on different locales
#Sys.setlocale(category = "LC_TIME", locale = "en_GB.utf8")

data <- load_data()

png(file='plot3.png', width=480, height=480, bg='transparent')

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
    col=c('black', 'red', 'blue')
)
    
dev.off()
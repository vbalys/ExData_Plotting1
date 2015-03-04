source('plot-utils.R')

# Uncomment to get correct names of weekdays on different locales
#Sys.setlocale(category = "LC_TIME", locale = "en_GB.utf8")

data <- load_data()

png(file='plot2.png', width=480, height=480, bg='transparent')

plot(
    as.POSIXlt(data$datetime),
    data$Global_active_power, 
    main='',
    type='l',
    ylab='Global Active Power (kilowats)',
    xlab=''
)

dev.off()
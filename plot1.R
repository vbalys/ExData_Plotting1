source('plot-utils.R')

data <- load_data()

png(file='plot1.png', width=480, height=480, bg='transparent')

hist(
    data$Global_active_power, 
    col='red', 
    main='Global Active Power', 
    xlab='Global Active Power (kilowats)',
    ylab='Frequency'
)

dev.off()
## Utilities for plotting scripts

library(dplyr)

# Function to download, unzip and load data
load_data <- function() {
    url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
    zip_file <- 'exdata_data_household_power_consumption.zip'
    data_file <- 'household_power_consumption.txt'
    if (!file.exists(data_file)) {
        if (!file.exists(zip_file)) {
            download.file(url, dest=zip_file, method='curl')
        }
        if (file.exists(zip_file)) {
            unzip(zip_file)
        } else {
            stop('Fatal error: no data found')
        }
    }
    if (!file.exists(data_file)) {
        stop('Fatal error: no data found')
    }
    
    data <- read.table(
        data_file, 
        sep=';', 
        quote='', 
        na.strings='?', 
        skip=66637, 
        nrow=2880, 
        col.names=c('Date', 'Time', 
                    'Global_active_power', 'Global_reactive_power',  
                    'Voltage', 'Global_intensity', 
                    'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
        stringsAsFactors=FALSE
    )
    data <- data %>% 
        mutate(datetime = as.character(strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S')))
    data
}
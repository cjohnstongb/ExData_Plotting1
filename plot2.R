house_power <-
    read.table(
        'household_power_consumption.txt',
        sep = ';',
        header = TRUE,
        stringsAsFactors = FALSE,
        na.strings = '?'
    )
house_power <-
    subset(house_power,
           (house_power$Date == '1/2/2007') |
               (house_power$Date == '2/2/2007'))
house_power$eventTime <-
    strptime(paste(house_power$Date, house_power$Time),
             '%d/%m/%Y %H:%M:%S')

png('plot2.png')

plot(
    house_power$eventTime,
    house_power$Global_active_power,
    type = 'l',
    ylab = 'Global Active Power (kilowatts)',
    xlab = ''
)

dev.off()

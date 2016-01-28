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
png('plot4.png')

par('mfcol' = c(2, 2))

plot(
    house_power$eventTime,
    house_power$Global_active_power,
    type = 'l',
    ylab = 'Global Active Power (kilowatts)',
    xlab = ''
)

plot(
    house_power$eventTime,
    house_power$Sub_metering_1,
    type = 'l',
    ylab = 'Energy sub metering',
    xlab = ''
)
points(
    house_power$eventTime,
    house_power$Sub_metering_2,
    type = 'l',
    col = 'red'
)
points(
    house_power$eventTime,
    house_power$Sub_metering_3,
    type = 'l',
    col = 'blue'
)
legend(
    'topright',
    legend = names(house_power)[7:9],
    lty = 1,
    col = c('black', 'red', 'blue')
)

plot(
    house_power$eventTime,
    house_power$Voltage,
    type = 'l',
    ylab = 'Voltage',
    xlab = 'datetime'
)

plot(
    house_power$eventTime,
    house_power$Global_reactive_power,
    type = 'l',
    ylab = 'Global_reactive_power',
    xlab = 'datetime',
    yaxt = 'n'
)
axis(2, at = seq(0, 0.5, by = 0.1), las = 3)

dev.off()

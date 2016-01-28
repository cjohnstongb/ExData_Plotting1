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
           (house_power$Date == '1/2/2007') | (house_power$Date == '2/2/2007'))

png('plot1.png')

hist(
    house_power$Global_active_power,
    col = 'red',
    xlab = 'Global Active Power (kilowatts)',
    main = 'Global Active Power'
)

dev.off()
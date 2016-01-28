house_power<-read.table('household_power_consumption.txt',nrows=100,sep=';',header=TRUE,stringsAsFactors = FALSE)
house_power$eventTime<-strptime(paste(house_power$Date,house_power$Time),'%d/%m/%Y %H:%M:%S')

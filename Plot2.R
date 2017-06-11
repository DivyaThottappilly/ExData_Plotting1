#Reading and naming 9 variables in power consumption data
power <- read.table("./data/household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Subsetting data from the dates 2007-02-01 and 2007-02-02
subPower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")


# Transforming the Dates and Time
dateTime <- strptime(paste(subPower$Date, subPower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(as.character(subPower$Global_active_power))

#Plot2- Global Active Power Vs Time
png("plot2.png", width=480, height=480)
plot(dateTime,globalActivePower, type="l", main="Global Active Power vs Time",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
#Reading and naming 9 variables in power consumption data
power <- read.table("./data/household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#Subsetting data from the dates 2007-02-01 and 2007-02-02
subPower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
# Transforming the Dates and Time
dateTime <- strptime(paste(subPower$Date, subPower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(as.character(subPower$Global_active_power))
subMetering1 <- as.numeric(as.character(subPower$Sub_metering_1))
subMetering2 <- as.numeric(as.character(subPower$Sub_metering_2))
subMetering3 <- as.numeric(as.character(subPower$Sub_metering_3))
globalReactivePower <- as.numeric(as.character(subPower$Global_reactive_power))
voltage <- as.numeric(as.character(subPower$Voltage))

#Plot4 
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

#Subplot 1 
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
#Subplot 2
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")
#Subplot 3
plot(dateTime,subMetering1, type="l",xlab="", ylab="Energy sub metering")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"))
#Subplot 4
plot(dateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

#Reading and naming 9 variables in power consumption data
power <- read.table("./data/household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Subsetting data from the dates 2007-02-01 and 2007-02-02
subPower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")


#Plot1- Global Active Power
globalActivePower <- as.numeric(as.character(subPower$Global_active_power))
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
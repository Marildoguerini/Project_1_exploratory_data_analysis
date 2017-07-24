## Reading Data
File <- "./household_power_consumption.txt"
consumption <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetconsumption <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]

## Transforming data end calling the function
filetime <- strptime(paste(subSetconsumption$Date, subSetconsumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(subSetconsumption$Global_active_power)
GRP <- as.numeric(subSetconsumption$Global_reactive_power)
vol <- as.numeric(subSetconsumption$Voltage)
subMetering1 <- as.numeric(subSetconsumption$Sub_metering_1)
subMetering2 <- as.numeric(subSetconsumption$Sub_metering_2)
subMetering3 <- as.numeric(subSetconsumption$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(filetime, GAP, type="l", xlab="time", ylab="Global Active Power", cex=0.2)
plot(filetime, vol, type="l", xlab="time", ylab="Voltage")
plot(filetime, subMetering1, type="l", ylab="Energy Submetering", xlab="time")
lines(filetime, subMetering2, type="l", col="magenta")
lines(filetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("grey", "magenta", "blue"), bty="o")
plot(filetime, GRP, type="l", xlab="time", ylab="Global_reactive_power")
dev.off()

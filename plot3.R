## Reading Data
File <- "./household_power_consumption.txt"
consumption <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetconsumption <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]

## Transforming data end calling the function
filetime <- strptime(paste(subSetconsumption$Date, subSetconsumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(subSetconsumption$Global_active_power)
subMetering1 <- as.numeric(subSetconsumption$Sub_metering_1)
subMetering2 <- as.numeric(subSetconsumption$Sub_metering_2)
subMetering3 <- as.numeric(subSetconsumption$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(filetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(filetime, subMetering2, type="l", col="magenta")
lines(filetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("grey", "magenta", "blue"))
title(main="Energy sub-metering")
dev.off()
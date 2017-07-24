## Reading Data
File <- "./household_power_consumption.txt"
consumption <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetconsumption <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]

##Transforming data and calling the function
filetime <- strptime(paste(subSetconsumption$Date, subSetconsumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(subSetconsumption$Global_active_power)
png("plot2.png", width=480, height=480)
plot(filetime, globalActivePower, type="l", xlab="", ylab="kilowatts")
title(main="Global Active Power Vs Time")
dev.off()
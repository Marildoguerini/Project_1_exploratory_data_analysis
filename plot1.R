## Reading Data
File <- "./household_power_consumption.txt"
consumption <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetconsumption <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]

##calling the function
GAP <- as.numeric(subSetconsumption$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GAP, col="green", main="Global Active Power", xlab="kilowatt")
dev.off()
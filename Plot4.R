setwd("C:/Users/brjani70/datasciencecoursera/ExploratoryDataAnalysis")

HHPC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subHHPC <- HHPC[HHPC$Date %in% c("1/2/2007","2/2/2007"), ]

##concatenating time and date together and converting to date format
subHHPC$ConcatDate <- strptime(paste(subHHPC$Date, subHHPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subHHPC$Global_active_power <- as.numeric(subHHPC$Global_active_power)
subHHPC$Global_reactive_power <- as.numeric(subHHPC$Global_reactive_power)
subHHPC$Voltage <- as.numeric(subHHPC$Voltage)
subHHPC$Sub_metering_1 <- as.numeric(subHHPC$Sub_metering_1)
subHHPC$Sub_metering_2 <- as.numeric(subHHPC$Sub_metering_2)
subHHPC$Sub_metering_3 <- as.numeric(subHHPC$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(subHHPC$ConcatDate, subHHPC$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(subHHPC$ConcatDate, subHHPC$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(subHHPC$ConcatDate, subHHPC$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(subHHPC$ConcatDate, subHHPC$Sub_metering_2, type="l", col="red")
lines(subHHPC$ConcatDate, subHHPC$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(subHHPC$ConcatDate, subHHPC$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
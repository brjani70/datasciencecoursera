setwd("C:/Users/brjani70/datasciencecoursera/ExploratoryDataAnalysis")

HHPC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subHHPC <- HHPC[HHPC$Date %in% c("1/2/2007","2/2/2007"), ]

##concatenating time and date together and converting to date format
subHHPC$ConcatDate <- strptime(paste(subHHPC$Date, subHHPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subHHPC$Global_active_power <- as.numeric(subHHPC$Global_active_power)
subHHPC$Sub_metering_1 <- as.numeric(subHHPC$Sub_metering_1)
subHHPC$Sub_metering_2 <- as.numeric(subHHPC$Sub_metering_2)
subHHPC$Sub_metering_3 <- as.numeric(subHHPC$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(subHHPC$ConcatDate, subHHPC$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(subHHPC$ConcatDate, subHHPC$Sub_metering_2, type="l", col="red")
lines(subHHPC$ConcatDate, subHHPC$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
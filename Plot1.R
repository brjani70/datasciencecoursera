getwd()
setwd("C:/Users/brjani70/datasciencecoursera/ExploratoryDataAnalysis")

HHPC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subHHPC <- HHPC[HHPC$Date %in% c("1/2/2007","2/2/2007"), ]

summary(subHHPC)
subHHPC$Global_active_power <- as.numeric(subHHPC$Global_active_power)
png("plot1.png", width=480, height=480)
hist(subHHPC$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

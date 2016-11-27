setwd("C:/Users/brjani70/datasciencecoursera/ExploratoryDataAnalysis")

HHPC <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subHHPC <- HHPC[HHPC$Date %in% c("1/2/2007","2/2/2007"), ]

?strptime

##concatenating time and date together and converting to date format
subHHPC$ConcatDate <- strptime(paste(subHHPC$Date, subHHPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subHHPC$Global_active_power <- as.numeric(subHHPC$Global_active_power)
png("plot2.png", width=480, height=480)
plot(subHHPC$ConcatDate, subHHPC$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
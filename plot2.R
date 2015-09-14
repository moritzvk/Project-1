# Assuming you have unziped "household_power_consumption.txt" into your working directory and have set it accordingly (setwd())

DF <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?")

DF$Date <- as.Date(DF$Date,format = "%d/%m/%Y")

DF$DateTime <- paste(DF$Date,DF$Time)

DF$DateTime <- strptime(DF$DateTime, format = "%Y-%m-%d %H:%M:%S")

DF$Date <- NULL

DF$Time <- NULL

DFsub <- subset(DF,DF$DateTime>="2007-02-01 00:00:00"&DF$DateTime<"2007-02-03 00:00:00")

plot(DFsub$DateTime,DFsub$Global_active_power, type = "l",ylab = "Global Active Power (kilowatts)",xlab="")

dev.copy(png,width=480,height=480,file="plot2.png")
dev.off()
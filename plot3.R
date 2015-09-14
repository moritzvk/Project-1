# Assuming you have unziped "household_power_consumption.txt" into your working directory and have set it accordingly (setwd())

DF <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?")

DF$Date <- as.Date(DF$Date,format = "%d/%m/%Y")

DF$DateTime <- paste(DF$Date,DF$Time)

DF$DateTime <- strptime(DF$DateTime, format = "%Y-%m-%d %H:%M:%S")

DF$Date <- NULL

DF$Time <- NULL

DFsub <- subset(DF,DF$DateTime>="2007-02-01 00:00:00"&DF$DateTime<"2007-02-03 00:00:00")

plot(DFsub$DateTime,DFsub$Sub_metering_1, type = "n",ylab = "Energy sub metering",xlab="")

lines(DFsub$DateTime,DFsub$Sub_metering_1, col = "black")
lines(DFsub$DateTime,DFsub$Sub_metering_2, col = "red")
lines(DFsub$DateTime,DFsub$Sub_metering_3, col = "blue")

legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,width=480,height=480,file="plot3.png")
dev.off()

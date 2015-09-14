# Assuming you have unziped "household_power_consumption.txt" into your working directory and have set it accordingly (setwd())

DF <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?")

DF$Date <- as.Date(DF$Date,format = "%d/%m/%Y")

DF$DateTime <- paste(DF$Date,DF$Time)

DF$DateTime <- strptime(DF$DateTime, format = "%Y-%m-%d %H:%M:%S")

DF$Date <- NULL

DF$Time <- NULL

DFsub <- subset(DF,DF$DateTime>="2007-02-01 00:00:00"&DF$DateTime<"2007-02-03 00:00:00")


hist(DFsub$Global_active_power, breaks = 12, xlab= "Global Active Power (kilowatts)", 
     ylab="Frequency", main = "Global Active Power"
     , freq=TRUE, col = "red", cex.lab=0.8, cex.axis=0.8)

dev.copy(png,width=480,height=480,file="plot1.png")
dev.off()

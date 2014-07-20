dt <- read.table("household_power_consumption.txt",header=TRUE,sep=';')
dt$Date <- as.Date(as.character(dt$Date),"%d/%m/%Y")
dt1 <- dt[dt$Date >= as.Date("2007-02-01") & dt$Date <= as.Date("2007-02-02"),]


dt1$Global_active_power <- as.numeric(as.character(dt1$Global_active_power))

time <- paste(as.character(dt1$Date),as.character(dt1$Time),sep=" ")
tim <- as.POSIXct(time)
dt1$Sub_metering_1 <- as.numeric(as.character(dt1$Sub_metering_1))
dt1$Sub_metering_2 <- as.numeric(as.character(dt1$Sub_metering_2))
dt1$Sub_metering_3 <- as.numeric(as.character(dt1$Sub_metering_3))
dt1$Global_reactive_power <- as.numeric(as.character(dt1$Global_reactive_power))
dt1$Voltage <- as.numeric(as.character(dt1$Voltage))

png(filename = "plot4.png",
    width = 480, height = 480)

par(mfrow=c(2,2))

plot(tim,dt1$Global_active_power,type="l",xlab="",
     ylab="Global Active Power (kilowatts)")


plot(tim,dt1$Voltage,xlab="datetime",ylab="Voltage",type="l")



plot(tim,dt1$Sub_metering_1,col="black",type="l",lwd=1,
     ylab="Energy sub metering")
lines(tim,dt1$Sub_metering_2,col="red")
lines(tim,dt1$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=c(2,2,2), col=c("black","red","blue"),bty="n")
plot(tim,dt1$Global_reactive_power,xlab="datetime",
     ylab="Global_reactive_power",type="l")

dev.off()


dt <- read.table("household_power_consumption.txt",header=TRUE,sep=';')
dt$Date <- as.Date(as.character(dt$Date),"%d/%m/%Y")
dt1 <- dt[dt$Date >= as.Date("2007-02-01") & dt$Date <= as.Date("2007-02-02"),]

time <- paste(as.character(dt1$Date),as.character(dt1$Time),sep=" ")
tim <- as.POSIXct(time)
dt1$Sub_metering_1 <- as.numeric(as.character(dt1$Sub_metering_1))
dt1$Sub_metering_2 <- as.numeric(as.character(dt1$Sub_metering_2))
dt1$Sub_metering_3 <- as.numeric(as.character(dt1$Sub_metering_3))

plot(tim,dt1$Sub_metering_1,col="black",type="l",lwd=1,
     ylab="Energy sub metering")
lines(tim,dt1$Sub_metering_2,col="red")
lines(tim,dt1$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd=c(2,2,2), col=c("black","red","blue"))
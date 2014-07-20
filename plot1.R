dt <- read.table("household_power_consumption.txt",header=TRUE,sep=';')
dt$Date <- as.Date(as.character(dt$Date),"%d/%m/%Y")
dt1 <- dt[dt$Date >= as.Date("2007-02-01") & dt$Date <= as.Date("2007-02-02"),]


dt1$Global_active_power <- as.numeric(as.character(dt1$Global_active_power))

png(filename = "plot1.png",
    width = 480, height = 480)
hist((dt1$Global_active_power),col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")


dev.off()



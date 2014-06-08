dt <- read.table("household_power_consumption.txt",header=TRUE,sep=';')
dt$Date <- as.Date(as.character(dt$Date),"%d/%m/%Y")
dt1 <- dt[dt$Date >= as.Date("2007-02-01") & dt$Date <= as.Date("2007-02-02"),]


dt1$Global_active_power <- as.numeric(as.character(dt1$Global_active_power))

time <- paste(as.character(dt1$Date),as.character(dt1$Time),sep=" ")
tim <- as.POSIXct(time)
plot(tim,dt1$Global_active_power,type="l",xlab="",
     ylab="Global Active Power (kilowatts)")
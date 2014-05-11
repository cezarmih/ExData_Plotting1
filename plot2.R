con <- file("household_power_consumption.txt")
open(con)
#epc <- read.table("household_power_consumption.txt", header = TRUE, skip = 90000, nrow = 5, sep =";", na.strings = "?")
epc <- read.table("household_power_consumption.txt", header = TRUE, nrow = 90000, sep =";", na.strings = "?")
epc <- transform(epc, Date = as.POSIXct(strptime(Date,"%d/%m/%Y")))
epc2 <- subset(epc, Date >= as.POSIXct(strptime("01/02/2007","%d/%m/%Y")))
epc2 <- subset(epc2, Date <= as.POSIXct(strptime("02/02/2007","%d/%m/%Y")))

epc3$DateTime <- as.POSIXct(paste(epc2$Date, epc2$Time,format="%Y-%m-%d %H:%M:%S"))

head(epc2)
head(epc3)


plot(epc3$DateTime,epc3[,3], type ="l", xlab = "", ylab = "Global active Power (kilowatts)")

dev.copy(png, file = "plot2.png", height = 480, width = 480, units = "px")
dev.off()


#hist(epc2$Global_active_power, main = "Global Active Power", col = "red", xlab= "Global active Power (kilowatts)")
#dev.copy(png, file = "plot1.png", height = 480, width = 480, units = "px")
#dev.off()


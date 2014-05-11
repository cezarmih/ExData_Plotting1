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


png(file = "plot4.png")
par(mfrow = c(2,2), mar = c(4,4,2,1), oma= c(0,0,2,0))

plot(epc3$DateTime,epc3[,3], type ="l", xlab = "", ylab = "Global active Power (kilowatts)")

plot(epc3$DateTime,epc3[,5], type ="l", xlab = "datetime", ylab = "Voltage")



plot(epc3$DateTime,epc3[, 7], type ="l", xlab = "", ylab = "Energy sub metering")
lines(epc3$DateTime,epc3[,8],col="Red")
lines(epc3$DateTime,epc3[,9],col="Blue")
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lwd=1, text.font = 6)

plot(epc3$DateTime,epc3[,4], type ="l", xlab = "datetime", ylab = "Voltage")


#dev.copy(png, file = "plot3.png",width=400,height=350,res=45, units = "px")
dev.off()




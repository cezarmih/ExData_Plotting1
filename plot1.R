con <- file("household_power_consumption.txt")
open(con)
#epc <- read.table("household_power_consumption.txt", header = TRUE, skip = 90000, nrow = 5, sep =";", na.strings = "?")
epc <- read.table("household_power_consumption.txt", header = TRUE, nrow = 90000, sep =";", na.strings = "?")
epc <- transform(epc, Date = as.POSIXct(strptime(Date,"%d/%m/%Y")))
epc2 <- subset(epc, Date >= as.POSIXct(strptime("01/02/2007","%d/%m/%Y")))
epc2 <- subset(epc2, Date <= as.POSIXct(strptime("02/02/2007","%d/%m/%Y")))

par(mar = c(4,4,1,1))
hist(epc2$Global_active_power, main = "Global Active Power", col = "red", xlab= "Global active Power (kilowatts)")
dev.copy(png, file = "plot1.png", height = 480, width = 480, units = "px")
dev.off()


tbl <- ("C:\\Users\\Todd\\Desktop\\Coursera\\household_power_consumption.txt")
data <- read.table(tbl, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
ssData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(ssData$Date, ssData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globactpwr<- as.numeric(ssData$Global_active_power)
ssmeter1<- as.numeric(ssData$Sub_metering_1)
ssmeter2<- as.numeric(ssData$Sub_metering_2)
ssmeter3<- as.numeric(ssData$Sub_metering_3)

png("plot3.png", height = 480, width = 480 )
plot(datetime, ssmeter1, type="l", ylab= "Energy Submetering", xlab= "")
lines(datetime, ssmeter2, col= "red", type = "l")
lines(datetime, ssmeter3, col= "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()


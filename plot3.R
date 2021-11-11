# plot 3


# read in the data (entire dataset)
data <- read.delim("household_power_consumption.txt", sep = ";",   na.strings = "?")
# subset to dates between 2007-02-01 and 2007-02-02
# first convert the Date column to date format
data[1] <- as.Date(data$Date, format= "%d/%m/%Y")
# then subset
data_sub1 <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
# remove original large file to save memory
rm(data)
data_sub1$day <- weekdays(data_sub1$Date)
data_sub1$day_no <- as.numeric(data_sub1$day)
data_sub1 <- transform(data_sub1, day = factor(day))

png(file="plot3.png",width=480,height=480)
plot(data_sub1$Sub_metering_1, type = "l", xlim=c(0, 3000), xaxt="n", ylab = "Energy sub metering", xlab=" ")
lines(data_sub1$Sub_metering_2, type="l", col="red", lty=1)
lines(data_sub1$Sub_metering_3, type="l", col="blue", lty=1)
axis(1, at=c(0, 1500, 3000), labels=z, cex.axis=1)
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), fill = c("black", "red", "blue"))
dev.off()

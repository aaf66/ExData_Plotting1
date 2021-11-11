# plot 2

# read in the data (entire dataset)
data <- read.delim("household_power_consumption.txt", sep = ";",   na.strings = "?")
# subset to dates between 2007-02-01 and 2007-02-02
# first convert the Date column to date format
data[1] <- as.Date(data$Date, format= "%d/%m/%Y")
# then subset
data_sub1 <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
# remove original large file to save memory
rm(data)
# (plot 2) make a scatterplot with connecting lines by day
# first make a new column with the day of the week using the weekdays function
data_sub1$day <- weekdays(data_sub1$Date)
data_sub1$day_no <- as.numeric(data_sub1$day)
data_sub1 <- transform(data_sub1, day = factor(day))
# then make a plot of global active power vs. day of the week
z <- c("Thu", "Fri", "Sat")
png(file="plot2.png",width=480,height=480)
plot(data_sub1$Global_active_power, type = "l", xlim=c(0, 3000), xaxt="n", ylab = "Global Active Power (kilowatts)", xlab=" ")
axis(1, at=c(0, 1500, 3000), labels=z, cex.axis=1)
dev.off()

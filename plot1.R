# plot 1

# read in the data (entire dataset)
data <- read.delim("household_power_consumption.txt", sep = ";",   na.strings = "?")
# subset to dates between 2007-02-01 and 2007-02-02
# first convert the Date column to date format
data[1] <- as.Date(data$Date, format= "%d/%m/%Y")
# then subset
data_sub1 <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
# remove original large file to save memory
rm(data)

# make the first histogram plot (plot1)
png(file="plot1.png",width=480,height=480)
hist(data_sub1$Global_active_power, col = "red", main="Global Active Power", xlab= "Global Active Power (kilowatts)")
dev.off()

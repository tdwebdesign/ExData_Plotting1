URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL,"household_power_consumption.zip")
unzip("household_power_consumption.zip")
library(data.table)
data <- fread("household_power_consumption.txt", na.strings="?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
datetime <- paste(data$Date, data$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
png(file = "plot2.png")
plot(datetime, as.numeric(data$Global_active_power), type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(datetime, as.numeric(data$Global_active_power))
dev.off()
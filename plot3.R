## Coursera Exploratory Data Analysis Course - Project 1
##  Plotting of electric power consumption data from UC Irvine Machine Learning Repository

## Load data: read the header and then skip to the appropriate row to 
## Read 1-Feb-2007 and 2-Feb-2007 data

header <- read.table("exdata_data_household_power_consumption//household_power_consumption.txt", 
                     sep=";", header=FALSE, nrows=1, stringsAsFactors = FALSE)

power.consumption <- read.table("exdata_data_household_power_consumption//household_power_consumption.txt",
                                sep=";", header=FALSE, skip=66637, nrows=2880)

colnames(power.consumption) <- header

# Convert the date and time from strings to the respective R data types
power.consumption$Date <- as.Date(power.consumption$Date, "%d/%m/%Y")
power.consumption$Time <- strptime(power.consumption$Time, "%H:%M:%S", tz = "GMT")
power.consumption$Time <- strftime(power.consumption$Time, "%H:%M:%S", tz = "GMT")

# Now plot the graph using the png graphics device
png("plot3.png", width = 480, height = 480)
plot(power.consumption$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="", xaxt='n')
points(power.consumption$Sub_metering_1, type="l")
points(power.consumption$Sub_metering_2, type="l", col="red")
points(power.consumption$Sub_metering_3, type="l", col="blue")
axis(1, at=c(0, nrow(power.consumption)/2, nrow(power.consumption)), labels = c("Thu", "Fri", "Sat"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "blue", "red"), lwd=1)
dev.off()


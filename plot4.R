datafile <- "./household_power_consumption.txt"
data <-
        read.table(
                datafile,
                header = TRUE,
                sep = ";",
                stringsAsFactors = FALSE,
                dec = ".",
                na.strings = "?"
        )
data$DateTime <-
        strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
data$Time <- format(data$Time, format = "%H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subsetdata <-
        subset(data, DateTime >= "2007-02-01" &
                       DateTime < "2007-02-03")

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(
        subsetdata$DateTime,
        subsetdata$Global_active_power,
        type = "l",
        xlab = "",
        ylab = "Global Active Power"
)
plot(
        subsetdata$DateTime,
        subsetdata$Voltage,
        type = "l",
        xlab = "datetime",
        ylab = "Voltage"
)
plot(
        subsetdata$DateTime,
        subsetdata$Sub_metering_1,
        type = "l",
        xlab = "",
        ylab = "Energy sub metering"
)
lines(subsetdata$DateTime, subsetdata$Sub_metering_2, col = "red")
lines(subsetdata$DateTime, subsetdata$Sub_metering_3, col = "blue")
legend(
        c("topright"),
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty = 1,
        lwd = 1,
        col = c("black", "red", "blue"),
        bty = "n"
)
plot(
        subsetdata$DateTime,
        subsetdata$Global_reactive_power,
        type = "l",
        xlab = "datetime",
        ylab = "Global_reactive_power"
)
dev.off()
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
subsetdata <-
        subset(data, DateTime >= "2007-02-01" &
                       DateTime < "2007-02-03")

png("plot3.png", width = 480, height = 480)
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
        col = c("black", "red", "blue")
)
dev.off()
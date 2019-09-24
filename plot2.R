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
        subset(data, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

plot(
        subsetdata$DateTime,
        subsetdata$Global_active_power,
        type = "l",
        xlab = "",
        ylab = "Global Active Power (kilowatts)"
)
dev.copy(png,
         file = "plot2.png",
         height = 480,
         width = 480)
dev.off()
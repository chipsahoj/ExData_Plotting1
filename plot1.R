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
data$Time <- format(data$Time, format = "%H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subsetdata <-
        subset(data, Date == "2007-02-01" | Date == "2007-02-02")

hist(
        subsetdata$Global_active_power,
        col = "red",
        main = "Global Active Power",
        xlab = "Global Active Power (kilowatts)",
        ylab = "Frequency"
)
dev.copy(png,
         file = "plot1.png",
         height = 480,
         width = 480)
dev.off()
# Loading the data
df <- read.table("household_power_consumption.txt", header = TRUE,
                 sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

# Data manipulation
data$datetime <- paste(data$Date, data$Time)
data$datetime <-  strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S")

# Making Plot in PNG file directly
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
Sys.setlocale("LC_TIME", "English")
with(data, plot(datetime, Global_active_power, type = "l", xlab = "",
                ylab = "Global Active Power", lwd = 1.5))
with(data, plot(datetime, Voltage, type = "l", lwd = 1.5))
plot(data$datetime, data$Sub_metering_1, type = "l", xlab = "",
                ylab = "Energy sub metering")
lines(data$datetime,data$Sub_metering_2, col = "red")
lines(data$datetime,data$Sub_metering_3, col = "blue")
legend("topright", lty = c(1, 1, 1), cex = 0.55, col = c("black", "blue", "red"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(data, plot(datetime, Global_reactive_power, type = "l"))

dev.off()

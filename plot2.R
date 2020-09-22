# Loading the data
df <- read.table("household_power_consumption.txt", header = TRUE,
                 sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
# Data manipulation
data$datetime <- paste(data$Date, data$Time)
data$datetime <-  strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S")
# Making Plot
Sys.setlocale("LC_TIME", "English")
with(data, plot(datetime, Global_active_power, type = "l", xlab = "",
                ylab = "Global Active Power (kilowatts)"))
# Save plot to PNG file
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()

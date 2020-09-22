 # Loading the data
df <- read.table("household_power_consumption.txt", header = TRUE,
                 sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
 # Check the data
summary(data)
 # Making Plot
with(data,hist(Global_active_power, col = "red", main = "Global Active Power",
               xlab = "Global Active Power (kilowatts)"))
 # Save plot to PNG file
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()

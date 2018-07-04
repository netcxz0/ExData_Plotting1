# ElectricPowerConsumption.R
# Read in the Electric Power Consumption data into R, then plot the data for analysis

# Read in the Electric Power Consumption data file "household_power_consumption.txt"

powerData <- read.table("household_power_consumption.txt", sep = ";",header = TRUE, na.strings = "?", 
                            colClasses = c("character", "character", rep("numeric", 7)))


# Convert string to Time type for Time column 
powerData$Time <- strptime(paste(powerData$Date,powerData$Time), "%d/%m/%Y %H:%M:%S")

# Convert string to Date type for Date column
powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y")

# Select data from 2007-02-01 to 2007-02-02 only
Data <- subset(powerData, Date >= "2007-02-01" & Date <= "2007-02-02")

# Open PNG device
png(filename = "plot2.png", width = 480, height = 480)

# plot the graph
with(Data, plot(Time, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l") )

# close the device
dev.off()

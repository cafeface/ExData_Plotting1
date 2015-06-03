# Script to create Plot 4, four panel graphs over 
# the first two days of February, 2007.

source("getData.R")

# The code accesses the data.frame "two_days," and if it does not exist, 
# gets the raw data online and creates it.

two_days <- getData()


png("figure//plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(two_days$Time, 
     as.numeric(as.character(two_days$Global_active_power)), 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(two_days$Time, 
     as.numeric(as.character(two_days$Voltage)), 
     type = "l", xlab = "datetime", ylab = "Voltage")

plot(two_days$Time, 
     as.numeric(as.character(two_days$Sub_metering_1)), 
     type = "l", xlab = "", ylab = "Energy sub metering")
lines(two_days$Time, as.numeric(as.character(two_days$Sub_metering_2)), col = "red")
lines(two_days$Time, as.numeric(as.character(two_days$Sub_metering_3)), col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), 
       border = "white", legend = names(two_days)[7:9])

plot(two_days$Time, 
     as.numeric(as.character(two_days$Global_reactive_power)), 
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

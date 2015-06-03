# Script to create Plot 2, a line graph of minute-averaged Global Active Power over 
# the first two days of February, 2007.

source("getData.R")

# The code accesses the data.frame "two_days," and if it does not exist, 
# gets the raw data online and creates it.

two_days <- getData()


png("figure//plot2.png", width = 480, height = 480)
plot(two_days$Time, 
     as.numeric(as.character(two_days$Global_active_power)), 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

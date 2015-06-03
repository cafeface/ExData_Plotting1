# Script to create Plot 1, a histogram of minute-averaged Global Active Power over 
# the first two days of February, 2007.

source("getData.R")

# The code accesses the data.frame "two_days," and if it does not exist, 
# gets the raw data online and creates it.

two_days <- getData()


png("plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(two_days$Global_active_power)), 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col = "red")
dev.off()

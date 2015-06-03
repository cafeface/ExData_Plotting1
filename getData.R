# Functions to supply data for plot<n>.R

txt_fname <- "household_power_consumption.txt"
zip_fname <- "exdata-data-household_power_consumption.zip"
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

getData <- function() {
    if (exists("two_days")) return(two_days)
    
    if (file.exists(txt_fname)) return(get_from_txt())
    
    if (file.exists(zip_fname)) return(get_from_zip())
    
    get_from_url()
}

get_from_txt <- function() {
    hpc <- read.csv2(txt_fname)
    hpc <- subset(hpc, Date == "2/1/2007" | Date == "2/2/2007")
    hpc$Date <- factor(hpc$Date)
    Date_Time <- strptime(paste(hpc$Date, hpc$Time), format = "%m/%d/%Y %H:%M:%S")
    hpc$Time <- Date_Time
    hpc
}

get_from_zip <- function() {
    unzip(zip_fname)
    get_from_txt()
}

get_from_url <- function() {
    download.file(url, zip_fname, method = "curl", quiet = TRUE)
    get_from_zip()
}

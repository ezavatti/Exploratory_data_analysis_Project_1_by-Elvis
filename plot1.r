
# R CODE TO CREATE PLOT 1

# download file

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.zip")
#unzip file

household_power_consumption.txt<- unzip("household_power_consumption.zip")

# create data frame. Change class of "Date" from factor to date". Subset

power<-read.table("household_power_consumption.txt", sep =";",header = TRUE)
power$Date<- as.character(power$Date)
power$Date<- as.Date(power$Date, format = "%d/%m/%Y")
power1<- power[power$Date >= "2007-02-01" & power$Date<= "2007-02-02",]
dev.off()

# Change Global_active_power as "numeric" 

power1$Global_active_power<- as.character(power1$Global_active_power)
power1$Global_active_power<- as.numeric(power1$Global_active_power)

# Generate plot 1 in png format

png("plot1.png", width = 480, height = 480)
plot(hist(power1$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
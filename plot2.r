# R CODE TO CREATE PLOT 2

# download file

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "household_power_consumption.zip")
#unzip file

household_power_consumption.txt<- unzip("household_power_consumption.zip")

# create data frame. Change class of "Date" from factor to "date".Subset. Striptime.

power<-read.table("household_power_consumption.txt", sep =";",header = TRUE)
power$Date<- as.character(power$Date)
power$Date<- as.Date(power$Date, format = "%d/%m/%Y")
power1<- power[power$Date >= "2007-02-01" & power$Date<= "2007-02-02",]
power1$date_time<- paste(power1$Date, power1$Time)
power1$date_time<- strptime(power1$date_time,  "%Y-%m-%d %H:%M:%S")


# Change Global_active_power as "numeric"
power1$Global_active_power<- as.character(power1$Global_active_power)
power1$Global_active_power<- as.numeric(power1$Global_active_power)

#plot into png

png("plot2.png", width = 480, height = 480)

plot(power1$date_time, power1$Global_active_power, type= "l", ylab = "Global Active Power (kilowatts)", xlab= " ")
dev.off()
# R CODE TO CREATE PLOT 3

# download file

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "household_power_consumption.zip")
#unzip file

household_power_consumption.txt<- unzip("household_power_consumption.zip")

power<-read.table("household_power_consumption.txt", sep =";",header = TRUE)
power$Date<- as.character(power$Date)
power$Date<- as.Date(power$Date, format = "%d/%m/%Y")
power1<- power[power$Date >= "2007-02-01" & power$Date<= "2007-02-02",]
power1$date_time<- paste(power1$Date, power1$Time)
power1$date_time<- strptime(power1$date_time,  "%Y-%m-%d %H:%M:%S")

# Change Sub_metering_(1,2,3) as "numeric"
power1$Sub_metering_1<- as.numeric(power1$Sub_metering_1)
power1$Sub_metering_2<- as.numeric(power1$Sub_metering_2)
power1$Sub_metering_3<- as.numeric(power1$Sub_metering_3)

#create  plot
png("plot3.png", width = 480, height = 480)
plot(power1$date_time, power1$Sub_metering_1, type= "l", ylab = "Energy sub metering", xlab=" ")
lines(power1$date_time, power1$Sub_metering_2, type ="l", col="red")
lines(power1$date_time, power1$Sub_metering_3, type ="l", col="blue")

#input the legend

legend("topright", legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, col= c("black", "red", "blue"), border= "black", text.col = "black")

dev.off()
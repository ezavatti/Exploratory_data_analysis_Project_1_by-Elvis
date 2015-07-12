# R CODE TO CREATE PLOT 4

# download file

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "household_power_consumption.zip")
#unzip file

household_power_consumption.txt<- unzip("household_power_consumption.zip")
#generate the data
power<-read.table("household_power_consumption.txt", sep =";",header = TRUE)
power$Date<- as.character(power$Date)
power$Date<- as.Date(power$Date, format = "%d/%m/%Y")
power1<- power[power$Date >= "2007-02-01" & power$Date<= "2007-02-02",]

#change Global_active_power to numeric

power1$Global_active_power<- as.character(power1$Global_active_power)
power1$Global_active_power<- as.numeric(power1$Global_active_power)

#change Voltage to numeric

power1$Voltage<- as.character(power1$Voltage)
power1$Voltage<- as.numeric(power1$Voltage)

#change Global_reactive_power to numeric
power1$Global_reactive_power<- as.character(power1$Global_reactive_power)
power1$Global_reactive_power<- as.numeric(power1$Global_reactive_power)

#set the plot area

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
par(mar=c(5,4,1,2))


# generate plots

plot(power1$date_time, power1$Global_active_power, type= "l", ylab = "Global Active Power", xlab= " ")
plot(power1$date_time, power1$Voltage, type= "l", ylab = "Voltage", xlab= "datetime")


plot(power1$date_time, power1$Sub_metering_1, type= "l", ylab = "Energy sub metering", xlab=" ")
lines(power1$date_time, power1$Sub_metering_2, type ="l", col="red")
lines(power1$date_time, power1$Sub_metering_3, type ="l", col="blue")
legend("topright", legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, col= c("black", "red", "blue"), bty = "n", text.col = "black", cex = 0.9)


plot(power1$date_time, power1$Global_reactive_power, type= "l", ylab = "Global_reactive_power", xlab= "datetime")

dev.off()
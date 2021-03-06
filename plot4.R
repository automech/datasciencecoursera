download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","coursera_assign_1.zip")
unzip("coursera_assign_1.zip")
data1 <- read.table(text = grep("^[1,2]/2/2007", readLines("./household_power_consumption.txt"), value = TRUE), sep = ";")
temp<- colnames(read.csv("./household_power_consumption.txt",sep=";",nrows = 1))
colnames(data1)<-temp

data1$Date<- as.Date(data1$Date, format="%d/%m/%Y")
data1$temp_dt <- as.POSIXct(paste(data1$Date,data1$Time))


#chart 4
png(filename="./plot4.png")

#set area
par(mfrow = c(2,2))

#chart a
plot(x=data1$temp_dt,y=data1$Global_active_power, type="l", xlab = "",ylab = "Global Active Power (kilowatts)")
#chart b
plot(x=data1$temp_dt,y=data1$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

#chart c
plot(x=data1$temp_dt,y=data1$Sub_metering_1, type="l", col="black", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(x=data1$temp_dt,y=data1$Sub_metering_2, col = 'Red')
lines(x=data1$temp_dt,y=data1$Sub_metering_3, col = 'Blue')
labels<- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend = labels, lwd=1,col = c("black", "red", "blue"))

#chart d
plot(x=data1$temp_dt,y=data1$Global_reactive_power, type = "l", xlab = "datetime")


dev.off()
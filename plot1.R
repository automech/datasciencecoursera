download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","coursera_assign_1.zip")
unzip("coursera_assign_1.zip")
data1 <- read.table(text = grep("^[1,2]/2/2007", readLines("./household_power_consumption.txt"), value = TRUE), sep = ";")
temp<- colnames(read.csv("./household_power_consumption.txt",sep=";",nrows = 1))
colnames(data1)<-temp

data1$Date<- as.Date(data1$Date, format="%d/%m/%Y")
data1$temp_dt <- as.POSIXct(paste(data1$Date,data1$Time))


#chart 1
png(filename="./plot1.png")

par(mfrow = c(1,1))
hist(data1$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")

dev.off()
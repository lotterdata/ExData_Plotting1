
test <- read.table("household_power_consumption.txt",
                   sep=";",
                   numerals="warn.loss",
                   na.strings="?",
                   header=TRUE)

work.data <- data.frame(Date=as.Date(test$Date,format="%d/%m/%Y"),test[2:9])
work.data <- work.data[work.data$Date == "2007-02-01" | 
                           work.data$Date == "2007-02-02",]  

rm(test)

png("plot4.png")

par(mfcol = c(2,2))

x <- strptime(paste(work.data$Date,work.data$Time,sep=" "),
              format="%Y-%m-%d %H:%M:%S")
y <- work.data$Global_active_power

plot(x,y,
     type="n",
     xlab="",
     ylab="Global Active Power")
lines(x,y)

y <- work.data$Sub_metering_1

plot(x,y,
     type="n",
     xlab="",
     ylab="Energy sub metering")
lines(x,y)

y <- work.data$Sub_metering_2
lines(x,y,col="red")

y <- work.data$Sub_metering_3
lines(x,y,col="blue")

legend("topright",
       lty="solid",
       bty="n",
       col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

y <- work.data$Voltage
plot(x,y,
     type="n",
     xlab="datetime",
     ylab="Voltage")
lines(x,y)

y <- work.data$Global_reactive_power
plot(x,y,
     type="n",
     xlab="datetime",
     ylab="Global_reactive_power")
lines(x,y)

dev.off()
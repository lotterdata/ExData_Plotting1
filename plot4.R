
#Read the data file
test <- read.table("household_power_consumption.txt",
                   sep=";",
                   numerals="warn.loss",
                   na.strings="?",
                   header=TRUE)

#put Date column in correct format and subset to the required days
work.data <- data.frame(Date=as.Date(test$Date,format="%d/%m/%Y"),test[2:9])
work.data <- work.data[work.data$Date == "2007-02-01" | 
                           work.data$Date == "2007-02-02",]  

#Clean up workspace
rm(test)

#Open png device and plot histogram
#Default for png is 480 pixels x 480 pixels
png("plot4.png")

#Specify that there will be 4 plots in a 2x2 array
par(mfcol = c(2,2))

#Set x and y variables for plotting. x is a POSIXlt object
x <- strptime(paste(work.data$Date,work.data$Time,sep=" "),
              format="%Y-%m-%d %H:%M:%S")
y <- work.data$Global_active_power

#Make the 1st plot
plot(x,y,
     type="n",
     xlab="",
     ylab="Global Active Power")
lines(x,y)
#End of 1st plot

#Make the 2nd plot
#Reset y and create the plot
y <- work.data$Sub_metering_1

plot(x,y,
     type="n",
     xlab="",
     ylab="Energy sub metering")
lines(x,y)

#Reset y and add to plot
y <- work.data$Sub_metering_2
lines(x,y,col="red")

#Reset y and add to plot
y <- work.data$Sub_metering_3
lines(x,y,col="blue")

#Add legend
legend("topright",
       lty="solid",
       bty="n",
       col=c("black","red","blue"),
       cex = 0.95,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#End of 2nd plot

#Make the third plot
#Reset y and create the plot
y <- work.data$Voltage
plot(x,y,
     type="n",
     xlab="datetime",
     ylab="Voltage")
lines(x,y)
#End of 3rd plot

#Make the fourth plot
#Reset y and create the plot
y <- work.data$Global_reactive_power
plot(x,y,
     type="n",
     xlab="datetime",
     ylab="Global_reactive_power")
lines(x,y)

dev.off()
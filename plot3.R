
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
png("plot3.png")

#Set x and y variables for plotting. x is a POSIXlt object
x <- strptime(paste(work.data$Date,work.data$Time,sep=" "),
              format="%Y-%m-%d %H:%M:%S")
y <- work.data$Sub_metering_1

#Plot the first series
plot(x,y,
     type="n",
     xlab="",
     ylab="Energy sub metering")
lines(x,y)

#Change put next series in y and plot
y <- work.data$Sub_metering_2
lines(x,y,col="red")

#Change put next series in y and plot
y <- work.data$Sub_metering_3
lines(x,y,col="blue")

#Add legend
legend("topright",
       lty="solid",
       col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
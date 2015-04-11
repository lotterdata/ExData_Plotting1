

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

#Set x and y variables for plotting. x is a POSIXlt object
x <- strptime(paste(work.data$Date,work.data$Time,sep=" "),
              format="%Y-%m-%d %H:%M:%S")
y <- work.data$Global_active_power

#Open png device and plot histogram
#Default for png is 480 pixels x 480 pixels
png("plot2.png")
plot(x,y,
     type="n",
     xlab="",
     ylab="Global Active Power (kilowatts)")
lines(x,y)
dev.off()
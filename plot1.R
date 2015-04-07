#stub for plot1

library(magrittr)

test <- read.table("household_power_consumption.txt",
                   sep=";",
                   numerals="warn.loss",
                   na.strings="?",
                   header=TRUE)

work.data <- data.frame(Date=as.Date(test$Date,format="%d/%m/%Y"),test[2:9])
work.data <- work.data[work.data$Date == "2007-02-01" | 
                       work.data$Date == "2007-02-02",]  

rm(test)

hist(work.data$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
## Load dplyr package
library(dplyr)
library(lubridate)

## Load dataset
df1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## convert the Date and Time variables to Date/Time classes
df2 <- mutate(df1, Date = as.Date(Date,"%d/%m/%Y"), Time = as.POSIXct(paste(df1$Date, df1$Time), 
                                                                      format="%d/%m/%Y %H:%M:%S")) 

## Subset data from the dates 2007-02-01 and 2007-02-02
df3 <- filter(df2, Date == "2007-02-01" | Date == "2007-02-02")

## Plot the graph

 # Create a graph device
dev.off()
png("Plot 3.png", width = 480, height = 480)
 # Create a graph with data in Sub_metering_1
plot (x = df3$Time, y = df3$Sub_metering_1, type = "l", xlab = "", 
      ylab = "Energy sub metering", 
      cex.lab=1, cex.axis=1, cex.main=1, cex.sub=1)
 # Add lines with data in Sub_metering_2
lines(df3$Time,df3$Sub_metering_2,col="red") 
 # Add lines with data in Sub_metering_3
lines(df3$Time,df3$Sub_metering_3,col="blue") 
 # Add legends
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.9)

dev.off()


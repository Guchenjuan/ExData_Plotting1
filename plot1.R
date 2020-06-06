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

## Plot the histogram
hist(df3$Global_active_power, col = "Red", breaks = 12,
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)", las = 0,
     cex.lab=0.7, cex.axis=0.7, cex.main=0.8, cex.sub=0.7,
     freq = TRUE)
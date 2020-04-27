## Getting full dataset
gema <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
gema$Date <- as.Date(gema$Date, format="%d/%m/%Y")

## Subsetting the data
fatra <- subset(gema, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(gema)

## Converting dates
gf <- paste(as.Date(fatra$Date), fatra$Time)
fatra$Datetime <- as.POSIXct(gf)

## Plot 3
with(fatra, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="./plot3.png", height=480, width=480)
dev.off()
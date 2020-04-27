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

## Plot 2
plot(fatra$Global_active_power~fatra$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="./plot2.png", height=480, width=480)
dev.off()
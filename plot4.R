URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"


datafile <- "./Data/household_power_consumption.zip"


maindata <- "./Data/household_power_consumption.txt"


download.file(URL, datafile, method = "curl")


unzip(datafile, overwrite = T, exdir = "./Data")


plotData <- read.table(maindata, header=T, sep=";", na.strings="?")


maindata <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]


SetTime <-strptime(paste(maindata$Date, maindata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")


maindata <- cbind(SetTime, maindata)


marks <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")

columnlines <- c("black","red","blue")

par(mfrow=c(2,2))

plot(maindata$SetTime, maindata$Global_active_power, type="l", col="pink", xlab="", ylab="Global Active Power")

plot(maindata$SetTime, maindata$Voltage, type="l", col="purple", xlab="datetime", ylab="Voltage")

plot(maindata$SetTime, maindata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

lines(maindata$SetTime, maindata$Sub_metering_2, type="l", col="red")

lines(maindata$SetTime, maindata$Sub_metering_3, type="l", col="blue")

legend("topright", bty="n", legend=marks, lty=1, col=columnlines)

plot(maindata$SetTime, maindata$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")
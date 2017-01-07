URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"


datafile <- "./Data/household_power_consumption.zip"


maindata <- "./Data/household_power_consumption.txt"


download.file(URL, datafile, method = "curl")


unzip(datafile, overwrite = T, exdir = "./Data")


plotData <- read.table(maindata, header=T, sep=";", na.strings="?")


maindata <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]


timechange <-strptime(paste(maindata$Date, maindata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")


maindata <- cbind(timechange, maindata)


columncolors <- c("black", "red", "blue")


marks <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


plot(maindata$timechange, maindata$Sub_metering_1, type="l", col=columncolors[1], xlab="", ylab="Energy sub metering")


lines(maindata$timechange, maindata$Sub_metering_2, col=columncolors[2])


lines(maindata$timechange, maindata$Sub_metering_3, col=columncolors[3])


legend("topright", legend=marks, col=columncolors, lty="solid")


legend("topright", legend=marks, col=columncolors, lty="solid")
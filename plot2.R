URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"


datafile <- "./Data/household_power_consumption.zip"


maindata <- "./Data/household_power_consumption.txt"


download.file(URL, datafile, method = "curl")


unzip(datafile, overwrite = T, exdir = "./Data")

plotData <- read.table(maindata, header=T, sep=";", na.strings="?")


maindata <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]

timechange <-strptime(paste(maindata$Date, maindata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")


maindata <- cbind(timechange, maindata)


plot(maindata$timechange, maindata$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
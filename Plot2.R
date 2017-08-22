setwd("F:/Work/Coursera/EDA/week1")
##Memory calculation
round(2075259*9*8/2^{20}/1024,2)
##0.14 GB of memory required to read the raw data file into R
data <- read.table("household_power_consumption.txt",header = T,sep=";",stringsAsFactors = FALSE)
data$datetime <- strptime(paste(data$Date,data$Time,sep=" "),format='%d/%m/%Y %H:%M:%S')
data$Date <- as.Date(as.character(data$Date),format='%d/%m/%Y')
data_sub <- subset(data,Date>="2007-02-01" & Date <= "2007-02-02")
data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power)

png("plot2.png", width=480, height=480)
with(data_sub,plot(datetime,Global_active_power,type='l',xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()
head(data_sub)

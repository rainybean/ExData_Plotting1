#set working directory
setwd("C:/Users/user/Desktop/R")

#load data
classes <- c("character","character",rep("numeric",7))
data <- read.table("./data/household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE,colClasses=classes,na.strings="?")

#convert character Date to Date type
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#subset for plotting
data.s <- with(data,subset(data,Date>="2007-02-01"&Date<"2007-02-03"))

#contruct Datetime attribute
data.s$Datetime <- as.POSIXct(paste(data.s$Date,data.s$Time)) 

#plot line chart & save to a png file (set time locale to English for the x-axis labels)
Sys.setlocale(category = "LC_TIME", locale = "C")

with(data.s,plot(Datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()

Sys.setlocale(category = "LC_ALL", locale = "")


#set working directory
setwd("C:/Users/user/Desktop/R")

#load data
classes <- c("character","character",rep("numeric",7))
data <- read.table("./data/household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE,colClasses=classes,na.strings="?")

#convert character Date to Date type
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#subset for plotting
data.s <- with(data,subset(data,Date>="2007-02-01"&Date<"2007-02-03"))

#plot histogram & save to a png file
hist(data.s$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power",
     col="red")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()

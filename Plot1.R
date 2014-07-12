Data_02<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")
Data_02_2007<-Data_02[with(Data_02, Date=="1/2/2007"|Date=="2/2/2007"), ]
s<-as.numeric(unlist(Data_02_2007[3]))
hist(s, col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,file="plot1",width = 480, height = 480)
dev.off()

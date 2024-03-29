Data_02<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")
Data_02_2007<-Data_02[with(Data_02, Date=="1/2/2007"|Date=="2/2/2007"), ]
Sys.setlocale("LC_TIME", "English_United Kingdom")
s<-as.numeric(unlist(Data_02_2007[3]))
d<-unlist(Data_02_2007[1])
t<-unlist(Data_02_2007[2])
DT <- strptime( paste(d,t), format="%d/%m/%Y %H:%M:%S")
plot(DT,s,ylab="Global Active Power (kilowatts)",xlab="",type="l")
dev.copy(png,file="plot2",width = 480, height = 480)
dev.off()
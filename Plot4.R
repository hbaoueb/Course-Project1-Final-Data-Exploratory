Data_02<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")
Data_02_2007<-Data_02[with(Data_02, Date=="1/2/2007"|Date=="2/2/2007"), ]
Sys.setlocale("LC_TIME", "English_United Kingdom")
d<-unlist(Data_02_2007[1])
t<-unlist(Data_02_2007[2])
DT <- strptime( paste(d,t), format="%d/%m/%Y %H:%M:%S")
s<-as.numeric(unlist(Data_02_2007[3]))
v<-as.numeric(unlist(Data_02_2007[5]))
s1<-as.numeric(unlist(Data_02_2007[7]))
s2<-as.numeric(unlist(Data_02_2007[8]))
s3<-as.numeric(unlist(Data_02_2007[9]))
g<-as.numeric(unlist(Data_02_2007[4]))
par(mfrow=c(2,2))
with(Data_02_2007,{
  plot(DT,s,ylab="Global Active Power (kilowatts)",xlab="",type="l")
  plot(DT,v,ylab="Voltage",xlab="datetime",type="l")
  plot(DT,s1,ylab="Energy sub metering",xlab="",type="l")
  lines(DT,s2,col="red")
  lines(DT,s3,col="blue")
  legend("topright", col = c("black", "red", "blue"), lty= "solid", cex = 0.8, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
  plot(DT,g,ylab="Global_reactive_power",xlab="datetime",type="l")
})

dev.copy(png,file="plot4",width = 480, height = 480)
dev.off()
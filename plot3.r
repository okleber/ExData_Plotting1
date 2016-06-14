download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="consumption.zip")
unzip(paste(getwd(),"consumption.zip",sep="/"),overwrite=T,exdir="power_consumption")
house_power_consumption<-list.files(paste(getwd(),"power_consumption",sep="/"))
data<-file(paste(getwd(),"power_consumption",house_power_consumption,sep="/"),open="r")
table<-read.table(data,header=T,sep=";")
close(data)
table$Date<-as.Date(as.character(table$Date),format="%d/%m/%Y")
table<-subset(table,Date >=as.Date("01/02/2007",format="%d/%m/%Y") & Date<=as.Date("02/02/2007",format="%d/%m/%Y"))
table$Time<-as.POSIXct(paste(as.character(table$Date),as.character(table$Time),sep=" "),tz="GMT")
png(file="plot3.png",width=480,height=480)
plot(rep(table$Time,times=3),c(as.numeric(as.character(table$Sub_metering_1)),as.numeric(as.character(table$Sub_metering_2)),as.numeric(as.character(table$Sub_metering_3))),type="n",xlab="",ylab="Engergy sub metering")
points(table$Time,as.numeric(as.character(table$Sub_metering_1)),type="l",col="black")
points(table$Time,as.numeric(as.character(table$Sub_metering_3)),type="l",col="blue")
points(table$Time,as.numeric(as.character(table$Sub_metering_2)),type="l",col="red")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()


  
                               



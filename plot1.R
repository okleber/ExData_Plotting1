download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="consumption.zip")
unzip(paste(getwd(),"consumption.zip",sep="/"),overwrite=T,exdir="power_consumption")
house_power_consumption<-list.files(paste(getwd(),"power_consumption",sep="/"))
data<-file(paste(getwd(),"power_consumption",house_power_consumption,sep="/"),open="r")
table<-read.table(data,header=T,sep=";")
close(data)
table$Date<-as.Date(as.character(table$Date),format="%d/%m/%Y")
table<-subset(table,Date >=as.Date("01/02/2007",format="%d/%m/%Y") & Date<=as.Date("02/02/2007",format="%d/%m/%Y"))
png(file="plot1.png",height=480,width=480)
hist(as.numeric(as.character(table$Global_active)),xlab="Global Active Power(kilowatts)",main="Global Active Power",col="red")
dev.off()

  
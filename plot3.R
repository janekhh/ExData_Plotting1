mydata<-read.table("householdpowerconsumption.txt",header = TRUE, sep=";")
newtmp<-subset.data.frame(mydata,Date == "1/2/2007" | Date == "2/2/2007")
Dates <- as.Date(newtmp$Date, format="%d/%m/%Y")
Times <- newtmp$Time
DateTime <- as.POSIXct(paste(as.character(Dates),as.character(Times)))
data_tmp<-newtmp
data_tmp$DateTime <- DateTime
png("plot3.png")
plot(data_tmp$DateTime,as.numeric(as.vector(data_tmp$Sub_metering_1)),type="l",ylab="Energy sub metering",xlab="",col="black")
points(data_tmp$DateTime,as.numeric(as.vector(data_tmp$Sub_metering_2)),type="l",ylab="Energy sub metering",xlab="",col="red")
points(data_tmp$DateTime,as.numeric(as.vector(data_tmp$Sub_metering_3)),type="l",ylab="Energy sub metering",xlab="",col="blue")
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
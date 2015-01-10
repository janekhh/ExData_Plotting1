mydata<-read.table("householdpowerconsumption.txt",header = TRUE, sep=";")
newtmp<-subset.data.frame(mydata,Date == "1/2/2007" | Date == "2/2/2007")
Dates <- as.Date(newtmp$Date, format="%d/%m/%Y")
Times <- newtmp$Time
DateTime <- as.POSIXct(paste(as.character(Dates),as.character(Times)))
data_tmp<-newtmp
data_tmp$DateTime <- DateTime
Sys.setlocale("LC_TIME", "English")
png("plot4.png")
par(mfrow = c(2, 2),cex=0.77)
plot(data_tmp$DateTime,as.numeric(as.vector(data_tmp$Global_active_power)),type="l",ylab="Global Active Power",xlab="")
plot(data_tmp$DateTime,as.numeric(as.vector(data_tmp$Voltage)),type="l",ylab="Voltage",xlab="datetime")
plot(data_tmp$DateTime,as.numeric(as.vector(data_tmp$Sub_metering_1)),type="l",ylab="Energy sub metering",xlab="",col="black")
points(data_tmp$DateTime,as.numeric(as.vector(data_tmp$Sub_metering_2)),type="l",ylab="Energy sub metering",xlab="",col="red")
points(data_tmp$DateTime,as.numeric(as.vector(data_tmp$Sub_metering_3)),type="l",ylab="Energy sub metering",xlab="",col="blue")
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty = "n")
plot(data_tmp$DateTime,as.numeric(as.vector(data_tmp$Global_reactive_power)),type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()
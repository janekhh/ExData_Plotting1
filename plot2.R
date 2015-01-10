mydata<-read.table("householdpowerconsumption.txt",header = TRUE, sep=";")
newtmp<-subset.data.frame(mydata,Date == "1/2/2007" | Date == "2/2/2007")
Dates <- as.Date(newtmp$Date, format="%d/%m/%Y")
Times <- newtmp$Time
DateTime <- as.POSIXct(paste(as.character(Dates),as.character(Times)))
data_tmp<-newtmp
data_tmp$DateTime <- DateTime
Sys.setlocale("LC_TIME", "English")
png("plot2.png")
plot(data_tmp$DateTime,as.numeric(as.vector(data_tmp$Global_active_power)),type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
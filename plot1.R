#read all the data
alldata <- read.table("household_power_consumption.txt",sep=";", header=TRUE)
#only get the data for specefic dates
alldata$Date <- as.Date(alldata$Date, "%d/%m/%Y")
mydata <- subset(alldata, Date >= "2007-02-01" & Date <= "2007-02-02")
#replace the "?" characters in the global active power column
new <- gsub("?","",mydata$Global_active_power)
newnum <- as.numeric(new)
#initialize a device
dev.copy(device=png,filename='plot1.png',width=450,height=450)
#plot the data
hist(newnum,xlab="Global Active Power(Kilowatts)",main="Global Active Power",col="Red")
#close the devicem
dev.off()
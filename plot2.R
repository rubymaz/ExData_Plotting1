#read all the data
alldata <- read.table("household_power_consumption.txt",sep=";", header=TRUE)
#only get the data for specefic dates
alldata$Date <- as.Date(alldata$Date, "%d/%m/%Y")
mydata <- subset(alldata, Date >= "2007-02-01" & Date <= "2007-02-02")
#replace the "?" characters in the global active power column
new <- gsub("?","",mydata$Global_active_power)
newnum <- as.numeric(new)
mydata$Global_active_power <- newnum
# create a timestamp column to the existing data frame which can hold date and time combined
mydata <- within(mydata, { timestamp=format(as.POSIXct(paste(mydata$Date, mydata$Time)), "%d/%m/%Y %H:%M:%S") })
#combine date and time column with the right format
m <- cbind(paste(mydata$Date,mydata$Time))
striptime <-strptime(m,"%Y-%m-%d %H:%M:%S")
mydata$timestamp <- striptime
#create plot co or dinates of x and y
x <- mydata$timestamp
y <- mydata$Global_active_power

#initialize a device
dev.copy(device=png,filename='plot2.png',width=450,height=450)
#plot the data
plot(x,y,type="l",xlab="",ylab="Global Active Power(kilowatts)")
#close the devicem
dev.off()
# Read the dataset from the household_power_consumption.txt that is in the same folder
print("Reading data file ./household_power_consumption.txt ...")
housePowerConsump <- read.csv("household_power_consumption.txt",sep=";", 
                              colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                              na.strings=c("NA","?"),
                              stringsAsFactors=FALSE)

print ("Converting Date and Time fields to the right format")
# Convert Date field to date format and combine date and time
housePowerConsump$Date <-as.Date(housePowerConsump$Date,format="%d/%m/%Y")
housePowerConsump$DateTime <- paste(housePowerConsump$Date, housePowerConsump$Time)
housePowerConsump$DateTime <- as.POSIXct(housePowerConsump$DateTime)

# Take subset of 1st and 2nd of Feb 2007
print ("Taking subset of data for 1st and 2nd of Feb 2007")
hpc2days <- subset(housePowerConsump, Date=="2007-02-01" | Date=="2007-02-02")


# Set the output to be png file plot4.png in the current folder
print ("Setting output to be the png file ./plot4.png")
png("plot4.png")


# Create plot
print ("Creating Plot4")
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(hpc2days, {
    plot(Global_active_power~DateTime, 
         xlab="", ylab="Global Active Power (kilowatts)", type="l")
    plot(Voltage~DateTime,  
         xlab="", ylab="Voltage (volt)", type="l")
    plot(Sub_metering_1~DateTime,
         xlab="", ylab="Global Active Power (kilowatts)", type="l")
    lines(Sub_metering_2~DateTime,col='Red')
    lines(Sub_metering_3~DateTime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~DateTime, xlab="", ylab="Global Rective Power (kilowatts)", type="l")
    })

# Close the output device
print ("Closing the output file")
dev.off()

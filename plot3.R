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


# Set the output to be png file plot1.png in the current folder
print ("Setting output to be the png file ./plot3.png")
png("plot3.png")


# Create plot
print ("Creating Plot3")
with(hpc2days, {
    plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
    lines(DateTime, Sub_metering_2, xlab="", ylab="Energy sub metering", type="l", col='Red')
    lines(DateTime, Sub_metering_3, xlab="", ylab="Energy sub metering", type="l", col='Blue')
})
legend("topright",
       col=c("black", "red", "blue"), 
       lwd = 2, lty = 1,  
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the output device
print ("Closing the output file")
dev.off()

# Read the dataset from the household_power_consumption.txt that is in the same folder
print("Reading data file ./household_power_consumption.txt ...")
housePowerConsump <- read.csv("household_power_consumption.txt",sep=";", 
                           colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                           na.strings=c("NA","?"),
                           stringsAsFactors=FALSE)

print ("Converting Date and Time fields to the right format")
# Combine the Date and Time fields on the new data set
housePowerConsump$DateTime <- strptime(paste(housePowerConsump$Date, housePowerConsump$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
# Convert Date field to date format
housePowerConsump$Date <-as.Date(housePowerConsump$Date,format="%d/%m/%Y")

# Take subset of 1st and 2nd of Feb 2007
print ("Taking subset of data for 1st and 2nd of Feb 2007")
hpc2days <- subset(housePowerConsump, Date=="2007-02-01" | Date=="2007-02-02")


# Set the output to be png file plot1.png in the current folder
print ("Setting output to be the png file ./plot2.png")
png("plot2.png")

# Create plot
print ("Creating Plot2")
plot(hpc2days$DateTime, hpc2days$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

# Close the output device
print ("Closing the output file")
dev.off()

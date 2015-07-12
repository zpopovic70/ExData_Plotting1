# Read the dataset from the household_power_consumption.txt that is in the same folder
print("Reading data file ./household_power_consumption.txt ...")
housePowerCons <- read.csv("household_power_consumption.txt",sep=";", 
                           colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                           na.strings=c("NA","?"),
                           stringsAsFactors=FALSE)

# Convert Date to date format
print ("Converting Date field to date format")
housePowerCons$DateFormatted <-as.Date(housePowerCons$Date,format="%d/%m/%Y")

# Take subset of 1st and 2nd of Feb 2007
print ("Taking subset of data for 1st and 2nd of Feb 2007")
hpc2days <- subset(housePowerCons, DateFormatted=="2007-02-01" | DateFormatted=="2007-02-02")

# Set the output to be png file plot1.png in the current folder
print ("Setting output to be the png file ./plot1.png")
png("plot1.png")

#Create histogram
print ("Creating histogram")
hist(hpc2days$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power")

# Close the output device
print ("Closing the output file")
dev.off()

createPlot2 <- function(dateFrom="2007-02-01", dateTo="2007-02-02") {
# Data is sourced from the UCI Machine Learning repository:
# http://archive.ics.uci.edu/ml/
#
# Data file(s) and meta data:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

# Create "data" directory if not already created

# Download data file(s) (download.file command may be commented out)

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip";
#download.file(fileUrl, "./data/household_power_consumption.zip");

# Unzip data file(s) (unzip command may be commented out)

fileUrl <- "./data/household_power_consumption.zip";
#(fileUrl, exdir="./data");

# Read data file(s)

fileUrl <- "./data/household_power_consumption.txt";
epc.DF <- read.table(fileUrl, header=TRUE, sep=";", na.strings="?");

# Select the specific date range for the plot

epc.DF <- epc.DF[as.Date(epc.DF$Date, "%d/%m/%Y")>=as.Date(dateFrom) & as.Date(epc.DF$Date, "%d/%m/%Y")<=as.Date(dateTo), ];

# Add datetime for plotting

epc.DF$Datetime <- strptime(paste(epc.DF$Date, epc.DF$Time), format="%d/%m/%Y %H:%M:%S", tz="PST8PDT");

# Open graphics device

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12);

# Plot 2 Global Active Power Time Sequence

plot(epc.DF$Datetime, epc.DF$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n");
lines(epc.DF$Datetime, epc.DF$Global_active_power);

# Close graphics device

dev.off();

return(0);
}
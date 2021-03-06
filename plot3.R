createPlot3 <- function(dateFrom="2007-02-01", dateTo="2007-02-02") {
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
#unzip(fileUrl, exdir="./data");

# Read data file(s)

fileUrl <- "./data/household_power_consumption.txt";
epc.DF <- read.table(fileUrl, header=TRUE, sep=";", na.strings="?");

# Select the specific date range for the plot

epc.DF <- epc.DF[as.Date(epc.DF$Date, "%d/%m/%Y")>=as.Date(dateFrom) & as.Date(epc.DF$Date, "%d/%m/%Y")<=as.Date(dateTo), ];

# Add datetime for plotting

epc.DF$Datetime <- strptime(paste(epc.DF$Date, epc.DF$Time), format="%d/%m/%Y %H:%M:%S", tz="PST8PDT");

# Open graphics device

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12);

# Plot 3 Energy Sub Metering Time Sequences

plot(epc.DF$Datetime, epc.DF$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n");
lines(epc.DF$Datetime, epc.DF$Sub_metering_1, col="black");
lines(epc.DF$Datetime, epc.DF$Sub_metering_2, col="red");
lines(epc.DF$Datetime, epc.DF$Sub_metering_3, col="blue");
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1));

# Close graphics device

dev.off();

return(0);
}
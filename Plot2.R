library("data.table")
setwd("~/RStudioESM/Exploratory Data Week Projects/ExData_Plotting1")

# Read Data and Subset for the Specified Dates

powerDT <- data.table::fread(input = "household_power_consumption.txt",
                             na.strings="?")

# Format to Prevent Scientific Notation

powerDT[, Global_active_power := lapply(.SD, as.numeric), 
        .SDcols = c("Global_active_power")]

# Change Date into POSIXct to Allow Filtering and Graphing by Time of Day

powerDT[, dateTime := as.POSIXct(paste(Date, Time), 
                                 format = "%d/%m/%Y %H:%M:%S")]

# Filter for two specified dates

powerDT <- powerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

## Plot 2

plot(x = powerDT[, dateTime],
     y = powerDT[, Global_active_power],
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

library("data.table")
setwd("~/RStudioESM/Exploratory Data Week Projects/ExData_Plotting1")

# Read Data, Remove Empty Observations, Subset for the Two Specified Dates
powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
                             )

# Reformat Histogram from Printing in Scientific Notation
powerDT[, Global_active_power := lapply(.SD, as.numeric), 
        .SDcols = c("Global_active_power")]

# Change Date Column to Date Type
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"),
        .SDcols = c("Date")]

# Filter Dates for the Two Dates, 2007-02-01 and 2007-02-02
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1

hist(powerDT[, Global_active_power], main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.off()
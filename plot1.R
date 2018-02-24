## PLOT 1.

cat("\014")     # clear console
rm(list = ls()) # clear environment
dev.off()       # clear plots


# 1. Set working directory.
setwd("~/AllData")

# 2. Read file into R.
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                  colClasses = c("character", "character", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", "numeric",
                                 "numeric"), 
                  na.strings = "?", stringsAsFactors = FALSE)

# 3. Subset Feb 1 and 2, 2007 from the entire dataset.
datplot <- subset(dat, Date %in% c("1/2/2007", "2/2/2007") )


# 4. Create histogram.
hist(datplot$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

# 5. Save as png.
dev.copy(png, file = "plot1.png", width = 480, height = 480)

# 6. Close graphics device.
dev.off()

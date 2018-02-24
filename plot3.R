## PLOT 3.

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

# 4. Change date and time formats.
datplot$dateTime <- paste(as.Date(datplot$Date, format = "%d/%m/%Y"), datplot$Time)
datplot$dateTime <- as.POSIXct(dateTime)

# 4. Create graph.
with(datplot, {
  plot(x = dateTime, y = Sub_metering_1, type = "l",
       xlab = "", ylab = "Global Active Power (kilowatts)")
  lines(x = dateTime, y = Sub_metering_2, col = 'Red')
  lines(x = dateTime, y = Sub_metering_3, col = 'Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# 5. Save as png.
dev.copy(png, file = "plot3.png", width = 480, height = 480)

# 6. Close graphics device.
dev.off()
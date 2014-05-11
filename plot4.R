plot4 <- function(directory, filename) {
  
  file <- paste(directory, "/", filename, ".txt", sep ="")
  sampleData <- read.csv(file, sep=";", nrows = 3)
  classes <- sapply(sampleData, class)
  classes[1:2] <- "character"
  power <- read.table(file, sep=";", colClasses = classes, na.strings = "?", header = TRUE)
  power$Time <- strptime(paste(power$Date, power$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
  power$Date <- as.Date(power$Date, "%d/%m/%Y")
  
  dates <- c("2007-02-01", "2007-02-02")
  dates <- as.Date(dates, "%Y-%m-%d")
  
  data <- power[power$Date %in% dates,]
  
  
  png(filename = "plot4.png",width = 480, height = 480, units = "px", pointsize = 12)
  par(mfrow = c(2,2))
  with(data, {  
  
  plot(Time, Global_active_power, ylab="Global Active Power", type = "l")
  
  plot(Time, Voltage, ylab = "Voltage", xlab = "datetime", type = "l")
  
  plot(Time, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(Time, Sub_metering_2, col = "red")
  lines(Time, Sub_metering_3, col = "blue")
  legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering1", "Sub_metering_2", "Sub_metering_3") )
  
  plot(Time, Global_reactive_power, type = "l", xlab="datetime", ylab = "Global_reactive_power")
  
  })
  dev.off()
}  
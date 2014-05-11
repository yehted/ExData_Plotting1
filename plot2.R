plot2 <- function(directory, filename) {
  
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
  
  png(filename = "plot2.png",width = 480, height = 480, units = "px", pointsize = 12)
  plot(data$Time, data$Global_active_power, type = "l", col = "black", xlab="", ylab = "Global Active Power (kilowatts)")
  dev.off()
}  
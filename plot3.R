# Read filtered data & produce plot 3

df1 <- read.table("filtered.txt", 
                  header = T,
                  sep=" ",
                  stringsAsFactors = F
)

library(dplyr)
df1$DateTime <- as.POSIXct(paste(df1$Date, df1$Time), format="%d/%m/%Y %H:%M:%S")
df1 <- df1 %>% select(-(Date:Time))

png(file = "plot3.png", width = 480, height = 480, res = 72)

plot(
  df1$DateTime,
  df1$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering"
)

lines(df1$DateTime, df1$Sub_metering_2, col = "red")
lines(df1$DateTime, df1$Sub_metering_3, col = "blue")

legend(
  "topright",
  col = c("black", "red", "blue"),
  legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lwd = 1
)

dev.off()
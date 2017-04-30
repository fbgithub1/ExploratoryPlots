# Read filtered data & produce plot 1

df1 <- read.table("filtered.txt", 
                  header = T,
                  sep=" ",
                  stringsAsFactors = F
)

library(dplyr)
df1$DateTime <- as.POSIXct(paste(df1$Date, df1$Time), format="%d/%m/%Y %H:%M:%S")
df1 <- df1 %>% select(-(Date:Time))

png(file = "plot1.png", width = 480, height = 480, res = 72)

hist(
  df1$Global_active_power, 
  main = "Global Active Power", 
  xlab = "Global active power (kilowatts)", 
  ylab = "Frequency", 
  col = "red"
)

dev.off()
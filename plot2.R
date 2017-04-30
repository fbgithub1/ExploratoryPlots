# Read filtered data & produce plot 2

df1 <- read.table("filtered.txt", 
                  header = T,
                  sep=" ",
                  stringsAsFactors = F
)

library(dplyr)
df1$DateTime <- as.POSIXct(paste(df1$Date, df1$Time), format="%d/%m/%Y %H:%M:%S")
df1 <- df1 %>% select(-(Date:Time))

png(file = "plot2.png", width = 480, height = 480, res = 72)

plot(
  df1$DateTime,
  df1$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global active power (kilowatts)"
)

dev.off()
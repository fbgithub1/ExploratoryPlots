# Process data to minimal set required for assigment.
# Output minimal table for use by figure-producing scripts.

sampleData <- read.csv("household_power_consumption.txt",
                       header = TRUE, sep = ";", nrows = 10)

classes <- sapply(sampleData, class)

df1 <- read.table("household_power_consumption.txt",
                  header = TRUE, na.strings = "?", sep = ";",
                  stringsAsFactors = F, colClasses = classes
                  )

library(dplyr)
df1 <- df1 %>% filter(Date %in% c("1/2/2007", "2/2/2007"))
str(df1)
unique(df1$Date)
write.table(df1, "filtered.txt")
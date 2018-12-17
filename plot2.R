### Exploratory Data Analysis, course project 1
### R script to load data and create plot 2

## Set working directory
setwd("~/Box/data_HD/_MyDocs/NIH-based grants/K99-R00/03_K99 awarded/Course work/01_Coursera/Course1_Data Science Specialization_John Hopkins U/Course4_ExploratoryDataAnalysis/coursework/week1/CourseProject1")

## Getting data file into a data frame
df <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880, na.strings = "?", stringsAsFactors=FALSE)
# Getting column names
colnames(df) <- read.table("household_power_consumption.txt", sep = ";", nrows = 1, stringsAsFactors=FALSE)

## Converting the Date and Time variables to Date/Time classes
# Date
df$Date <- as.Date(df$Date, "%d/%m/%Y")
# Time: 1. Creating a variable with both the date and time into a string
x <- paste(df$Date, format(df$Time, format="%H:%M:%S"))
# Time: 2. Transforming time using the strptime function
df$Time <- strptime(x, "%Y-%m-%d %H:%M:%S")

## Creating the plot
png("plot2.png",  width = 480, height = 480, units = "px")
plot(df$Time, df$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", pch = NA)
lines(df$Time, df$Global_active_power)

# Closing the PNG device
dev.off()
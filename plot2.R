#plot2
#plot1
library(data.table)
df <- read.table("./data/household_power_consumption.txt",
                 header=TRUE,
                 sep=";",
                 stringsAsFactors=FALSE,
                 na.strings = "?")
                 
#print(object.size(df),units="Mb")
df$datetime <- paste(df$Date, df$Time, sep=" ")

df$datetime <- as.POSIXct(df$datetime,format="%d/%m/%Y %H:%M:%S")
df <- df[df$datetime >= as.POSIXct("2007-02-01 00:00:00") & df$datetime <=as.POSIXct("2007-02-02 23:59:59"),]

 Sys.setlocale("LC_TIME", "English")
#str(df)
df$Global_active_power <- as.numeric(df$Global_active_power)
png("./figure/plot2.png",width = 504, height = 504,bg = "transparent")
with(df, plot(datetime,Global_active_power,
              ylab="Global Active Power(kilowatts)",
              xlab="",
              type="l")
     )
dev.off()

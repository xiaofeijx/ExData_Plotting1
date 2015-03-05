#plot3

df <- read.table("./data/household_power_consumption.txt",
                 header=TRUE,
                 sep=";",
                 stringsAsFactors=FALSE,
                 na.strings = "?")
                 
#print(object.size(df),units="Mb")
df$datetime <- paste(df$Date, df$Time, sep=" ")

df$datetime <- as.POSIXct(df$datetime,format="%d/%m/%Y %H:%M:%S")
df <- df[df$datetime >= as.POSIXct("2007-02-01 00:00:00") & df$datetime <=as.POSIXct("2007-02-02 23:59:59"),]
str(df)

 Sys.setlocale("LC_TIME", "English")
#str(df)
df$Global_active_power <- as.numeric(df$Global_active_power)
png("./figure/plot3.png",width = 504, height = 504,bg = "transparent")
plot(df$datetime,df$Sub_metering_1,
              ylab="Energy sub metering",
              xlab="",
              type="l",
              col="black"
              )
lines(df$datetime,df$Sub_metering_2,
              col="red"        
              )
lines(df$datetime,df$Sub_metering_3,
              col="blue"        
              )
legend("topright", col = c("black","red", "blue"), lwd=1,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
dev.off()

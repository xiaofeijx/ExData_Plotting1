#plot4
#read the data
df <- read.table("./data/household_power_consumption.txt",
                 header=FALSE,
                 sep=";",
                 stringsAsFactors=FALSE,
                 na.strings = "?",
                 skip=66637,
                 nrows=2880)
#read the variable names for dataframe df 
varname <- read.table("./data/household_power_consumption.txt",
                      header=FALSE,
                      sep=";",
                      nrows=1,
                      stringsAsFactors=FALSE)
names(df) <- varname[1,]
                 
#print(object.size(df),units="Mb")


df$datetime <- paste(df$Date, df$Time, sep=" ")

df$datetime <- as.POSIXct(df$datetime,format="%d/%m/%Y %H:%M:%S")


 Sys.setlocale("LC_TIME", "English")


png("./figure/plot1.png",width = 480, height = 480,bg = "transparent")
par(mfrow=c(2,2))
#one
with(df, plot(datetime,Global_active_power,
              ylab="Global Active Power",
              xlab="",
              type="l")
     )

#two
with(df, plot(datetime,Global_active_power,
              ylab="Voltage",
              type="l")
     )

#three
plot(df$datetime,df$Sub_metering_1,
              ylab="Energy sub metering",
              xlab="",
              type="l",
              col="black"
              )

lines(df$datetime,df$Sub_metering_2,col="red")
lines(df$datetime,df$Sub_metering_3,col="blue")
legend("topright", col = c("black","red", "blue"), box.lty=0,lwd=1,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
#four
with(df, plot(datetime,Global_reactive_power,
              ylab="Voltage",
              type="l")
     )

dev.off()

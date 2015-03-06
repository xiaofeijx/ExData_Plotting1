#plot2
#plot2

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

df$datetime <- paste(df$Date, df$Time, sep=" ")

df$datetime <- as.POSIXct(df$datetime,format="%d/%m/%Y %H:%M:%S")


 Sys.setlocale("LC_TIME", "English")

png("./figure/plot2.png",width = 480, height = 480,bg = "transparent")
with(df, plot(datetime,Global_active_power,
              ylab="Global Active Power(kilowatts)",
              xlab="",
              type="l")
     )
dev.off()

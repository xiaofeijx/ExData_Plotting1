#plot1
df <- read.table("./data/household_power_consumption.txt",
                 header=TRUE,
                 sep=";",
                 stringsAsFactors=FALSE,
                 na.strings = "?")
                 
#print(object.size(df),units="Mb")
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df <- df[df$Date >= as.Date("2007-02-01") & df$Date <=as.Date("2007-02-02"),]

#str(df)
df$Global_active_power <- as.numeric(df$Global_active_power)
png("./figure/plot1.png",width = 504, height = 504,bg = "transparent",res=)
with(df,hist(Global_active_power,             
             xlab="Global Active Power(kilowatts)",
             main="Global Active Power",
             col="red"
             ))
dev.off()



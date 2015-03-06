#plot1
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





png("./figure/plot1.png",width = 480, height = 480,bg = "transparent")
with(df,hist(Global_active_power,             
             xlab="Global Active Power(kilowatts)",
             main="Global Active Power",
             col="red"
             ))
dev.off()



#Setwd
setwd("C:\\TING\\Task\\CRS 2012 data")

#Make directory
dir.create("C:\\TING\\Task\\CRS 2012 data\\Individual")

#First, save .txt as utf-8 using notepad, then
data=read.delim("CRS 2012 data edit.txt",encoding="UTF-8",sep="|")

#Setwd to one we just made
setwd("C:\\TING\\Task\\CRS 2012 data\\Individual")

#Create recipient name vector
recipientnames <- data$recipientname

#Create unique vector
uniquerecipients <- unique(recipientnames)

#Create data frame from unique vector
df <- data.frame(uniquerecipients)

#Rename Year because it's weird
names(data)[names(data)=="X.U.FEFF.Year"] <- "Year"

#Interate through recipient names and make a csv for each one
for(i in 1:nrow(df))
{
name = df[i,1]
recipientfile = data[which(data$recipientname==name),]
write.csv(recipientfile, paste(name,".csv",sep=""), row.names = FALSE)
print(df[i,1])
}

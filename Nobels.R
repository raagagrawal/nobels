#reads the csv file from the R folder and creates a data frame called "Nobels"
read.csv('Nobels.csv') -> Nobels
#eliminates all of the string up to and including the "-" mark
gsub(".*-","",Nobels[,1]) -> Nobels[,7]
#removes all the * marks in the data frames that are on the right of the years
gsub("[:*:]","",Nobels[,7]) -> Nobels[,7]
#extracts second and third chracter in the first column string to identify type of nobel
substr(Nobels[,1], 2, 3) -> Nobels[,6]
#removes all the spaces in the data
gsub("\\s","",Nobels[,1]) -> Nobels[,1]
#makes the data type numeric
line.numeric <- as.numeric(Nobels[,7])
#makes factor of institution
Nobels[,5] <- as.factor(Nobels[,5])
table(Nobels[,5])->nobel.counts
plot(nobel.counts)
#loads graphing
library(ggplot2)
#makes dataframe so plays nice with ggplot
as.data.frame(Nobels) -> Nobels
g <- ggplot(Nobels, aes(Institution, fill = Institution, colour = Institution))
g + geom_bar()
#makes date
Nobels[,7]<-as.Date(Nobels[,7],format="%Y")
g <- ggplot(Nobels, aes(Year.Awarded,Institution))
g+geom_line()
g+geom_bin2d()
g+geom_count()
plot(Nobels$Institution,Nobels$Year.Awarded)
#density curves
ggplot(Nobels, aes(Year.Awarded, fill = Institution, colour = Institution)) + geom_density(alpha=0.1)
ggplot(Nobels, aes(Year.Awarded, fill = Institution, colour = Institution)) + geom_density(alpha=0.1, position="stack")
#adds a theme
library(ggthemes)
ggplot(Nobels, aes(Year.Awarded, fill = Institution, colour = Institution)) + geom_density(alpha=0.1)+ theme_economist() + scale_colour_economist()  
table(Nobels[,c(5,6)])









##makes a matrix
#as.matrix(Nobels[,1])
#sorts the data by ascending order
#sort(line1.numeric, decreasing = FALSE) -> line1.sorted
#sort(line2.numeric, decreasing = FALSE) -> line2.sorted
#makes a data frame from the table of the numeric values. This creates the frequency counts (the table does)
#as.data.frame(table(Nobels[,1])) -> harvard
#as.data.frame(table(Nobels[,2])) -> columbia
#see the data
#harvard
#columbia
#histrogram with freq as the x axis
#hist(harvard[,2])
#hist(columbia[,2])
##makes the first column of the dataframe the year
#harvard[,1]<-as.Date(harvard[,1],format="%Y")
#columbia[,1]<-as.Date(columbia[,1],format="%Y")
#makes a histogram with year as the x axis
#hist(harvard[,1], breaks = 10)
#hist(columbia[,1], breaks = 10)
#loads ggplot2 package
#library(ggplot2)
#ggplots histogram, modify bins
#ggplot(harvard,aes(harvard[,1])) + geom_histogram(bins = 20)
#rename columns
#library(plyr)
#rename(harvard, c("line1.sorted"="years", "Freq"="frequency")) -> harvard
#rename(columbia, c("line2.sorted"="years", "Freq"="frequency")) -> columbia
#library(data.table)
#hist(harvard[,1], breaks = 10, col=rgb(1,0,0,1/4))
#hist(columbia[,1], breaks = 10, col=rgb(0,0,1,1/4), add =T)




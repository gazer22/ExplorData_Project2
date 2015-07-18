# plot2.R
## load data : takes a few seconds
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# sum total pollutants by year
balt_emissions <- aggregate(Emissions~year, data=subset(NEI, fips == "24510"),
                             FUN="sum")

# creat bar plot (for 4 years, views better than a scatter or line plot)
png("plot2.png", width=480, height=480)

barplot(balt_emissions$Emissions / 1e3, names.arg=balt_emissions$year, 
        ylab = "Total PM2.5 Emissions (k-tons)", ylim=c(0,4))
title("Total emissions decreased in Baltimore from 1999 to 2008")

dev.off()

# emissions decreased
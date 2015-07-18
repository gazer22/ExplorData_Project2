# plot1.R
## load data : takes a few seconds
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# sum total pollutants by year
total_emissions <- aggregate(Emissions~year, data=NEI, FUN="sum")

# creat bar plot (for 4 years, views better than a scatter or line plot)
png("plot1.png", width=480, height=480)

barplot(total_emissions$Emissions / 1e6, names.arg=total_emissions$year, 
        ylab = "Total PM2.5 Emissions (Mtons)", ylim=c(0,8))
title("Total emissions decreased in the US from 1999 to 2008")

dev.off()

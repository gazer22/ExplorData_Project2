# plot3.R
library(ggplot2)

## load data : takes a few seconds
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# extract baltimore
balt_NEI <- subset(NEI, fips == "24510")

balt_emissions <- aggregate(Emissions~year+type, data=balt_NEI,
                             FUN="sum")
# convert type into factor
balt_emissions$type <- factor(balt_emissions$type, 
                              levels = c("POINT", "NONPOINT", 
                                         "ON-ROAD", "NON-ROAD"))

# construct plot and save to png file
g <- ggplot(balt_emissions, aes(year,Emissions))
p <- g + geom_point() + facet_grid(. ~ type) + ggtitle("Baltimore total emissions (tons) by type")

png("plot3.png", width=640, height=480)
print(p)
dev.off()

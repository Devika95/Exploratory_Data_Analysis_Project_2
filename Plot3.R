NEI.24510 <- NEI[which(NEI$fips == "24510"), ]
total.emissions.baltimore <- with(NEI.24510, aggregate(Emissions, by = list(year), sum))
colnames(total.emissions.baltimore) <- c("year", "Emissions")

#Aggregate Emissions by year, county, type and filter “24510”

total.emissions.baltimore.type <- ddply(NEI.24510, .(type, year), summarize, Emissions = sum(Emissions))
total.emissions.baltimore.type$Pollutant_Type <- total.emissions.baltimore.type$type

#open the png device
png(filename='plot3.png', width=480, height=480, units='px')
#Plot3
quickplot(year, Emissions, data = total.emissions.baltimore.type, group = Pollutant_Type, color = Pollutant_Type, geom = c("point", "line"), ylab = expression("Total Emissions, PM"[2.5]), xlab = "Year", main = "Total Emissions in U.S. by Type of Pollutant")
#close png device
dev.off()
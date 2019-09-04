NEI.24510 <- NEI[which(NEI$fips == "24510"), ]
total.emissions.baltimore <- with(NEI.24510, aggregate(Emissions, by = list(year), sum))
colnames(total.emissions.baltimore) <- c("year", "Emissions")
#open png device
png(filename = "plot2.png", width = 480, height = 480, units = "px")
#Plot2
plot(total.emissions.baltimore$year, total.emissions.baltimore$Emissions, type = "b", pch = 18, col = "green", ylab = "Emissions", xlab = "Year", main = "Baltimore Emissions")
#close png device
dev.off()


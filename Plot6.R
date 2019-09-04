motor.vehicle.emissions = NEI.DT[SCC %in% motor.vehicle.scc, sum(Emissions), by = c("year", "fips")]
colnames(motor.vehicle.emissions) <- c("year", "fips", "Emissions")
#open png device
png(filename = "plot6.png", width = 480, height = 480, units = "px")
#plot6
g = ggplot(motor.vehicle.emissions[fips == "24510" | fips == "06037"], aes(year, Emissions))
g + geom_point() + geom_line(aes(color = fips)) + scale_color_discrete(name = "County", breaks = c("06037", "24510"), labels = c("Los Angeles", "Baltimore")) + labs(x = "Year") + labs(y = expression("Total Emissions, PM"[2.5])) + labs(title = "Annual Motor Vehicle Emissions")
#close png device
dev.off()

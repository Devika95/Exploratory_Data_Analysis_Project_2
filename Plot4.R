coal.scc = SCC.DT[grep("Coal", SCC.Level.Three), SCC]

#Aggregate Emissions for the above SCC by year
coal.emissions = NEI.DT[SCC %in% coal.scc, sum(Emissions), by = "year"]
colnames(coal.emissions) <- c("year", "Emissions")
#Open the PNG device
png(filename = "plot4.png", width = 480, height = 480, units = "px")
#Plot4
g = ggplot(coal.emissions, aes(year, Emissions))
g + geom_point(color = "red") + geom_line(color = "green") + labs(x = "Year") + labs(y = expression("Total Emissions, PM"[2.5])) + labs(title = "Emissions from Coal Combustion for the US")
#close png device
dev.off()

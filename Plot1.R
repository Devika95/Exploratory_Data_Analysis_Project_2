#unzipping the data
unzip("exdata_data_NEI_data.zip")
#load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#convert into data.table
NEI.DT = data.table(NEI)
SCC.DT = data.table(SCC)
total.emissions <- with(NEI, aggregate(Emissions, by = list(year), sum))
#open the png device
png(filename = "plot1.png", width = 480, height = 480, units = "px")
#plot1
plot(total.emissions, type = "b", pch = 18, col = "green", ylab = "Emissions", xlab = "Year", main = "Annual Emissions")
#close png device
dev.off()

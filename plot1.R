  # load data
  setwd("~/Desktop")
  NEI <- readRDS("summarySCC_PM25.rds") 

  # Clean the Data
  data <- with(NEI, aggregate(Emissions, by = list(year), sum))
  # Use with() to combine/sum the Emissions by year in seperate list
  names(data)[1] <- "Year" # Rename the ColumnR
  names(data)[2] <- "Emissions" # Rename the Column

  #  Create the plot
  png(filename= "plot1.png", width=480, height=480, units="px")
  par(mar=c(5, 5, 4.1, 3)) # Adjust the Margin sizes
  plot(data, type= "b", pch= 15, col= "palevioletred1", yaxt="n", xaxt="n", xlab="Years", ylab= "Emissions (Tons)")
  title(main="Plot of Total Emmisions by Years", col.main="palevioletred1")
  axis(2, at=c(3E06, 4E06, 5E06, 6E06, 7E06, 8E06), cex.axis=.75) # Add Y axis labels
  axis(1, at= c(1999, 2002, 2005, 2008), cex.axis=.90) # Add X axis Labels
  dev.off() 
  # Close Graphics and Show Plot in WD

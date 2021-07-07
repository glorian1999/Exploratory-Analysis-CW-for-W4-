  setwd("~/Desktop")
  NEI <- readRDS("summarySCC_PM25.rds") # Bring in data

  # "Clean" the Data
  library(dplyr)
  library(ggplot2)
  data <- tbl_df(NEI) # Usable data frame form w/ dplyr package
  data <- data %>% filter(data$fips == "24510") # Subset the data for Baltimore City
  data$year <- as.character(data$year) # Convert year variable to character
  sub_data <- data %>% group_by(year, type) %>% summarize(Emissions= sum(Emissions))
  # Subset the data based on year and type

  #Create the plot
  png(filename= "plot3.png", width=480, height=480, units="px") # Set image format
  baltimore<- qplot(year, Emissions, data=sub_data, color=type, size=I(3),
                    main= "Emission's Trend in Baltimore City across Type" )
  baltimore <- baltimore+ geom_smooth(aes(group=type), method="loess", se=FALSE)
  baltimore <- baltimore+ facet_wrap(~type)
  print(baltimore) # Check Graphics
  dev.off() # Close Graphics and Show Plot in WD

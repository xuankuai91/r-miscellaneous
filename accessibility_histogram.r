setwd("/Users/xkuai/Documents/Access_Hist")
access <- read.csv("Physician_Accessibility.csv")

for (i in 1:4) {
	plot_file = paste("Dist_", as.character(i * 5), "_mi.png", sep = "")
	column_name = paste("Dist_", as.character(i * 5), "_mi", sep = "")
	
	png(plot_file, width = 720, height = 480)
	
	hist(
		access[[column_name]],
		breaks = seq(0, 8, by = 0.5),
		xlab = "Physician Accessibility",
		main = paste("Catchment Size = ", as.character(i * 5), " Miles", sep = ""),
		xlim = c(0, 8),
		ylim = c(0, 750)
	)
	
	axis(
		side = 1,
		at = seq(0, 8, 1),
		labels = seq(0, 8, 1)
	)
	
	dev.off()
}

for (i in 3:9) {
	plot_file = paste("Beta_", as.character(format(i * 0.2, nsmall = 1)), ".png", sep = "")
	column_name = paste("Beta_", as.character(i * 2), sep = "")
	
	png(plot_file, width = 720, height = 480)
	
	hist(
		log(access[[column_name]]),
		breaks = seq(-2, 5, by = 0.5),
		xlab = "Physician Accessibility",
		main = paste("Beta = ", as.character(format(i * 0.2, nsmall = 1)), sep = ""),
		xlim = c(-2, 5),
		ylim = c(0, 1000)
	)
	
	axis(
		side = 1,
		at = seq(-2, 5, 1),
		labels = seq(-2, 5, 1)
	)
	
	dev.off()
}

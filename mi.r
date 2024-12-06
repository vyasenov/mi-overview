# Clear environment
rm(list = ls())

# Load required libraries
library(infotheo)
library(corrplot)
library(dplyr)
library(patchwork)
library(ggplot2)

# Load iris dataset
data(iris)

# Calculate mutual information matrix
mi_matrix <- mutinformation(discretize(iris[, 1:4]))

# Calculate correlation matrix
cor_matrix <- cor(iris[, 1:4])

# Compare MI vs Correlation for Sepal.Length and Petal.Length
mi_value <- mi_matrix[1, 3]
cor_value <- cor_matrix[1, 3]

print(paste("Mutual Information:", round(mi_value, 3)))
print(paste("Pearson Correlation:", round(cor_value, 3)))

# Set consistent color scale
color_scale <- colorRampPalette(c("blue", "white", "red"))

# Visualize mutual information matrix
png("/Users/vyasenov/mutual_information.png", width = 800, height = 800)
par(mar = c(2, 2, 2, 2))  # Adjust margins for all plots
par(mfrow = c(1, 2)) # Arrange plots side-by-side
corrplot(mi_matrix,
         method = "color",
         col = color_scale(200),
         title = "Mutual Information",
         is.corr = FALSE,
         addCoef.col = "black",  # Add numbers in black
         number.cex = 0.7,       # Adjust size of numbers
         tl.col = "black",       # Variable names in black
         mar = c(0, 0, 2, 0))    # Adjust margins for title

# Visualize correlation matrix
corrplot(cor_matrix,
         method = "color",
         col = color_scale(200),
         title = "Pearson Correlation",
         is.corr = TRUE,
         addCoef.col = "black",  # Add numbers in black
         number.cex = 0.7,       # Adjust size of numbers
         tl.col = "black",       # Variable names in black
         mar = c(0, 0, 2, 0))    # Adjust margins for title

dev.off()
library(infotheo)
library(corrplot)
library(dplyr)

# Load iris dataset
data(iris)

# Calculate mutual information matrix
mi_matrix <- mutinformation(discretize(iris[,1:4]))

# Calculate correlation matrix
cor_matrix <- cor(iris[,1:4])

# Compare MI vs Correlation for Sepal.Length and Petal.Length
mi_value <- mi_matrix[1,3]
cor_value <- cor_matrix[1,3]

print(paste("Mutual Information:", round(mi_value, 3)))
print(paste("Pearson Correlation:", round(cor_value, 3)))

# Visualize both matrices
par(mfrow=c(1,2))
corrplot(mi_matrix, method="color", title="Mutual Information")
corrplot(cor_matrix, method="color", title="Pearson Correlation")
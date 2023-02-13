library(BGData)
library(glmnet)
library(targets)

# load phenotype data
...

# load genomic data (contains NAs)
load.BGData("Data/Helgeland_01_2018_QC/BGData.RData")

n_snps <- 10000

# Function from glmnet to make model matrix
# Slow (several minutes) for n_snps = 10000
# performs single imputation from mean
X <- makeX(as.data.frame(geno(BGData)[, 1:n_snps]), na.impute = T, sparse = T)

# Penalized regression model on dumb phenotype
# alpha = 1 -> lasso
# alpha = 0 -> ridge
# alpha between -> elastic net
# nlambda: how many lambda values to try
glmnet(x = X, y = 1:3032, nlambda = 1000, alpha = 1)

# load model
load("/pfs/model/model.rda")

# load the input data
dataset <- read.csv(filename, header=FALSE)

# set the column names in the dataset
colnames(dataset) <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")

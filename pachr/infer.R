library(caret)

# load model
load("model.rda")

# loop over input files performing inference
files <- list.files(path="/pfs/attributes", pattern="*.csv", full.names=T, recursive=FALSE)
for (file in files){
	# load the data
	dataset <- read.csv(file, header=FALSE)
        colnames(dataset) <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")
        # perform the inference
        predictions <- predict(fit.svm, dataset)
        # output the results
        write.csv(predictions, file=paste("/pfs/out/", file, sep="")) 
}

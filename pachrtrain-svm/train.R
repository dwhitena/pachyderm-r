library(caret)

# load the CSV file from the local directory
dataset <- read.csv("/pfs/training/iris.csv", header = FALSE)

# set the column names in the dataset
colnames(dataset) <- c("Sepal.Length",
                       "Sepal.Width",
                       "Petal.Length",
                       "Petal.Width",
                       "Species")

# Run algorithm using 10-fold cross validation
control <- trainControl(method = "cv", number = 10)
metric <- "Accuracy"

# SVM
set.seed(7)
fit.svm <- train(form = Species ~ ., 
	         data = dataset,
                 method = "svmRadial", 
                 metric = metric, 
                 trControl = control)

# save a summary of this model
sink("/pfs/out/model.txt", append=FALSE, split=FALSE)
print(fit.svm)

# persist the model
save(fit.svm, file = "/pfs/out/model.rda")


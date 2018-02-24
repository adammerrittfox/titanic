get_prediction <- function(testdata){

testdata$low_fare <- ifelse(testdata$Fare<10, 1, 0)

output <- predict(model, testdata, type = 'response' )

}
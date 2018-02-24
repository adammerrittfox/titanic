dat <- read.csv("titanic_train.csv")
set.seed(666)
s <- sample(nrow(dat), round(0.6 * nrow(dat)))
train <- dat[s, ]
test <- dat[-s, ]

train$low_fare <- ifelse(train$Fare<10, 1, 0)

# Train model
model <- glm(Survived ~ Pclass + Sex + Fare + low_fare, 
             data = train,  
             family=binomial)

save(model, file = 'testmodel.rds')

### To Test
test$low_fare <- ifelse(test$Fare<10, 1, 0)
test$predicted <- predict(model, test, type = 'response' )
save(test, file = 'testdata.rds')

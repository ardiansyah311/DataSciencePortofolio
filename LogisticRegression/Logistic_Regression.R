#Menambahkan library
library(readxl)
library(caTools)
#Membaca file di directory pribadi
book <- read.csv('binary.csv')
#membagi data menjadi rasio, 80:20
split <- sample.split(book, SplitRatio = 0.8)
split
#menjadikan beberapa kolom menjadi faktor penentu
#factor digunakan karena ada level pasti yang dicari
book$admit <- as.factor(book$admit)
book$rank <- as.factor(book$rank)
#rasio true 80%(train) dan false 20%(test)
train <- subset(book, split=='TRUE')
test <- subset(book, split=='FALSE')
#membuat model test logistic regression
model <- glm(admit ~ gpa + rank, data = train, family = 'binomial')
summary(model)
#menguji residu
residu <- predict(model, test, type = 'response')
residu
residu2 <- predict(model, train, type = 'response')
residu2
#validasi model test yang dibuat antara data aktual dan data prediksi
confmatrix <- table(Actual_Value=train$admit, Predicted_Value=residu2 > 0.5)
confmatrix
#menguji akurasi
(confmatrix[[1,1]]*confmatrix[[2,2]])/sum(confmatrix)

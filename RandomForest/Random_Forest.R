#'''RandomForest digunakan untuk mencari hasil terbaik(x) yang dibandingkan dengan
#'semua variabel (a-z) yang mempengaruhi yang akan menghasilkan data prediksi (x)
#'yang diiinginkan sesuai dengan model yang dibuat'''
#membuat decision tree untuk menyelesaikan problem yang ada
#install library
library(randomForest)

#install java
#Sys.setenv(Java_Home.....)

#load data
#path <- "C:\\....."
data <- read.csv('winequality-red.csv')

#cek data
head(data)
tail(data)

#mengubah data yg dicari menjadi factor
#factor digunakan karena ada level pasti yang dicari
data$quality = as.factor(data$quality)

#membagi data menjadi data uji 
#membuat ratio pembanding antara data utama(80%) dengan test(20%)
data_set_size = floor(nrow(data)*0.80)
index <- sample(1:nrow(data), size = data_set_size)
training <- data[index,] #80% data utama 
testing <- data[-index,] #20% data testing

#membuat formula random forest dengan qualitas sebagai faktor utama, dan kolom lainnya menjadi faktor pendukung yang mempengruhi
rf <- randomForest(quality~., data = training, mtry = 4, ntree = 2001, importance=TRUE)
#mtry didapatkan dari sqrt/kuadrat dari total variabel yang ada di dataset sqrt 12 = 4
#ntree jumlah banyak data yang ingin diuji 2001, 501 default data 

rf
plot(rf) #melihat data chart

#mencari nilai hasil testing dari kualitas yang diprediksikan
result <- data.frame(testing$quality, predict(rf, testing[,1:11], type="response"))
head(result,5)
result
plot(result) #melihat data chart

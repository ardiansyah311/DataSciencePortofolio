library(readxl)
library(agricolae)
data <- read_excel('ral.xlsx')

#Mencari nilai anova
mn<-aov(Hasil~Perlakuan,data=data)
summary(mn)

#mencari nilai Koefisien Keragaman (KK)/ coefisiens varian 
cv.model(mn)

#mencari nilai uji Beda Nyata Jujur (BNJ)
HSD.test(mn,"Perlakuan", alpha = 0.05, console = T)

#hasilnya adalah C dan B memiliki perlakuan yang tidak berbeda nyata
#D dan A memiliki perlakuan yang tidak berbeda nyata

#menambahkan library
library(readxl)

#menambahkan data
rl <- read_excel('Book1.xlsx')

#membuat model
modelrl <- lm(Kerja~Pengalaman+Semangat, rl)

#hasil model
summary(modelrl)

#merumuskan model
Y = 4.57 + 1.10(Pengalaman) + 0.51 (Semangat)

#membuat hipotesa, apakah H0 ditolak dan H1 diterima (p value <0.05)
#H0 diterima dan H1 ditolak (p value > 0.05)
Pengalaman berpengaruh signifikan P-Value = 0.000417*** < 0.05
Semangat berepengaruh cukup signifikan P-Value = 0.023233* < 0.05

#menyimpulkan R-Squered
R-Squared = 0.8228 artinya variabel kinerja ditentukan oleh Pengalaman dan
Semangat kerja, 0.18 lainnya dipengaruhi oleh faktor lainnya.
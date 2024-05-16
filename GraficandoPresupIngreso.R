#---- Definicion del directorio de trabajo ----
setwd("~/Documents/GitHub/EntregaRectoria")
#---- Se cargan las librerias ----
library(readxl)
#---- Se leen los datos ----
PI <- read_excel("PresupuestoIngresos.xlsx")
View(PI)
#---- Definir los datos----
años <- c(2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024)
presupuesto <- c(
  109417680.00, 113685571.00, 254639379.00, 370034314.00, 500000000.00, 
  705173946.00, 729051644.00, 758213710.00, 755029564.00, 855029564.00, 
  855029564.00, 897781042.00, 1018815503.00, 1059568123.00, 1209600000.00, 
  1146028882.00, 1191870037.00, 1341870037.00, 1342012682.00, 1395693189.00, 
  1500000000.00, 1605000000.00, 1717350000.00
)
##---- Graficar los datos sin etiquetas en los ejes ----
plot(años, presupuesto, xlab = "AÑO", ylab = "PRESUPUESTO (MDP)",
     main = "PRESUPUESTO DE LA UNIVERSIDAD", 
     type = 'b', col = "red", pch = 16,
     xaxt = "n", yaxt = "n")
lines(años, presupuesto, col = "black")
#---- Modificar el ángulo de las etiquetas del eje X----
axis(side = 1, at = años, labels = años, las = 3)
#---- Convertir presupuesto a millones de dólares----
presupuestoMod <- round(presupuesto / 1000000,2)
#---- Agregar etiquetas en el eje Y----
axis(side = 2, at = presupuesto, 
     labels = presupuestoMod,
     cex.axis=0.6,
     las = 2)
abline(v = 2010, col = "yellow", lty = 2)
abline(v = 2012, col = "yellow", lty = 2)
abline(v = 2014, col = "gray", lty = 2)
abline(v = 2018, col = "gray", lty = 2)
abline(v = 2020, col = "blue", lty = 2)
abline(v = 2024, col = "blue", lty = 2)
#---- Se genera el archivo pdf con la grafica ----
pdf("GrafPresupuestoIngreso.pdf")
plot(años, presupuesto, xlab = "AÑO", ylab = "PRESUPUESTO (MDP)",
     main = "PRESUPUESTO DE LA UNIVERSIDAD", 
     type = 'b', col = "red", pch = 16,
     xaxt = "n", yaxt = "n")
lines(años, presupuesto, col = "black")
axis(side = 1, at = años, labels = años, las = 3)
presupuestoMod <- round(presupuesto / 1000000,2)
axis(side = 2, at = presupuesto, 
     labels = presupuestoMod,
     cex.axis=0.6,
     las = 2)
abline(v = 2010, col = "yellow", lty = 2)
abline(v = 2012, col = "yellow", lty = 2)
abline(v = 2014, col = "gray", lty = 2)
abline(v = 2018, col = "gray", lty = 2)
abline(v = 2020, col = "blue", lty = 2)
abline(v = 2024, col = "blue", lty = 2)
dev.off()


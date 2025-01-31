
load("G:/OneDrive - Universidad de Oviedo/Uni/Y1T2/Estad�stica/acero.rda")

### X variable explicativa/independiente

> 1. Buscar un modelo (elegir variable)
> 2. Estimaci�n de los par�metros del modelo
> 3. Comprobaciones para saber si el modelo es fiable
> 4. Pron�sticos

### Ejercicio: conocer una aproximaci�n a la emisi�n de N20 on la emisi�n de alguno de los otros gases: CO, CO2, NOx, SO2.

 # Estudiar normalidad
<> Estad�sticos -> Res�menes -> Test de normalidad (Shaphiro-Wilk)
> CO normal
> CO2 normal
> NOx normal
> N20 normal
> SO2 normal

 # Buscar el modelo

library(lattice, pos=26)
library(survival, pos=26)
library(Formula, pos=26)
library(ggplot2, pos=26)
library(Hmisc, pos=26)
rcorr.adjust(acero[,c("CO","CO2","N2O","NOx","SO2")], type="pearson", use="complete")

 <> Estad�sticos -> Res�menes -> Matriz de correlaciones

# De esto obtenemos que:
> Con S02 no hay relaci�n
> Con CO y CO2 hay una alta relaci�n
> Con NOx hay una relaci�n moderada
# Se escoge CO2 (m�x. correlaci�n)
# Se busca la recta N20 = C02*a + b


normalityTest(~CO, test="shapiro.test", data=acero)
normalityTest(~CO2, test="shapiro.test", data=acero)
normalityTest(~NOx, test="shapiro.test", data=acero)
normalityTest(~N2O, test="shapiro.test", data=acero)
normalityTest(~SO2, test="shapiro.test", data=acero)

 # Se representan gr�ficamente

<> Gr�ficas -> Matriz de diagramas de dispersi�n
scatterplotMatrix(~CO+CO2+N2O+NOx+SO2, regLine=FALSE, smooth=FALSE, diagonal=list(method="density"), data=acero)
<> Gr�ficas -> Diagrama de dispersi�n -> Seleccionar las cuatro opciones encima del suavizado
scatterplot(N2O~CO2, regLine=TRUE, smooth=list(span=0.5, spread=TRUE), boxplots='xy', data=acero)

 # Podemos concluir que el CO2 se ajusta bien como variable explicativa

> 2. Estimaci�n de los par�metros del modelo
<> Estad�sticos -> Ajuste de modelos -> Regresi�n lineal
modelo <- lm(N2O~CO2, data=acero)
summary(modelo)

# Con esto: NO2 = Estimate.(Intercept) + Estimate.CO2*CO2
#           NO2 = 1.526865 + 0.043850*CO2
# Adjusted R-squared: 0.7269 -> Un 72.69% de la variabilidad que hay en No2 es explicado con CO2

> 3. Comprobaciones para saber que el modelo es fiable

# Se estudian los residuos del modelo
# El estudio se hace de forma gr�fica

oldpar <- par(oma=c(0,0,3,0), mfrow=c(2,2))
plot(modelo)
par(oldpar)
<> Modelos -> Gr�ficas -> Gr�ficas b�sicas de diagn�stico
# Si en la gr�fica Normal Q-Q se asemejan todos los puntos a la recta, entonces los residuos son normales.
# En la gr�fica de Residuals vs Fitted, la l�nea roja se asemeja mucho a la recta de abscisas, con lo que la damos por buena.
# La varianza es constante
# Linealidad -> no hay ning�n patr�n extra�o

> 4. Pron�sticos (solo dentro del intervalo observado)
<> Res�menes -> Res�menes num�ricos
library(e1071, pos=31)
numSummary(acero[,"CO2", drop=FALSE], statistics=c("mean", "sd", "IQR", "quantiles"), quantiles=c(0,.25,.5,.75,1))

#### IMPORTANTE: se introduce manualmente
predict(modelo, data.frame(CO2=c(100,110,120)), interval = "prediction")

> La estimaci�n ser� de 6.35
# �Y con una confianza del 99%?
predict(modelo, data.frame(CO2=c(100,110,120)), interval = "prediction", level=0.99)

# Si se quiere el intervalo de confianza para la media estimada de N2O
predict(modelo, data.frame(CO2=c(110)), interval = "prediction", level=0.95)
# Con una confianza del 95% podemos decir que la emsi�n MEDIA de N2O en aquellas horas en las que la emisi�n de CO2 es 110, estar� entre 6.14 y 6.55

### Contraste de hip�tesis
> H0. hip�tesis nula
> H1. hip�tesis contraria
# La hip�tesis con un igual en SIEMPRE va en H0.
> Si el p-valor es menor que alpha, se rechaza H0 -> se acepta H1.
> Si el p-valor es mayor que alpha, se acepta H0.
# Se considera alpha = 0.05

load("G:/OneDrive - Universidad de Oviedo/Uni/Y1T2/Estad�stica/Estad-stica_R/acero.rda")

## Estudiar si el consumo medio es distinto de 120
> 1. Seleccionar el contraste adecuado
> 2. Establecer hip�tesis
> 3. Interpretar el p-valor

> 1. Seleccionar el contraste v�lido: t para una muestra(dist. normal, param�tricos) o Wilcoxon(dist. no normal, no param�tricos)
H0. los datos siguen una distribuci�n normal
H1. los datos NO siguen una distribuci�n normal
<> Test de Shapiro-Wilk: Estad�sticos -> Res�menes -> Test de normalidad -> Test de Shapiro-Wilk
> Se escoge el contraste siguiendo la normalidad.

> 2. Establecer hip�tesis
H0. Consumo medio = 120
H1. Consumo medio != 120

> 3. Interpretar el p-valor
<> Contraste t para una muestra: Estad�sticos -> Medias -> Test t para una muestra
<> Contraste de Wilcoxon: Estadisticos -> Test no param�tricos -> Test de Wilcoxon para una muestra

> Calcular la media de una variable: Test t para una muestra con hip�tesis nula 0.0


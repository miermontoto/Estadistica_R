
load("G:/OneDrive - Universidad de Oviedo/Uni/Y1T2/Estad�stica/Estad-stica_R/acero.rda")
editDataset(acero) # Editar manualmente los datos
View(acero) # Otra manera de visualizar los datos
head(acero) # Ver los datos superiores de la tabla
tail(acero) # ver los datos inferiores de la tabla
summary(acero) # Resumen total de todas las variables
acero$linea # Imprime los datos de una variable
levels(acero$linea) # Imprime todos los valores de una variable

<> Reordenar datos de una variable: Datos -> Modoficar variables del conjunto de datos activo -> Reordenar niveles de factor
<> Obtener frecuencia de valores de una variable: Estad�sticos -> Res�menes -> Distribuci�n de frecuencias
 # PRIMERO HAY QUE CONVERTIR EN FACTORES!!!! >>>
<> Convertir variable de num. a factor: Datos -> Modificar variables del conjunto de datos activo -> Convertir variable num�rica en factor
<> Res�menes num�ricos: Estad�sticos -> Res�menes -> Res�menes num�ricos
<> Calcular nuevas variables: Datos -> Modificar variables del conjunto de datos activo -> Calcular una nueva variable
<> Recodificar variable: Datos -> Modificar variables del conjunto de datos activo -> Recodificar variables
 > lo:100 = "Bajo"
 > 100:200 = "Medio"
 > 200:hi = "Alto"
> Siendo lo y hi los valores m�nimos y m�ximos respectivamente, se crean intervalos.
<> Filtrar valores de una variable: Datos -> Conjunto de datos activo -> Filtrar el conjunto de datos activo
 > ej: Expresi�n de selecci�n: temperatura == "alta", seleccionar nombre del nuevo conjunto de datos.
> Se crea un nuevo conjunto de datos INCLUYENDO TODAS LAS VARIABLES pero solo de los datos que coincidan con la condici�n.



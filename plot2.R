## Preliminares
install.packages("data.table")
library(data.table)
path <- getwd()
## Descarga de archivos
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, file.path(path, "dataFiles.zip"))
## DEscomprimir el archivo
unzip(zipfile = "dataFiles.zip")
#Se lee el archivo y se llama Archivo
Archivo <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
# Cambiamos el formato de fechas
# Cambiando el Formato para que pueda ser filtrado
Archivo[, Fechas := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
# Se seleccionan los datos de 2007-02-01 y 2007-02-03
Archivo <- Archivo[(Fechas >= "2007-02-01") & (Fechas < "2007-02-03")]
dim(Archivo)
colnames(Archivo)
# Se crea la base de la grafica
png("plot_2.png", width=480, height=480)
## Creando la Grafica Plot 2
plot(x = Archivo[, Fechas], y = Archivo[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")
## Se cierra el PNG
dev.off()



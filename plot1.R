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
Archivo[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
# Se seleccionan los datos de 2007-02-01 y 2007-02-02
Archivo <- Archivo[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
dim(Archivo)
# Se crea la base de la grafica
png("plot1.png", width=480, height=480)
## Creando la Grafica Plot 1
hist(Archivo[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## Se cierra el PNG
dev.off()

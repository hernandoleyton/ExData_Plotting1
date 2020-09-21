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
png("plot3.png", width=480, height=480)
## Creando la Grafica Plot 3
plot(Archivo[, Fechas], Archivo[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(Archivo[, Fechas], Archivo[, Sub_metering_2],col="red")
lines(Archivo[, Fechas], Archivo[, Sub_metering_3],col="blue")
legend("topright",col=c("black","red","blue"),c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
## Se cierra el PNG
dev.off()








# Plot 3
plot(powerDT[, dateTime], powerDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powerDT[, dateTime], powerDT[, Sub_metering_2],col="red")
lines(powerDT[, dateTime], powerDT[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
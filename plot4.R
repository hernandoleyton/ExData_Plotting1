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
png("plot4.png", width=480, height=480)
## Creamos la rejilla 2 x 2
par(mfrow=c(2,2))
## Creando la Grafica Plot 4
# La grafica 1
plot(Archivo[, Fechas], Archivo[, Global_active_power], type="l", xlab="", ylab="Global Active Power")
# La grafica 2
plot(Archivo[, Fechas],Archivo[, Voltage], type="l", xlab="Fechas", ylab="Voltage")
# La grafica 3
plot(Archivo[, Fechas], Archivo[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(Archivo[, Fechas], Archivo[, Sub_metering_2], col="red")
lines(Archivo[, Fechas], Archivo[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "), lty=c(1,1), bty="n", cex=.5) 
# La grafica 4
plot(Archivo[, Fechas], Archivo[,Global_reactive_power], type="l", xlab="Fechas", ylab="Global_reactive_power")
## Se cierra el PNG
dev.off()
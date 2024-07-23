install.packages("Microsoft365R")
library(Microsoft365R)
library(readxl)

# Inicia sesión en Microsoft 365 (esto abrirá una ventana del navegador para autenticarse)
site <- get_sharepoint_site("https://bmkholdings.sharepoint.com/sites/bgGeneticsChile-ALNUSSpA")

# Accede a la carpeta o documento específico
doc <- site$get_drive()$get_item("Shared Documents/Entregas Clientes Status.xlsx")

# Descarga el archivo a un archivo temporal
temp_file <- tempfile(fileext = ".xlsx")
doc$download(temp_file)

# Lee el archivo de Excel
data <- read_excel(temp_file)

# Elimina el archivo temporal
unlink(temp_file)

# Imprime los datos
print(data)

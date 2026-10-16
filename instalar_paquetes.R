# Instala los paquetes necesarios para las tres sesiones (ejecutar una sola vez)
paquetes <- c("tidyverse", "rmarkdown", "zoo", "dbscan", "bestNormalize",
              "splitTools", "rpart", "rpart.plot", "randomForest", "gridExtra")

faltantes <- setdiff(paquetes, rownames(installed.packages()))
if (length(faltantes) > 0) install.packages(faltantes)
cat("Paquetes listos.\n")

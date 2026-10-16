# Diplomado de Calidad del Aire: Modelación con Machine Learning

Material del módulo de modelación del Diplomado de Gestión de Calidad del Aire y
Control de Contaminación Atmosférica (Universidad de Santiago de Chile).

El curso consta de **3 sesiones de 3 horas**. Cada sesión es un único documento
R Markdown que reúne teoría, código y ejercicios, de modo que no hace falta una
presentación aparte.

| Sesión | Archivo | Contenido |
|--------|---------|-----------|
| 1 | `clase1.Rmd` | Ciclo de vida de un proyecto de datos, proyecto reproducible y `renv`, lectura y transformación con `tidyverse`, funciones, unión de tablas y exploración |
| 2 | `clase2.Rmd` | Datos faltantes, control de calidad por rangos físicos, atípicos (IQR, Z-score, LOF), variables temporales, componentes u y v del viento y normalización |
| 3 | `clase3.Rmd` | Machine learning, árboles de decisión (entropía y Gini), poda y validación cruzada, Random Forest, evaluación, regresión y series temporales |

## Datos

Registros horarios de la estación **Parque O'Higgins** (Santiago), desde el
1 de enero de 2010 hasta enero de 2026, en la carpeta `data/`:

- PM2.5 (`..._PM25.csv`), con columnas por nivel de validación
- Humedad relativa, temperatura, dirección y velocidad del viento

Formato: separador `;` y coma decimal (se leen con `read_csv2()`). Los datos
provienen de la descarga del SINCA y se incluyen con fines educativos.

## Cómo usarlo

1. Clonar o descargar el repositorio.
2. Abrir `diplomado-calidad-del-aire.Rproj` en RStudio. Esto fija la carpeta del
   proyecto como directorio de trabajo, requisito para que funcionen las rutas
   relativas (`data/...`).
3. Instalar los paquetes (una sola vez):

   ```r
   source("instalar_paquetes.R")
   ```

4. Ejecutar las sesiones **en orden**. Cada una genera un archivo `.rds` que usa la
   siguiente:

   - `clase1.Rmd` genera `consolidadosParqueOhiggins.rds`
   - `clase2.Rmd` genera `consolidadosParqueOhigginsv2.rds`
   - `clase3.Rmd` usa el archivo de la sesión 2

   Los `.rds` no se versionan (están en `.gitignore`): se regeneran con el código.

Para compilar un informe completo, usar el botón **Knit** de RStudio o:

```r
rmarkdown::render("clase1.Rmd")
```

## Tiempos de ejecución

Con un solo núcleo, aproximadamente: sesión 1, 10 segundos; sesión 2, 30 segundos;
sesión 3, 3 a 4 minutos (las extensiones del final son las más pesadas y están
pensadas como tarea).

## Estructura

```
.
├── clase1.Rmd, clase2.Rmd, clase3.Rmd
├── data/                    # datos crudos (no se modifican)
├── instalar_paquetes.R
├── material-referencia/     # programa del curso y presentaciones originales
└── diplomado-calidad-del-aire.Rproj
```

## Notas

- La norma primaria de PM2.5 (D.S. N° 12/2011) se encuentra en proceso de revisión.
  Verificar el estado vigente en <https://normasaire.mma.gob.cl> antes de citar cifras
  en un informe.
- Los modelos del curso son **de diagnóstico** (usan la meteorología de la misma hora).
  Un modelo de pronóstico requiere meteorología pronosticada.

## Autor

Marcelo Oyaneder, Partículas SpA.

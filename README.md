# Diplomado de Calidad del Aire: Modelación con Machine Learning

Material del módulo de modelación del **Diplomado en Gestión de la Calidad del Aire y
Control de la Contaminación Atmosférica** (Universidad de Santiago de Chile).

El curso consta de **3 sesiones de 3 horas** (9 horas en total), en modalidad en línea.
Cada sesión es un único documento R Markdown que reúne teoría, código y ejercicios, de
modo que no se necesita una presentación aparte. Las sesiones se desarrollan en
**Posit Cloud** (RStudio en el navegador), por lo que no es necesario instalar nada en
el computador.

## Cronograma

Horario de Chile (zona horaria America/Santiago). Las sesiones se realizan por
videoconferencia (Google Meet).

| Sesión | Fecha | Horario | Archivo | Contenido |
|--------|-------|---------|---------|-----------|
| 1 | Sábado 17 de octubre de 2026 | 9:00 a 12:00 h | `clase1.Rmd` | Ciclo de vida de un proyecto de datos, proyecto reproducible y `renv`, lectura y transformación con `tidyverse`, funciones, unión de tablas y exploración |
| 2 | Viernes 23 de octubre de 2026 | 18:00 a 21:00 h | `clase2.Rmd` | Datos faltantes, control de calidad por rangos físicos, atípicos (IQR, Z-score, LOF), variables temporales, componentes u y v del viento y normalización |
| 3 | Sábado 24 de octubre de 2026 | 9:00 a 12:00 h | `clase3.Rmd` | Machine learning, árboles de decisión (entropía y Gini), poda y validación cruzada, Random Forest, evaluación, regresión y series temporales |

## Antes de la primera sesión: preparar el entorno en Posit Cloud

Se recomienda realizar estos pasos **antes de la Sesión 1**, para no perder tiempo de
clase. Tardan unos 10 a 15 minutos.

### Paso 1. Crear una cuenta en Posit Cloud

1. Ingrese a <https://posit.cloud>.
2. Haga clic en **Sign Up** (o **Get Started**) y elija el plan **Free** (gratuito).
3. Regístrese con su cuenta de Google, con su cuenta de GitHub o con su correo
   electrónico. Si usa correo, confirme su dirección con el mensaje que recibirá.
4. Inicie sesión. Quedará en su espacio de trabajo personal (*Your Workspace*).

> Los nombres exactos de los botones pueden variar levemente según la versión de la
> página.

### Paso 2. Copiar el repositorio de GitHub como un proyecto

1. En su espacio de trabajo, haga clic en **New Project** y elija
   **New Project from Git Repo**.
2. Pegue la dirección del repositorio:

   ```
   https://github.com/marcelooyaneder/ml-calidad-del-aire-usach.git
   ```

3. Confirme con **OK**. Posit Cloud descargará todos los archivos y abrirá RStudio.
   Si el repositorio fuera privado, el sistema pedirá sus credenciales de GitHub (usuario
   y un token de acceso personal).
4. Cuando termine de cargar, en el panel **Files** (abajo a la derecha) debería ver
   `clase1.Rmd`, `clase2.Rmd`, `clase3.Rmd`, la carpeta `data/` y el resto de los
   archivos.

Opcionalmente, puede renombrar el proyecto (por ejemplo, "Diplomado calidad del aire")
con el nombre que aparece en la parte superior de la pantalla.

### Paso 3. Instalar los paquetes (una sola vez)

En la **Consola** de RStudio (panel inferior izquierdo) ejecute:

```r
source("instalar_paquetes.R")
```

Esto instala todos los paquetes del curso. Puede tardar algunos minutos la primera vez.
Cada sesión incluye además su propio bloque de instalación, por si desea instalar solo
lo necesario.

### Paso 4. Verificar que todo funciona

1. Abra `clase1.Rmd` desde el panel **Files** (doble clic).
2. Ejecute el primer bloque de código con el botón verde de reproducción, o con
   `Ctrl + Shift + Enter` (`Cmd + Shift + Enter` en Mac).
3. Si no aparece ningún error, el entorno está listo.

## Durante el curso

- Abra el archivo de la sesión correspondiente y avance **de arriba hacia abajo**:
  lea el texto, ejecute cada bloque de código y comente el resultado.
- Ejecute las sesiones **en orden**. Cada una genera un archivo `.rds` que usa la
  siguiente:
  - `clase1.Rmd` genera `consolidadosParqueOhiggins.rds`
  - `clase2.Rmd` genera `consolidadosParqueOhigginsv2.rds`
  - `clase3.Rmd` usa el archivo de la sesión 2
- Para obtener el informe completo en HTML, use el botón **Knit** de RStudio.

### Consideraciones sobre el plan gratuito

El plan gratuito de Posit Cloud limita la memoria y las horas de cómputo mensuales (el
detalle vigente está en <https://posit.cloud/plans/free>). La **Sesión 3** es la más
exigente, porque entrena modelos Random Forest con más de 100.000 filas. Para cuidar
los recursos:

- Cierre los proyectos que no esté usando.
- No deje ejecutándose bloques de código que no necesite.
- Las **extensiones** del final de la Sesión 3 son las más pesadas y están pensadas
  como tarea.

### Guardar y descargar su trabajo

Los cambios que realice quedan en su proyecto de Posit Cloud, pero **no** se envían al
repositorio original. Si desea conservar una copia, en el panel **Files** seleccione los
archivos, haga clic en **More** y luego en **Export**.

## Uso en un computador propio (alternativa)

Si prefiere trabajar localmente con RStudio:

1. Clone o descargue el repositorio.
2. Abra `diplomado-calidad-del-aire.Rproj`. Esto fija la carpeta del proyecto como
   directorio de trabajo, requisito para que funcionen las rutas relativas (`data/...`).
3. Ejecute `source("instalar_paquetes.R")`.

## Datos

Registros horarios de la estación **Parque O'Higgins** (Santiago), desde el
1 de enero de 2010 hasta enero de 2026, en la carpeta `data/`:

- PM2.5 (`..._PM25.csv`), con columnas por nivel de validación
- Humedad relativa, temperatura, dirección y velocidad del viento

Formato: separador `;` y coma decimal (se leen con `read_csv2()`). Los datos provienen
de la descarga del SINCA y se incluyen con fines educativos.

## Estructura del repositorio

```
.
├── clase1.Rmd, clase2.Rmd, clase3.Rmd
├── data/                    # datos crudos (no se modifican)
├── instalar_paquetes.R
├── material-referencia/     # programa del curso y presentaciones originales
└── diplomado-calidad-del-aire.Rproj
```

## Tiempos de ejecución

Con un solo núcleo, aproximadamente: sesión 1, 10 segundos; sesión 2, 30 segundos;
sesión 3, 3 a 4 minutos.

## Notas

- La norma primaria de PM2.5 (D.S. N° 12/2011) se encuentra en proceso de revisión.
  Verificar el estado vigente en <https://normasaire.mma.gob.cl> antes de citar cifras
  en un informe.
- Los modelos del curso son **de diagnóstico** (usan la meteorología de la misma hora).
  Un modelo de pronóstico requiere meteorología pronosticada.

## Autor

Marcelo Oyaneder Labarca.

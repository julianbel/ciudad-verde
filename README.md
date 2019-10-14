# ciudad-verde
 Análisis del Sistema de Higiene Urbana de CABA

Este repositorio incluye el reporte de Power BI utilizado para analizar el estado actual del sistema de Higiene Urbana de la Ciudad de Buenos Aires.

Contenido:
 - Scripts de SQL para la creación de la base de datos utilizada en el análisis (creada en MySQL).
   Orden de ejecución:
     1. Ubicar archivos .csv contenidos en la carpeta "Datasets para importar" en la siguiente ruta: 
        C:\ProgramData\MySQL\MySQL Server 8.0\Uploads
     2. Ejecutar script "BA_VERDE_CREACION_DW.sql".
     3. Ejecutar script "BA_VERDE_CREACION_FK.sql".
     4. Ejecutar script "BA_VERDE_ETL.sql".
     
 - Reporte de Power BI con la visualización de los datos. 
 
 - Archivo PDF con el contexto y hallazgos del proyecto.

# ciudad-verde
 Análisis del Sistema de Higiene Urbana de CABA

Este repositorio incluye el reporte de Power BI utilizado para analizar el estado del sistema de Higiene Urbana de la Ciudad de Buenos Aires durante el 2018 y parte del 2019.

Contenido:
 - Scripts de SQL para la creación de la base de datos utilizada en el análisis (creada en MySQL).
   Orden de ejecución:
     1. Ubicar archivos .csv contenidos en los archivos 7zip "Datasets para importar 1" y "Datasets para importar 2" en la siguiente ruta: 
        C:\ProgramData\MySQL\MySQL Server 8.0\Uploads
     2. Ejecutar script "BA_VERDE_CREACION_DW.sql".
     3. Ejecutar script "BA_VERDE_CREACION_FK.sql".
     4. Ejecutar script "BA_VERDE_ETL.sql".
     
 - Reporte de Power BI con la visualización de los datos. 
 
 - Archivo PDF con el contexto y hallazgos del proyecto.

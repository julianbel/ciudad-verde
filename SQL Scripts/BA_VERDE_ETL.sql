/* SCRIPT PARA ETL Y VISTAS */
USE baverde;
/* ETL Tabla 'atencion':
    1. Filtrado por categorías: 'LIMPIEZA Y RECOLECCIÓN' y 'RECICLADO Y PROTECCIÓN AMBIENTAL'
    2. Excluir los siguientes conceptos: 'RETIRO DE AFICHES Y/O PASACALLES', 'RUIDOS MOLESTOS Y VIBRACIONES', 'FIJACIÓN DE AFICHES EN LUGARES NO PERMITIDOS', 'RADIACIONES NO IONIZANTES Y ANTENAS DE TELEFONÍA CELULAR', 'MALOS OLORES / HUMOS / GASES TÓXICOS', 'MALOS OLORES / HUMOS / GASES TÓXICOS', 'EMANACIONES / HUMO NEGRO PRODUCIDOS POR COLECTIVOS', 'IRREGULARIDADES EN EL MANTENIMIENTO DE TANQUES DE AGUA'
*/
DROP VIEW IF EXISTS atencion_ciudadana;
CREATE VIEW atencion_ciudadana AS (
    SELECT 
	    id                                                                          AS 'ID'
        ,contacto                                                                   AS 'Nro. Contacto'
        ,periodo                                                                    AS 'Período'
        ,categoria                                                                  AS 'Categoría'
        ,subcategoria                                                               AS 'Subcategoría'
        ,concepto                                                                   AS 'Concepto'
        ,tipo_prestacion                                                            AS 'Tipo de Prestación'
        ,fecha_ingreso                                                              AS 'Fecha de Ingreso'
        ,STR_TO_DATE(UPPER(REPLACE(hora_ingreso,'.','')),'%h:%i:%s %p')             AS 'Hora de Ingreso'
        ,comuna_id                                                                  AS 'ID Comuna'
        ,barrio_id                                                                  AS 'ID Barrio'
        ,calle                                                                      AS 'Calle'
        ,altura                                                                     AS 'Altura'
        ,calle_cruce                                                                AS 'Calle Cruce'
        ,lat                                                                        AS 'Latitud'
        ,lon                                                                        AS 'Longitud'
        ,canal                                                                      AS 'Canal'
        ,genero                                                                     AS 'Genero'
        ,estado_contacto                                                            AS 'Estado de Contacto'
        ,fecha_cierre_contacto                                                      AS 'Fecha Cierre de Contacto'
    FROM 
	    baverde.atencion 
    WHERE 
	    categoria IN (
		    'LIMPIEZA Y RECOLECCIÓN'
            ,'RECICLADO Y PROTECCIÓN AMBIENTAL'
	    )
	    AND concepto NOT IN (
            'RETIRO DE AFICHES Y/O PASACALLES'
            ,'RUIDOS MOLESTOS Y VIBRACIONES'
            ,'FIJACIÓN DE AFICHES EN LUGARES NO PERMITIDOS'
            ,'RADIACIONES NO IONIZANTES Y ANTENAS DE TELEFONÍA CELULAR'
            ,'MALOS OLORES / HUMOS / GASES TÓXICOS'
            ,'MALOS OLORES / HUMOS / GASES TÓXICOS'
            ,'EMANACIONES / HUMO NEGRO PRODUCIDOS POR COLECTIVOS'
            ,'IRREGULARIDADES EN EL MANTENIMIENTO DE TANQUES DE AGUA'
	    )
    ORDER BY 
	    fecha_ingreso ASC
);

/* ETL Tabla 'comunas'
    1. Sumatoria habitantes por comuna (sólo proyección 2019).
    2. Cálculo de densidad poblacional.
    3. Creación Vista 'comunas_caba'.
*/
DROP VIEW IF EXISTS comunas_caba;
CREATE VIEW comunas_caba AS (
    SELECT 
	    com.id                                                                      AS 'ID'
        ,com.nombre                                                                 AS 'Nombre'
        ,com.superficie_km2                                                         AS 'Superficie (km2)'
        ,com.zona_id                                                                AS 'ID Zona'
        ,SUM(dem.habitantes)                                                        AS 'Cantidad de Habitantes'
        ,ROUND((SUM(dem.habitantes) / com.superficie_km2),0)                        AS 'Densidad Poblacional (hab/km2)'
    FROM
	    baverde.comunas AS com
    INNER JOIN 
	    baverde.demografia AS dem
		    ON com.id = dem.comuna_id
    WHERE 
	    anio = 2019
    GROUP BY
	    com.id
);

/* ETL Tabla 'barrios':
    1. Creación Vista 'barrios_caba'.
*/
DROP VIEW IF EXISTS barrios_caba;
CREATE VIEW barrios_caba AS (
    SELECT
	    id                                                                          AS 'ID'
        ,nombre                                                                     AS 'Nombre'
        ,superficie_km2                                                             AS 'Superficie (km2)'
        ,comuna_id                                                                  AS 'ID Comuna'
    FROM
        baverde.barrios
);

/* ETL Tabla 'zonasrecoleccion':
    1. Creación Vista 'zonas_recoleccion'.
*/
DROP VIEW IF EXISTS zonas_recoleccion;
CREATE VIEW zonas_recoleccion AS (
    SELECT
	    id                                                                          AS 'ID'
        ,nombre                                                                     AS 'Nombre'
        ,empresa_id                                                                 AS 'ID Empresa'
    FROM
        baverde.zonasrecoleccion
);

/* ETL Tabla 'entesrecoleccion':
    1. Creación Vista 'entes_recoleccion'.
*/
DROP VIEW IF EXISTS entes_recoleccion;
CREATE VIEW entes_recoleccion AS (
    SELECT
	    id                                                                          AS 'ID'
        ,nombre                                                                     AS 'Nombre'
        ,tipo                                                                       AS 'Tipo'
        ,zona_id                                                                    AS 'ID zona'
    FROM
        baverde.entesrecoleccion
);

/* ETL Tabla 'cooperativas':
    1. Obtención de datos de ubicación de la cooperativa 'El Trébol'.
    2. Creación Vista 'cooperativas_recuperadores'.
*/
UPDATE baverde.cooperativas SET direc_norm = 'RIESTRA AV. 3200' WHERE id = 4;
UPDATE baverde.cooperativas SET direc_arcg = '3200 RIESTRA AV.' WHERE id = 4;
UPDATE baverde.cooperativas SET calle = 'RIESTRA AV.' WHERE id = 4;
UPDATE baverde.cooperativas SET altura = 3200 WHERE id = 4;
UPDATE baverde.cooperativas SET barrio_id = 47 WHERE id = 4;
UPDATE baverde.cooperativas SET comuna_id = 8 WHERE id = 4;
UPDATE baverde.cooperativas SET codigo_postal = '1437' WHERE id = 4;
UPDATE baverde.cooperativas SET lat = '-34.6567232' WHERE id = 4;
UPDATE baverde.cooperativas SET lon = '-58.4538048' WHERE id = 4;

DROP VIEW IF EXISTS cooperativas_recuperadores;
CREATE VIEW cooperativas_recuperadores AS (
    SELECT
        id                                                                          AS 'ID'
        ,nombre                                                                     AS 'Razón Social'
        ,nom_map                                                                    AS 'Nombre'
        ,direc_norm                                                                 AS 'Dirección Normalizada'
        ,direc_arcg                                                                 AS 'Dirección ArcGis'
        ,calle                                                                      AS 'Calle'
        ,altura                                                                     AS 'Altura'
        ,barrio_id                                                                  AS 'ID Barrio'
        ,comuna_id                                                                  AS 'ID Comuna'
        ,codigo_postal                                                              AS 'CP'
        ,codigo_postal_argentino                                                    AS 'CPA'
        ,lat                                                                        AS 'Latitud'
        ,lon                                                                        AS 'Longitud'
    FROM
        baverde.cooperativas
);

/* ETL Tabla 'centros':
    1. Creación Vista 'centros_reciclado'
*/
DROP VIEW IF EXISTS centros_recuperadores;
CREATE VIEW centros_recuperadores AS (
    SELECT
        id                                                                          AS 'ID'
        ,lat                                                                        AS 'Latitud'
        ,lon                                                                        AS 'Longitud'
        ,nombre                                                                     AS 'Nombre'
        ,cooperativa_id                                                             AS 'ID Cooperativa'
        ,barrio_id                                                                  AS 'ID Barrio'
        ,comuna_id                                                                  AS 'ID Comuna'
        ,calle                                                                      AS 'Calle'
        ,altura                                                                     AS 'Altura'
        ,codigo_postal                                                              AS 'CP'
        ,codigo_postal_argentino                                                    AS 'CPA'
    FROM
        baverde.centros
);

/* ETL Tabla 'demografia':
    1. Agrupación para excluir diferenciación de sexo.
    2. Creación Vista 'demografia_caba'.
*/
DROP VIEW IF EXISTS demografia_caba;
CREATE VIEW demografia_caba AS (
   SELECT
        id                                                                          AS 'ID'
        ,anio                                                                       AS 'Año'
        ,comuna_id                                                                  AS 'ID Comuna'
        ,grupo_edad                                                                 AS 'Grupo Etário'
        ,SUM(habitantes)                                                            AS 'Cantidad Habitantes'
    FROM
	    baverde.demografia
    GROUP BY
	    anio
        ,comuna_id
        ,grupo_edad
);

/* ETL Tabla 'contenedores':
    1. Creación Vista 'contenedores_caba'.
*/
DROP VIEW IF EXISTS contenedores_caba;
CREATE VIEW contenedores_caba AS (
   SELECT
        id                                                                          AS 'ID'
        ,contenedor                                                                 AS 'Código Contenedor'
        ,tarjeta                                                                    AS 'Tarjeta'
        ,punto_reco                                                                 AS 'Punto de Recolección'
        ,rutas                                                                      AS 'Rutas'
        ,empresa_id                                                                 AS 'ID Empresa'
        ,direccion                                                                  AS 'Dirección'
        ,calle                                                                      AS 'Calle'
        ,altura                                                                     AS 'Altura'
        ,lat                                                                        AS 'Latitud'
        ,lon                                                                        AS 'Longitud'
    FROM
	    baverde.contenedores
);

/* ETL Tabla 'campanasverdes':
    1. Creación Vista 'campanasverdes_caba'.
*/
DROP VIEW IF EXISTS campanasverdes_caba;
CREATE VIEW campanasverdes_caba AS (
   SELECT
        id                                                                          AS 'ID'
        ,lat                                                                        AS 'Latitud'
        ,lon                                                                        AS 'Longitud'
        ,lat_wg84                                                                   AS 'Latitud WG84'
        ,lon_wg84                                                                   AS 'Longitud WG84'
        ,nombre                                                                     AS 'Nombre'
        ,modelo                                                                     AS 'Modelo'
        ,direccion_base                                                             AS 'Dirección Base'
        ,direccion_norm                                                             AS 'Dirección Normalizada'
        ,calle                                                                      AS 'Calle'
        ,altura                                                                     AS 'Altura'
        ,calle_cruce                                                                AS 'Calle Cruce'
        ,barrio_id                                                                  AS 'ID Barrio'
        ,comuna_id                                                                  AS 'ID Comuna'
        ,codigo_postal                                                              AS 'CP'
        ,codigo_postal_argentino                                                    AS 'CPA'
    FROM
	    baverde.campanasverdes
);

/* ETL Tabla 'puntosverdes':
    1. Creación Vista 'puntosverdes_caba'.
*/
DROP VIEW IF EXISTS puntosverdes_caba;
CREATE VIEW puntosverdes_caba AS (
    SELECT 
        id                                                                          AS 'ID' 
        ,lon                                                                        AS 'Longitud'
        ,lat                                                                        AS 'Latitud'
        ,plaza                                                                      AS 'Plaza'
        ,tipo                                                                       AS 'Tipo'
        ,materiales                                                                 AS 'Materiales Recibidos'
        ,cooperativa_id                                                             AS 'ID Cooperativa'
        ,calle                                                                      AS 'Calle'
        ,altura                                                                     AS 'Calle Cruce'
        ,direccion                                                                  AS 'Dirección'
        ,barrio_id                                                                  AS 'ID Barrio'
        ,comuna_id                                                                  AS 'ID Comuna' 
	FROM
		baverde.puntosverdes
);

/* ETL Tabla 'pesajepv':
    1. Creación Vista 'contenedores_caba'.
*/
DROP VIEW IF EXISTS pesajepv_caba;
CREATE VIEW pesajepv_caba AS (
    SELECT 
        id                                                                       	AS 'ID'
        ,punto                                                                   	AS 'Punto Verde'
        ,comuna_id																 	AS 'ID Comuna'
        ,anio                                                                    	AS 'Año Pesaje'
        ,mes                                                                     	AS 'Mes Pesaje'
        ,pesaje_avu_litros                                                       	AS 'Pesaje AVU (litros)'
        ,cantidad_aed                                                            	AS 'Cantidad AED'
        ,pesaje_aed                                                              	AS 'Pesaje AED'
        ,material                                                                	AS 'Material'
    FROM 
	    baverde.pesajepv
);

/* ETL Tabla 'recoleccionresiduosprop':
    1. Creación Vista 'recolección_caba'.
*/
CREATE VIEW recoleccion_caba AS (
	SELECT 
		anio 																		AS 'Año'
        ,mes 																		AS 'Mes'
        ,comuna_id 																	AS 'ID Comuna'
        ,res_domiciliario_tn 														AS 'Residuos Domiciliarios (tn)'
        ,res_barrido_tn 															AS 'Barrido y Poda (tn)'
        ,res_resto_tn 																AS 'Resto (tn)'
        ,res_relleno_sanitario_tn 													AS 'Relleno Sanitario (tn)'
        ,tipo_desecho 																AS 'Tipo Desecho'
        ,proporcion 																AS 'Proporcion'
        ,proporcion_tn 																AS 'Toneladas x Tipo'
	FROM 
		baverde.recoleccionresiduosprop
);
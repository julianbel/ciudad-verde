/* SCRIPT DE CREACIÓN DE FOREIGN KEYS 
IMPORTANTE: Antes de ejecutar, completar los siguientes pasos:
	1. Abrir MySQL.
	2. Ir a 'Edit' > 'Preferences' > 'SQL Editor'
	3. Navegar hasta la sección 'Other'.
	4. Destildar la opción 'Safe Updates (rejects UPDATEs and DELETEs with no restrictions)'.
	5. Hacer click en 'OK'.
	6. Reiniciar MySQL. */
USE baverde;
/* ADAPTACIÓN DE TABLA: 'centros' */
-- Modificación de valores de ids de comuna.
UPDATE centros SET comuna = 1 WHERE	comuna = 'Comuna 1';
UPDATE centros SET comuna = 4 WHERE	comuna = 'Comuna 4';
UPDATE centros SET comuna = 6 WHERE	comuna = 'Comuna 6';
UPDATE centros SET comuna = 8 WHERE	comuna = 'Comuna 8';
UPDATE centros SET comuna = 12 WHERE comuna = 'Comuna 12';
UPDATE centros SET comuna = '13' WHERE id = 4;
-- Modificación de valores de ids de barrio.
UPDATE centros SET barrio = 8 WHERE barrio = 'Caballito';
UPDATE centros SET barrio = 25 WHERE barrio = 'Parque Patricios';
UPDATE centros SET barrio = 48 WHERE barrio = 'Villa Urquiza';
UPDATE centros SET barrio = 29 WHERE barrio = 'Retiro';
UPDATE centros SET barrio = 47 WHERE barrio = 'Villa Soldati';
UPDATE centros SET barrio = 4 WHERE barrio = 'Barracas';
UPDATE centros SET barrio = '20' WHERE id = 4;
-- Modificación de valores de ids de cooperativa administradora del Centro.
UPDATE centros SET administra = 10 WHERE administra = 'Cooperativa Recuperadores Urbanos del Oeste';
UPDATE centros SET administra = 2 WHERE administra = 'Cooperativa El Amanecer de los Cartoneros';
UPDATE centros SET administra = 1 WHERE administra = 'Cooperativa El Alamo';
UPDATE centros SET administra = 11 WHERE administra = 'Cooperativa Las Madreselvas';
UPDATE centros SET administra = 12 WHERE administra = 'Cooperativa El Ceibo';
UPDATE centros SET administra = 6 WHERE administra = 'Cooperativa Recolectores del Oeste';
UPDATE centros SET administra = 5 WHERE administra = 'Cooperativa Alelí';
-- Cambio de nombre de columnas
ALTER TABLE baverde.centros CHANGE COLUMN comuna comuna_id double NULL;
ALTER TABLE baverde.centros CHANGE COLUMN barrio barrio_id double NULL;
ALTER TABLE baverde.centros CHANGE COLUMN administra cooperativa_id double NULL;

/* ADAPTACIÓN DE TABLA: 'cooperativas' */
-- Modificación de valores de ids de comuna.
UPDATE cooperativas SET comuna = 1 WHERE comuna = 'COMUNA 1';
UPDATE cooperativas SET comuna = 3 WHERE comuna = 'COMUNA 3';
UPDATE cooperativas SET comuna = 4 WHERE comuna = 'COMUNA 4';
UPDATE cooperativas SET comuna = 7 WHERE comuna = 'COMUNA 7';
UPDATE cooperativas SET comuna = 8 WHERE comuna = 'COMUNA 8';
UPDATE cooperativas SET comuna = 9 WHERE comuna = 'COMUNA 9';
UPDATE cooperativas SET comuna = 12 WHERE comuna = 'COMUNA 12';
UPDATE cooperativas SET comuna = 13 WHERE comuna = 'COMUNA 13';
UPDATE cooperativas SET comuna = 14 WHERE comuna = 'COMUNA 14';
UPDATE cooperativas SET comuna = null WHERE id = 4;
-- Modificación de valores de ids de barrio.
UPDATE cooperativas SET barrio = 48 WHERE barrio = 'VILLA URQUIZA';
UPDATE cooperativas SET barrio = 3 WHERE barrio = 'BALVANERA';
UPDATE cooperativas SET barrio = 33 WHERE barrio = 'SAN TELMO';
UPDATE cooperativas SET barrio = 15 WHERE barrio = 'LINIERS';
UPDATE cooperativas SET barrio = 47 WHERE barrio = 'VILLA SOLDATI';
UPDATE cooperativas SET barrio = 19 WHERE barrio = 'NUEVA POMPEYA';
UPDATE cooperativas SET barrio = 13 WHERE barrio = 'FLORES';
UPDATE cooperativas SET barrio = 20 WHERE barrio = 'NUÑEZ';
UPDATE cooperativas SET barrio = 21 WHERE barrio = 'PALERMO';
UPDATE cooperativas SET barrio = null WHERE id = 4;
-- Cambio de nombre de columnas
ALTER TABLE baverde.cooperativas CHANGE COLUMN comuna comuna_id double NULL;
ALTER TABLE baverde.cooperativas CHANGE COLUMN barrio barrio_id double NULL;

/* ADAPTACIÓN DE TABLA: 'campanasverdes' */
-- Modificación de valores de ids de comuna.
UPDATE campanasverdes SET comuna = 1 WHERE comuna = 'Comuna 1';
UPDATE campanasverdes SET comuna = 2 WHERE comuna = 'Comuna 2';
UPDATE campanasverdes SET comuna = 3 WHERE comuna = 'Comuna 3';
UPDATE campanasverdes SET comuna = 4 WHERE comuna = 'Comuna 4';
UPDATE campanasverdes SET comuna = 5 WHERE comuna = 'Comuna 5';
UPDATE campanasverdes SET comuna = 6 WHERE comuna = 'Comuna 6';
UPDATE campanasverdes SET comuna = 7 WHERE comuna = 'Comuna 7';
UPDATE campanasverdes SET comuna = 8 WHERE comuna = 'Comuna 8';
UPDATE campanasverdes SET comuna = 9 WHERE comuna = 'Comuna 9';
UPDATE campanasverdes SET comuna = 10 WHERE comuna = 'Comuna 10';
UPDATE campanasverdes SET comuna = 11 WHERE comuna = 'Comuna 11';
UPDATE campanasverdes SET comuna = 12 WHERE comuna = 'Comuna 12';
UPDATE campanasverdes SET comuna = 13 WHERE comuna = 'Comuna 13';
UPDATE campanasverdes SET comuna = 14 WHERE comuna = 'Comuna 14';
UPDATE campanasverdes SET comuna = 15 WHERE comuna = 'Comuna 15';
-- Modificación de valores de ids de barrio.
UPDATE campanasverdes SET barrio = 1 WHERE barrio = 'Agronomia';
UPDATE campanasverdes SET barrio = 2 WHERE barrio = 'Almagro';
UPDATE campanasverdes SET barrio = 3 WHERE barrio = 'Balvanera';
UPDATE campanasverdes SET barrio = 4 WHERE barrio = 'Barracas';
UPDATE campanasverdes SET barrio = 5 WHERE barrio = 'Belgrano';
UPDATE campanasverdes SET barrio = 6 WHERE barrio = 'Boca';
UPDATE campanasverdes SET barrio = 7 WHERE barrio = 'Boedo';
UPDATE campanasverdes SET barrio = 8 WHERE barrio = 'Caballito';
UPDATE campanasverdes SET barrio = 9 WHERE barrio = 'Chacarita';
UPDATE campanasverdes SET barrio = 11 WHERE barrio = 'Colegiales';
UPDATE campanasverdes SET barrio = 12 WHERE barrio = 'Constitucion';
UPDATE campanasverdes SET barrio = 13 WHERE barrio = 'Flores';
UPDATE campanasverdes SET barrio = 14 WHERE barrio = 'Floresta';
UPDATE campanasverdes SET barrio = 15 WHERE barrio = 'Liniers';
UPDATE campanasverdes SET barrio = 16 WHERE barrio = 'Mataderos';
UPDATE campanasverdes SET barrio = 18 WHERE barrio = 'Monte Castro';
UPDATE campanasverdes SET barrio = 19 WHERE barrio = 'Nueva Pompeya';
UPDATE campanasverdes SET barrio = 20 WHERE barrio = 'Nu±ez';
UPDATE campanasverdes SET barrio = 21 WHERE barrio = 'Palermo';
UPDATE campanasverdes SET barrio = 22 WHERE barrio = 'Parque Avellaneda';
UPDATE campanasverdes SET barrio = 23 WHERE barrio = 'Parque Chacabuco';
UPDATE campanasverdes SET barrio = 24 WHERE barrio = 'Parque Chas';
UPDATE campanasverdes SET barrio = 25 WHERE barrio = 'Parque Patricios';
UPDATE campanasverdes SET barrio = 26 WHERE barrio = 'Paternal';
UPDATE campanasverdes SET barrio = 28 WHERE barrio = 'Recoleta';
UPDATE campanasverdes SET barrio = 31 WHERE barrio = 'San Cristobal';
UPDATE campanasverdes SET barrio = 32 WHERE barrio = 'San Nicolas';
UPDATE campanasverdes SET barrio = 33 WHERE barrio = 'San Telmo';
UPDATE campanasverdes SET barrio = 34 WHERE barrio = 'Velez Sarsfield';
UPDATE campanasverdes SET barrio = 35 WHERE barrio = 'Versalles';
UPDATE campanasverdes SET barrio = 36 WHERE barrio = 'Villa Crespo';
UPDATE campanasverdes SET barrio = 37 WHERE barrio = 'Villa Del Parque';
UPDATE campanasverdes SET barrio = 38 WHERE barrio = 'Villa Devoto';
UPDATE campanasverdes SET barrio = 39 WHERE barrio = 'Villa Gral. Mitre';
UPDATE campanasverdes SET barrio = 40 WHERE barrio = 'Villa Lugano';
UPDATE campanasverdes SET barrio = 41 WHERE barrio = 'Villa Luro';
UPDATE campanasverdes SET barrio = 42 WHERE barrio = 'Villa Ortuzar';
UPDATE campanasverdes SET barrio = 43 WHERE barrio = 'Villa Pueyrredon';
UPDATE campanasverdes SET barrio = 44 WHERE barrio = 'Villa Real';
UPDATE campanasverdes SET barrio = 45 WHERE barrio = 'Villa Riachuelo';
UPDATE campanasverdes SET barrio = 46 WHERE barrio = 'Villa Santa Rita';
UPDATE campanasverdes SET barrio = 47 WHERE barrio = 'Villa Soldati';
UPDATE campanasverdes SET barrio = 48 WHERE barrio = 'Villa Urquiza';
-- Corrección de valores de tipo de campana
UPDATE campanasverdes SET modelo = 'MECANICA' WHERE modelo = 'MEC?NICA';
-- Reemplazo de puntos por comas:
UPDATE campanasverdes SET nombre = REPLACE(nombre,'.',',');
UPDATE campanasverdes SET calle = REPLACE(calle,'.',',');
UPDATE campanasverdes SET direccion_base = REPLACE(direccion_base,'.',',');
UPDATE campanasverdes SET direccion_norm = REPLACE(direccion_norm,'.',',');
-- Cambio de nombre de columnas
ALTER TABLE baverde.campanasverdes CHANGE COLUMN comuna comuna_id double NULL;
ALTER TABLE baverde.campanasverdes CHANGE COLUMN barrio barrio_id double NULL;

/* ADAPTACIÓN DE TABLA: 'puntosverdes' */
-- Modificación de valores de ids de comuna.
UPDATE puntosverdes SET comuna = 1 WHERE comuna = 'Comuna 1';
UPDATE puntosverdes SET comuna = 2 WHERE comuna = 'Comuna 2';
UPDATE puntosverdes SET comuna = 3 WHERE comuna = 'Comuna 3';
UPDATE puntosverdes SET comuna = 4 WHERE comuna = 'Comuna 4';
UPDATE puntosverdes SET comuna = 5 WHERE comuna = 'Comuna 5';
UPDATE puntosverdes SET comuna = 6 WHERE comuna = 'Comuna 6';
UPDATE puntosverdes SET comuna = 7 WHERE comuna = 'Comuna 7';
UPDATE puntosverdes SET comuna = 8 WHERE comuna = 'Comuna 8';
UPDATE puntosverdes SET comuna = 9 WHERE comuna = 'Comuna 9';
UPDATE puntosverdes SET comuna = 10 WHERE comuna = 'Comuna 10';
UPDATE puntosverdes SET comuna = 11 WHERE comuna = 'Comuna 11';
UPDATE puntosverdes SET comuna = 12 WHERE comuna = 'Comuna 12';
UPDATE puntosverdes SET comuna = 13 WHERE comuna = 'Comuna 13';
UPDATE puntosverdes SET comuna = 14 WHERE comuna = 'Comuna 14';
UPDATE puntosverdes SET comuna = 15 WHERE comuna = 'Comuna 15';
UPDATE puntosverdes SET comuna = NULL WHERE comuna = '';
-- Modificación de valores de ids de barrio.
UPDATE puntosverdes SET barrio = 1 WHERE barrio = 'Agronomía';
UPDATE puntosverdes SET barrio = 2 WHERE barrio = 'Almagro';
UPDATE puntosverdes SET barrio = 3 WHERE barrio = 'Balvanera';
UPDATE puntosverdes SET barrio = 4 WHERE barrio = 'Barracas';
UPDATE puntosverdes SET barrio = 5 WHERE barrio = 'Belgrano';
UPDATE puntosverdes SET barrio = 6 WHERE barrio = 'Boca';
UPDATE puntosverdes SET barrio = 7 WHERE barrio = 'Boedo';
UPDATE puntosverdes SET barrio = 8 WHERE barrio = 'Caballito';
UPDATE puntosverdes SET barrio = 9 WHERE barrio = 'Chacarita';
UPDATE puntosverdes SET barrio = 11 WHERE barrio = 'Colegiales';
UPDATE puntosverdes SET barrio = 12 WHERE barrio = 'Constitucion';
UPDATE puntosverdes SET barrio = 13 WHERE barrio = 'Flores';
UPDATE puntosverdes SET barrio = 14 WHERE barrio = 'Floresta';
UPDATE puntosverdes SET barrio = 15 WHERE barrio = 'Liniers';
UPDATE puntosverdes SET barrio = 16 WHERE barrio = 'Mataderos';
UPDATE puntosverdes SET barrio = 17 WHERE barrio ='Monserrat';
UPDATE puntosverdes SET barrio = 18 WHERE barrio = 'Monte Castro';
UPDATE puntosverdes SET barrio = 19 WHERE barrio = 'Nueva Pompeya';
UPDATE puntosverdes SET barrio = 20 WHERE barrio = 'Nuñez';
UPDATE puntosverdes SET barrio = 21 WHERE barrio = 'Palermo';
UPDATE puntosverdes SET barrio = 22 WHERE barrio = 'Parque Avellaneda';
UPDATE puntosverdes SET barrio = 23 WHERE barrio = 'Parque Chacabuco';
UPDATE puntosverdes SET barrio = 24 WHERE barrio = 'Parque Chas';
UPDATE puntosverdes SET barrio = 25 WHERE barrio = 'Parque Patricios';
UPDATE puntosverdes SET barrio = 26 WHERE barrio = 'Paternal';
UPDATE puntosverdes SET barrio = 27 WHERE barrio = 'Puerto Madero';
UPDATE puntosverdes SET barrio = 28 WHERE barrio = 'Recoleta';
UPDATE puntosverdes SET barrio = 29 WHERE barrio = 'Retiro';
UPDATE puntosverdes SET barrio = 30 WHERE barrio = 'Saavedra';
UPDATE puntosverdes SET barrio = 31 WHERE barrio = 'San Cristobal';
UPDATE puntosverdes SET barrio = 32 WHERE barrio = 'San Nicolas';
UPDATE puntosverdes SET barrio = 33 WHERE barrio = 'San Telmo';
UPDATE puntosverdes SET barrio = 34 WHERE barrio = 'Velez Sarsfield';
UPDATE puntosverdes SET barrio = 35 WHERE barrio = 'Versalles';
UPDATE puntosverdes SET barrio = 36 WHERE barrio = 'Villa Crespo';
UPDATE puntosverdes SET barrio = 37 WHERE barrio = 'Villa Del Parque';
UPDATE puntosverdes SET barrio = 38 WHERE barrio = 'Villa Devoto';
UPDATE puntosverdes SET barrio = 39 WHERE barrio = 'Villa Gral. Mitre';
UPDATE puntosverdes SET barrio = 40 WHERE barrio = 'Villa Lugano';
UPDATE puntosverdes SET barrio = 42 WHERE barrio = 'Villa Ortuzar';
UPDATE puntosverdes SET barrio = 43 WHERE barrio = 'Villa Pueyrredon';
UPDATE puntosverdes SET barrio = 44 WHERE barrio = 'Villa Real';
UPDATE puntosverdes SET barrio = 45 WHERE barrio = 'Villa Riachuelo';
UPDATE puntosverdes SET barrio = 47 WHERE barrio = 'Villa Soldati';
UPDATE puntosverdes SET barrio = 48 WHERE barrio = 'Villa Urquiza';
UPDATE puntosverdes SET barrio = NULL WHERE barrio = '';
-- Modificación de valores de ids de cooperativa a cargo del punto verde.
UPDATE puntosverdes SET cooperativa = 1 WHERE cooperativa = 'Alamo';
UPDATE puntosverdes SET cooperativa = 2 WHERE cooperativa = 'Amanecer';
UPDATE puntosverdes SET cooperativa = 3 WHERE cooperativa = 'Cartonera Del Sur';
UPDATE puntosverdes SET cooperativa = 4 WHERE cooperativa = 'El Trebol';
UPDATE puntosverdes SET cooperativa = 5 WHERE cooperativa = 'Aleli';
UPDATE puntosverdes SET cooperativa = 6 WHERE cooperativa = 'Recolectores del Oeste';
UPDATE puntosverdes SET cooperativa = 7 WHERE cooperativa = 'Trabajo y Dignidad';
UPDATE puntosverdes SET cooperativa = 9 WHERE cooperativa = 'Baires Cero';
UPDATE puntosverdes SET cooperativa = 10 WHERE cooperativa = 'RUO';
UPDATE puntosverdes SET cooperativa = 12 WHERE cooperativa = 'Ceibo';
UPDATE puntosverdes SET cooperativa = 11 WHERE cooperativa = 'Madreselva';
UPDATE puntosverdes SET cooperativa = NULL WHERE cooperativa = '';
-- Cambio de nombre de columnas
ALTER TABLE baverde.puntosverdes CHANGE COLUMN comuna comuna_id double NULL;
ALTER TABLE baverde.puntosverdes CHANGE COLUMN barrio barrio_id double NULL;
ALTER TABLE baverde.puntosverdes CHANGE COLUMN cooperativa cooperativa_id double NULL;

/* ADAPTACIÓN DE TABLA: 'pesajepv' */
-- Modificación de valores de ids de comuna.
UPDATE pesajepv SET comuna = 1 WHERE comuna = 'Comuna 1';
UPDATE pesajepv SET comuna = 2 WHERE comuna = 'Comuna 2';
UPDATE pesajepv SET comuna = 3 WHERE comuna = 'Comuna 3';
UPDATE pesajepv SET comuna = 4 WHERE comuna = 'Comuna 4';
UPDATE pesajepv SET comuna = 5 WHERE comuna = 'Comuna 5';
UPDATE pesajepv SET comuna = 6 WHERE comuna = 'Comuna 6';
UPDATE pesajepv SET comuna = 7 WHERE comuna = 'Comuna 7';
UPDATE pesajepv SET comuna = 8 WHERE comuna = 'Comuna 8';
UPDATE pesajepv SET comuna = 9 WHERE comuna = 'Comuna 9';
UPDATE pesajepv SET comuna = 10 WHERE comuna = 'Comuna 10';
UPDATE pesajepv SET comuna = 11 WHERE comuna = 'Comuna 11';
UPDATE pesajepv SET comuna = 12 WHERE comuna = 'Comuna 12';
UPDATE pesajepv SET comuna = 13 WHERE comuna = 'Comuna 13';
UPDATE pesajepv SET comuna = 14 WHERE comuna = 'Comuna 14';
UPDATE pesajepv SET comuna = 15 WHERE comuna = 'Comuna 15';
-- Cambio de nombre de columnas
ALTER TABLE baverde.pesajepv CHANGE COLUMN comuna comuna_id double NULL;

/* ADAPTACIÓN DE TABLA: 'atencion' */
-- Modificación de valores de ids de comuna.
UPDATE atencion SET comuna = 1 WHERE comuna = 'COMUNA 1';
UPDATE atencion SET comuna = 2 WHERE comuna = 'COMUNA 2';
UPDATE atencion SET comuna = 3 WHERE comuna = 'COMUNA 3';
UPDATE atencion SET comuna = 4 WHERE comuna = 'COMUNA 4';
UPDATE atencion SET comuna = 5 WHERE comuna = 'COMUNA 5';
UPDATE atencion SET comuna = 6 WHERE comuna = 'COMUNA 6';
UPDATE atencion SET comuna = 7 WHERE comuna = 'COMUNA 7';
UPDATE atencion SET comuna = 8 WHERE comuna = 'COMUNA 8';
UPDATE atencion SET comuna = 9 WHERE comuna = 'COMUNA 9';
UPDATE atencion SET comuna = 10 WHERE comuna = 'COMUNA 10';
UPDATE atencion SET comuna = 11 WHERE comuna = 'COMUNA 11';
UPDATE atencion SET comuna = 12 WHERE comuna = 'COMUNA 12';
UPDATE atencion SET comuna = 13 WHERE comuna = 'COMUNA 13';
UPDATE atencion SET comuna = 14 WHERE comuna = 'COMUNA 14';
UPDATE atencion SET comuna = 15 WHERE comuna = 'COMUNA 15';
-- Modificación de valores de ids de barrio.
UPDATE atencion SET barrio = 1 WHERE barrio = 'AGRONOMÍA';
UPDATE atencion SET barrio = 2 WHERE barrio = 'ALMAGRO';
UPDATE atencion SET barrio = 3 WHERE barrio = 'BALVANERA';
UPDATE atencion SET barrio = 4 WHERE barrio = 'BARRACAS';
UPDATE atencion SET barrio = 5 WHERE barrio = 'BELGRANO';
UPDATE atencion SET barrio = 6 WHERE barrio = 'BOCA';
UPDATE atencion SET barrio = 7 WHERE barrio = 'BOEDO';
UPDATE atencion SET barrio = 8 WHERE barrio = 'CABALLITO';
UPDATE atencion SET barrio = 9 WHERE barrio = 'CHACARITA';
UPDATE atencion SET barrio = 10 WHERE barrio = 'COGHLAN';
UPDATE atencion SET barrio = 11 WHERE barrio = 'COLEGIALES';
UPDATE atencion SET barrio = 12 WHERE barrio = 'CONSTITUCIÓN';
UPDATE atencion SET barrio = 13 WHERE barrio = 'FLORES';
UPDATE atencion SET barrio = 14 WHERE barrio = 'FLORESTA';
UPDATE atencion SET barrio = 15 WHERE barrio = 'LINIERS';
UPDATE atencion SET barrio = 16 WHERE barrio = 'MATADEROS';
UPDATE atencion SET barrio = 17 WHERE barrio ='MONSERRAT';
UPDATE atencion SET barrio = 18 WHERE barrio = 'MONTE CASTRO';
UPDATE atencion SET barrio = 19 WHERE barrio = 'NUEVA POMPEYA';
UPDATE atencion SET barrio = 20 WHERE barrio = 'NUÑEZ';
UPDATE atencion SET barrio = 21 WHERE barrio = 'PALERMO';
UPDATE atencion SET barrio = 22 WHERE barrio = 'PARQUE AVELLANEDA';
UPDATE atencion SET barrio = 23 WHERE barrio = 'PARQUE CHACABUCO';
UPDATE atencion SET barrio = 24 WHERE barrio = 'PARQUE CHAS';
UPDATE atencion SET barrio = 25 WHERE barrio = 'PARQUE PATRICIOS';
UPDATE atencion SET barrio = 26 WHERE barrio = 'PATERNAL';
UPDATE atencion SET barrio = 27 WHERE barrio = 'PUERTO MADERO';
UPDATE atencion SET barrio = 28 WHERE barrio = 'RECOLETA';
UPDATE atencion SET barrio = 29 WHERE barrio = 'RETIRO';
UPDATE atencion SET barrio = 30 WHERE barrio = 'SAAVEDRA';
UPDATE atencion SET barrio = 31 WHERE barrio = 'SAN CRISTÓBAL';
UPDATE atencion SET barrio = 32 WHERE barrio = 'SAN NICOLÁS';
UPDATE atencion SET barrio = 33 WHERE barrio = 'SAN TELMO';
UPDATE atencion SET barrio = 34 WHERE barrio = 'VÉLEZ SARSFIELD';
UPDATE atencion SET barrio = 35 WHERE barrio = 'VERSALLES';
UPDATE atencion SET barrio = 36 WHERE barrio = 'VILLA CRESPO';
UPDATE atencion SET barrio = 37 WHERE barrio = 'VILLA DEL PARQUE';
UPDATE atencion SET barrio = 38 WHERE barrio = 'VILLA DEVOTO';
UPDATE atencion SET barrio = 39 WHERE barrio = 'VILLA GRAL. MITRE';
UPDATE atencion SET barrio = 40 WHERE barrio = 'VILLA LUGANO';
UPDATE atencion SET barrio = 41 WHERE barrio = 'VILLA LURO';
UPDATE atencion SET barrio = 42 WHERE barrio = 'VILLA ORTÚZAR';
UPDATE atencion SET barrio = 43 WHERE barrio = 'VILLA PUEYRREDÓN';
UPDATE atencion SET barrio = 44 WHERE barrio = 'VILLA REAL';
UPDATE atencion SET barrio = 45 WHERE barrio = 'VILLA RIACHUELO';
UPDATE atencion SET barrio = 46 WHERE barrio = 'VILLA SANTA RITA';
UPDATE atencion SET barrio = 47 WHERE barrio = 'VILLA SOLDATI';
UPDATE atencion SET barrio = 48 WHERE barrio = 'VILLA URQUIZA';
-- Cambio de nombre de columnas
ALTER TABLE baverde.atencion CHANGE COLUMN comuna comuna_id double NULL;
ALTER TABLE baverde.atencion CHANGE COLUMN barrio barrio_id double NULL;

/* ADAPTACIÓN DE TABLA: 'contenedores' */
-- Modificación de valores de id de empresa:
UPDATE contenedores SET empresa = 1 WHERE empresa = 'AESA';
UPDATE contenedores SET empresa = 2 WHERE empresa = 'CLIBA';
UPDATE contenedores SET empresa = 3 WHERE empresa = 'URBASUR';
UPDATE contenedores SET empresa = 4 WHERE empresa = 'ASHIRA';
UPDATE contenedores SET empresa = 6 WHERE empresa = 'NITTIDA';
UPDATE contenedores SET empresa = 7 WHERE empresa = 'SOLBAYRES';
-- Reemplazo de puntos por comas:
UPDATE contenedores SET punto_reco = REPLACE(punto_reco,'.',',');
UPDATE contenedores SET rutas = REPLACE(rutas,'.',',');
UPDATE contenedores SET direccion = REPLACE(direccion,'.',',');
UPDATE contenedores SET calle = REPLACE(calle,'.',',');
-- Cambio de nombre de columnas
ALTER TABLE baverde.contenedores CHANGE COLUMN empresa empresa_id double NULL;

/* CREACIÓN FOREIGN KEYS */
-- Creación de Foreign Keys Tabla: centros
ALTER TABLE centros ADD (
	CONSTRAINT FK_centros_cooperativas_cooperativa_id FOREIGN KEY (cooperativa_id) REFERENCES baverde.cooperativas(id)
	,CONSTRAINT FK_centros_comunas_comuna_id FOREIGN KEY (comuna_id) REFERENCES baverde.comunas(id)
	,CONSTRAINT FK_centros_barrios_barrio_id FOREIGN KEY (barrio_id) REFERENCES baverde.barrios(id)
);

-- Creación de Foreign Keys Tabla: cooperativas
ALTER TABLE cooperativas ADD (
	CONSTRAINT FK_cooperativas_comunas_comuna_id FOREIGN KEY (comuna_id) REFERENCES baverde.comunas(id)
	,CONSTRAINT FK_cooperativas_barrios_barrio_id FOREIGN KEY (barrio_id) REFERENCES baverde.barrios(id)
);

-- Creación de Foreign Keys Tabla: puntosverdes
ALTER TABLE puntosverdes ADD (
	CONSTRAINT FK_puntosverdes_cooperativas_cooperativa_id FOREIGN KEY (cooperativa_id) REFERENCES baverde.cooperativas(id)
	,CONSTRAINT FK_puntosverdes_comunas_comuna_id FOREIGN KEY (comuna_id) REFERENCES baverde.comunas(id)
	,CONSTRAINT FK_puntosverdes_barrios_barrio_id FOREIGN KEY (barrio_id) REFERENCES baverde.barrios(id)
);

-- Creación de Foreign Keys Tabla: pesajepv
ALTER TABLE pesajepv ADD (
	CONSTRAINT FK_pesajepv_puntosverdes_comuna_id FOREIGN KEY (comuna_id) REFERENCES baverde.puntosverdes(comuna_id)
	,CONSTRAINT FK_pesajepv_comunas_comuna_id FOREIGN KEY (comuna_id) REFERENCES baverde.comunas(id)
);

-- Creación de Foreign Keys Tabla: campanasverdes
ALTER TABLE campanasverdes ADD (
	CONSTRAINT FK_campanasverdes_comunas_comuna_id FOREIGN KEY (comuna_id) REFERENCES baverde.comunas(id)
	,CONSTRAINT FK_campanasverdes_barrios_barrio_id FOREIGN KEY (barrio_id) REFERENCES baverde.barrios(id)
);

-- Creación de Foreign Keys Tabla: demografia
ALTER TABLE demografia ADD (
	CONSTRAINT FK_demografia_comunas_comuna_id FOREIGN KEY (comuna_id) REFERENCES baverde.comunas(id)
);

-- Creación de Foreign Keys Tabla: barrios
ALTER TABLE barrios ADD (
	CONSTRAINT FK_barrios_comunas_comuna_id FOREIGN KEY (comuna_id) REFERENCES baverde.comunas(id)
);

-- Creación de Foreign Keys Tabla: comunas
ALTER TABLE comunas ADD (
	CONSTRAINT FK_comunas_zonasrecoleccion_zona_id FOREIGN KEY (zona_id) REFERENCES baverde.zonasrecoleccion(id)
);

-- Creación de Foreign Keys Tabla: zonasrecoleccion
ALTER TABLE zonasrecoleccion ADD (
	CONSTRAINT FK_zonasrecoleccion_entesrecoleccion_empresa_id FOREIGN KEY (empresa_id) REFERENCES baverde.entesrecoleccion(id)
);

-- Creación de Foreign Keys Tabla: contenedores
ALTER TABLE contenedores ADD (
	CONSTRAINT FK_contenedores_entesrecoleccion_empresa_id FOREIGN KEY (empresa_id) REFERENCES baverde.entesrecoleccion(id)
);

-- Creación de Foreign Keys Tabla: atencion
ALTER TABLE atencion ADD (
	CONSTRAINT FK_atencion_comunas_comuna_id FOREIGN KEY (comuna_id) REFERENCES baverde.comunas(id)
    ,CONSTRAINT FK_atencion_barrios_barrio_id FOREIGN KEY (barrio_id) REFERENCES baverde.barrios(id)
);

-- Creación de Foreign Keys Tabla: recoleccionresiduosprop
ALTER TABLE recoleccionresiduosprop ADD (
	CONSTRAINT FK_recoleccionresiduosprop_comunas_comuna_id FOREIGN KEY (comuna_id) REFERENCES baverde.comunas(id)
);
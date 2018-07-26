


CREATE TABLE agresor (
    id                     INTEGER NOT NULL,
    nombre_agresor         VARCHAR2(50),
    apellidos_agresor      VARCHAR2(50),
    edad_agresor           INTEGER,
    nacionalidad_agresor   VARCHAR2(50),
    ocupacion_agresor      VARCHAR2(50),
    relacion_victima       VARCHAR2(400),
    tiempo_relacion        VARCHAR2(200),
    situacion_agresor      VARCHAR2(200),
    evento_inmediato       VARCHAR2(100)
);

ALTER TABLE agresor ADD CONSTRAINT agresor_pk PRIMARY KEY ( id );

CREATE TABLE "Date" (
    id            INTEGER NOT NULL,
    anio          INTEGER,
    mes           INTEGER,
    dia           INTEGER,
    hora_muerte   VARCHAR2(50) 

);

ALTER TABLE "Date" ADD CONSTRAINT date_pk PRIMARY KEY ( id );

CREATE TABLE departamento (
    id             INTEGER NOT NULL,
    departamento   VARCHAR2(50) NOT NULL,
    pais_id        INTEGER NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( id );

CREATE TABLE direccion (
    id             INTEGER NOT NULL,
    barrio         VARCHAR2(200) 

   ,
    municipio_id   INTEGER NOT NULL
);

ALTER TABLE direccion ADD CONSTRAINT barrio_pk PRIMARY KEY ( id );

CREATE TABLE femicidio (
    id                INTEGER NOT NULL,
    lugar_femicidio   VARCHAR2(100),
    fecha_femicidio   DATE,
    causa_muerte      VARCHAR2(300),
    hora_muerte       VARCHAR2(30),
    tipo_arma_usada   VARCHAR2(100) 
 
   ,
    agresion_previa   VARCHAR2(300),
    estado_caso       VARCHAR2(200),
    sentencia         VARCHAR2(300),
    barrio_id         INTEGER NOT NULL,
    date_id           INTEGER NOT NULL
);

ALTER TABLE femicidio ADD CONSTRAINT femicidio_pk PRIMARY KEY ( id );

CREATE TABLE femicidio_has_agresor (
    agresor_id     INTEGER NOT NULL,
    femicidio_id   INTEGER NOT NULL
);

ALTER TABLE femicidio_has_agresor ADD CONSTRAINT relation_5_pk PRIMARY KEY ( agresor_id,
                                                                             femicidio_id );

CREATE TABLE femicidio_has_source (
    femicidio_id   INTEGER NOT NULL,
    source_id      INTEGER NOT NULL
);

ALTER TABLE femicidio_has_source ADD CONSTRAINT relation_8_pk PRIMARY KEY ( femicidio_id,
                                                                            source_id );

CREATE TABLE femicidio_has_testigos (
    femicidio_id   INTEGER NOT NULL,
    testigos_id    INTEGER NOT NULL
);

ALTER TABLE femicidio_has_testigos ADD CONSTRAINT relation_7_pk PRIMARY KEY ( femicidio_id,
                                                                              testigos_id );

CREATE TABLE femicidio_has_victima (
    femicidio_id   INTEGER NOT NULL,
    victima_id     INTEGER NOT NULL
);

ALTER TABLE femicidio_has_victima ADD CONSTRAINT relation_6_pk PRIMARY KEY ( femicidio_id,
                                                                             victima_id );

CREATE TABLE municipio (
    id                INTEGER NOT NULL,
    municipio         VARCHAR2(50),
    departamento_id   INTEGER NOT NULL
);

ALTER TABLE municipio ADD CONSTRAINT municipio_pk PRIMARY KEY ( id );

CREATE TABLE pais (
    id     INTEGER NOT NULL,
    pais   VARCHAR2(30) NOT NULL
);

ALTER TABLE pais ADD CONSTRAINT pais_pk PRIMARY KEY ( id );

CREATE TABLE source (
    id     INTEGER NOT NULL,
    urls   VARCHAR2(300)
);

ALTER TABLE source ADD CONSTRAINT source_pk PRIMARY KEY ( id );

CREATE TABLE testigos (
    id         INTEGER NOT NULL,
    testigos   VARCHAR2(500)
);

ALTER TABLE testigos ADD CONSTRAINT testigos_pk PRIMARY KEY ( id );

CREATE TABLE victima (
    id                     INTEGER NOT NULL,
    nombre_victima         VARCHAR2(50),
    apellidos_victima      VARCHAR2(50),
    edad_victima           INTEGER,
    nacionalidad_victima   VARCHAR2(50),
    ocupacion_victima      VARCHAR2(50)
);

ALTER TABLE victima ADD CONSTRAINT victima_pk PRIMARY KEY ( id );

ALTER TABLE direccion
    ADD CONSTRAINT barrio_municipio_fk FOREIGN KEY ( municipio_id )
        REFERENCES municipio ( id );

ALTER TABLE departamento
    ADD CONSTRAINT departamento_pais_fk FOREIGN KEY ( pais_id )
        REFERENCES pais ( id );

ALTER TABLE femicidio
    ADD CONSTRAINT femicidio_barrio_fk FOREIGN KEY ( barrio_id )
        REFERENCES direccion ( id );

ALTER TABLE femicidio
    ADD CONSTRAINT femicidio_date_fk FOREIGN KEY ( date_id )
        REFERENCES "Date" ( id );

ALTER TABLE municipio
    ADD CONSTRAINT municipio_departamento_fk FOREIGN KEY ( departamento_id )
        REFERENCES departamento ( id );

ALTER TABLE femicidio_has_agresor
    ADD CONSTRAINT relation_5_agresor_fk FOREIGN KEY ( agresor_id )
        REFERENCES agresor ( id );

ALTER TABLE femicidio_has_agresor
    ADD CONSTRAINT relation_5_femicidio_fk FOREIGN KEY ( femicidio_id )
        REFERENCES femicidio ( id );

ALTER TABLE femicidio_has_victima
    ADD CONSTRAINT relation_6_femicidio_fk FOREIGN KEY ( femicidio_id )
        REFERENCES femicidio ( id );

ALTER TABLE femicidio_has_victima
    ADD CONSTRAINT relation_6_victima_fk FOREIGN KEY ( victima_id )
        REFERENCES victima ( id );

ALTER TABLE femicidio_has_testigos
    ADD CONSTRAINT relation_7_femicidio_fk FOREIGN KEY ( femicidio_id )
        REFERENCES femicidio ( id );

ALTER TABLE femicidio_has_testigos
    ADD CONSTRAINT relation_7_testigos_fk FOREIGN KEY ( testigos_id )
        REFERENCES testigos ( id );

ALTER TABLE femicidio_has_source
    ADD CONSTRAINT relation_8_femicidio_fk FOREIGN KEY ( femicidio_id )
        REFERENCES femicidio ( id );

ALTER TABLE femicidio_has_source
    ADD CONSTRAINT relation_8_source_fk FOREIGN KEY ( source_id )
        REFERENCES source ( id );



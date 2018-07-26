CREATE USER USUARIO_PRIMERO IDENTIFIED BY 0000;

CREATE ROLE ROL_NUEVO;
GRANT SELECT, INSERT, UPDATE, DELETE ON Source TO ROL_NUEVO;
GRANT ROL_NUEVO TO USUARIO_PRIMERO;

CREATE USER SEGUNDO_ROL IDENTIFIED BY 111111
DEFAULT TABLESPACE "SYSTEM";
--Otorogar permisos
GRANT "CONNECT" TO SEGUNDO_ROL;
GRANT "RESOURCE" TO SEGUNDO_ROL;


CREATE VIEW VISTA_uno
AS SELECT nombre_agresor, apellidos_agresor, edad_agresor
FROM Agresor;

SELECT  * FROM FEMICIDIO_HAS_AGRESOR;


 	
CREATE VIEW VISTA_dos
AS SELECT FE.LUGAR_FEMICIDIO,FE.FECHA_FEMICIDIO, AG.NOMBRE_AGRESOR,AG.APELLIDOS_AGRESOR, AG.EDAD_AGRESOR, VI.NOMBRE_VICTIMA,VI.APELLIDOS_VICTIMA 
FROM FEMICIDIO FE, FEMICIDIO_HAS_AGRESOR AHG, FEMICIDIO_HAS_VICTIMA FHV, VICTIMA VI, AGRESOR AG
WHERE FHV.VICTIMA_ID = VI.ID AND AHG.AGRESOR_ID = AG.ID;
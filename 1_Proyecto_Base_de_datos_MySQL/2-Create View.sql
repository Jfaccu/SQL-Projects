
USE RESTAURANT_BD;


CREATE OR REPLACE VIEW VW_CANT_COMPRAS_CLIENT
AS (
    SELECT 
		CONCAT(nombre,' ', apellido) AS CLIENTE,
		COUNT( O.id_C ) AS CANTIDAD_COMPRAS
	FROM ORDENES AS O
    LEFT JOIN CLIENTES AS C
			ON (O.id_C=C.id_C)
    GROUP BY O.ID_C
    )
    ;
    
    CREATE OR REPLACE VIEW VW_CLIENTE_GASTO_TOTAL
AS (
	SELECT
			CONCAT(nombre,' ', apellido) AS CLIENTE,
			SUM( O.monto_total) AS SUMA_TOTAL
	FROM ORDENES AS O
    LEFT JOIN CLIENTES AS C
			ON (O.id_C=C.id_C)
    GROUP BY CONCAT(nombre,' ', apellido) 
	HAVING suma_total >=  2500
    ORDER BY SUMA_TOTAL DESC
    )
    ;
    
    CREATE OR REPLACE VIEW VW_RECAUDACION_TP
AS (
	SELECT
			SUM(monto) AS TOTAL,
            Nombre_Tipo AS PEDIDO
	FROM Facturacion AS F
	LEFT JOIN Tipo_Pedido AS TP
			ON F.id_TP=TP.id_TP
	GROUP BY pedido
    ORDER BY total DESC
    )
    ;
    
    
 CREATE OR REPLACE VIEW VW_FACTURACION_DIAS
AS (
	 SELECT 
			date_format(Fecha_hora, "%y-%m-%d") AS FECHA,
			SUM(monto_total) AS TOTAL_REC
	 FROM ordenes
	 GROUP BY fecha
     ORDER BY fecha ASC
     )
;

   CREATE OR REPLACE VIEW VW_EMPLEADO_SEC
AS (
	    SELECT 
		CONCAT(nombre,' ', apellido) AS EMPLEADO,
        D.Sector AS SECTOR
	FROM Empleados E
  JOIN departamentos D
		ON E.id_D=D.id_D
	GROUP BY Empleado
    )
    ;




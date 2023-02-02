
SELECT * FROM project1.dbo.Data1;
SELECT * FROM project1.dbo.Data2;

--1. Number of rows our dataset (Observamos cuantos registos hay en la tabla)

SELECT COUNT(*) FROM project1..Data1;
SELECT COUNT(*) FROM project1..Data2;


--2. Dataset for jharkhand and bihar (Filtramos los datos de dos Estados especificos)

SELECT * FROM project1..Data1
WHERE State in ('jharkhand', 'bihar');

--3. Population of India (poblacion total en india)

SELECT SUM (population)
FROM project1..Data2
;

--4. AVG Growth (promiedio de crecimeinto total porcentual )

SELECT AVG(growth) *100 AS Avg_Growth 
FROM project1..Data1;

--5. AVG Sex Ratio (Promeido de proporcion de sexos)

SELECT  State,
		ROUND(AVG(Sex_Ratio),0) AS Avg_sex_Ratio
FROM project1..Data1
GROUP BY State
ORDER BY Avg_sex_Ratio
DESC;

--6. AVG Literacy rate (Tasa promedio de alfabetizacion en forma de procentaje mayores al 90%)
 
 SELECT  State,
		ROUND(AVG(Literacy),0) AS Avg_literacy
FROM project1..Data1
GROUP BY State
--HAVING ROUND(AVG(Literacy),0) > 90
ORDER BY Avg_literacy
DESC
;

--7. TOP 3 State showing highest growht ration (Los 3 Estados que muestran la tasa de porcentaje mas alta de crecimiento poblacional)

SELECT TOP 3 State, 
AVG(growth) *100 AS Avg_Growth 
FROM project1..Data1
GROUP BY State
ORDER BY Avg_Growth
DESC 
;


--8. Top and Bottom 3 States in literacy state (Los 3 estados superiores e inferiores en la tasa de alfabetizaciion agrupados en una tabla temporal)

DROP TABLE IF EXISTS #Topstate
CREATE TABLE #Topstates
   (State nvarchar(255),
    topstate float
   )

Insert into #Topstates
 SELECT  State,
ROUND(AVG(Literacy),0) AS Avg_literacy
FROM project1..Data1
GROUP BY State
ORDER BY Avg_literacy
DESC

SELECT * FROM #Topstates
ORDER BY #Topstates.topstate
DESC;

--

DROP TABLE IF EXISTS #Bottomstate
CREATE TABLE #Bottomstates
   (State nvarchar(255),
    Bottomstate float
   )

Insert into #Bottomstates
 SELECT  State,
ROUND(AVG(Literacy),0) AS Avg_literacy
FROM project1..Data1
GROUP BY State
ORDER BY Avg_literacy
DESC

SELECT * FROM #Bottomstates
ORDER BY #Bottomstates.Bottomstate
ASC;

/* REALIZAMOS LA UNION DE LOS DATOS EN UNA SOLA TABLA.
 Topeamos los 3 estados con el porcentaje de alfabetizacion mas alta y los 3 estados con la alfabetizacion mas baja */

SELECT * FROM (
SELECT TOP 3* FROM #Topstates
ORDER BY #Topstates.topstate DESC) A
UNION 
SELECT * FROM (
SELECT TOP 3 * FROM #Bottomstates
ORDER BY #Bottomstates.Bottomstate ASC) B
;

--9. States starting with letter a (Buscamos los estados que comiencen solo con la letra A)

SELECT Distinct(State)
FROM project1..Data1
WHERE State like 'A%'

--10. Joining both table (Union de tablas para calcular la cantidad poblacion de hombres y mujeres que hay por estado)

SELECT
	d.State,
	SUM(Males) AS Total_Males,
	SUM(Females) AS Total_Females
	FROM
		(
SELECT 
	c.District,
	c.State,
	ROUND(c.population/(c.Sex_ratio+1),0) AS Males,
	ROUND((c.population*c.Sex_ratio)/(c.sex_ratio+1),0) AS Females
	FROM
		(
SELECT 
	a.District,
	a.State,
	a.Sex_ratio/1000 sex_ratio,
	b.Population
	FROM project1..Data1 a
INNER JOIN project1..Data2 b ON  a.district=b.district) c ) d
GROUP BY state


--11. Total Literacy Rate (Tasa Total de Alfabetizacion y de Analfabetización)

SELECT
	h.State,
	SUM(h.Literate_People) AS Total_literate,
	SUM(h.iliterate_People) AS Total_iliterate
	FROM(
SELECT	
	g.district,
	g.state,
	ROUND(g.literacy_ratio*g.Population,0) Literate_People,
	ROUND((1-g.literacy_ratio)*g.Population,0) iliterate_People
	FROM(
SELECT 
	a.District,
	a.State,
	a.literacy/100 literacy_ratio,
	b.Population
	FROM project1..Data1 a
	INNER JOIN project1..Data2 b ON  a.district=b.district
	    ) g ) h
GROUP BY state

--12. ¿Cual era la poblacion del censo anterior? 
--12. Population in Previous Cense (Calculo para obtener el censo de la poblacion anterior)

SELECT
	SUM(m.previous_census_population) previous_census_population,
	SUM(m.current_population) current_population
	FROM(
SELECT 
	e.State,
	SUM(e.previous_census_population) previous_census_population,
	SUM(e.current_population) current_population
	FROM(
SELECT
	d.District,
	d.State,
	ROUND(d.Population/(1+d.growth),0) previous_census_population,
	d.population current_population
	FROM(
SELECT
	a.District,
	a.State,
	a.Growth,
	b.Population
	FROM project1..Data1 a
	INNER JOIN project1..Data2 b ON  a.district=b.district
	) d ) e
GROUP BY e.State)m

--13. POPULATION VS AREA (Al ser Areas en Km2 el limite del area es limitado, la poblacion aumenta y esto hace que el Area se reduzca)
--13. Calculamos el area previo al censo con respecto al area del censo actual

SELECT 	   o.total_area/o.previous_census_population AS previous_census_population_vs_area,
	   o.total_area/o.current_population AS current_population_vs_area
	   FROM(
SELECT q.*, r.total_area FROM(
SELECT '1' as keyy,n.* FROM(
SELECT
	SUM(m.previous_census_population) previous_census_population,
	SUM(m.current_population) current_population
	FROM(
SELECT 
	e.State,
	SUM(e.previous_census_population) previous_census_population,
	SUM(e.current_population) current_population
	FROM(
SELECT
	d.District,
	d.State,
	ROUND(d.Population/(1+d.growth),0) previous_census_population,
	d.population current_population
	FROM(
SELECT
	a.District,
	a.State,
	a.Growth,
	b.Population
	FROM project1..Data1 a
	INNER JOIN project1..Data2 b ON  a.district=b.district
	) d ) e
GROUP BY e.State ) m) n) q
	INNER JOIN
(SELECT '1' as keyy,z.* FROM	(SELECT SUM(area_km2) total_area from project1..Data2) z) r on q.keyy=r.keyy) o


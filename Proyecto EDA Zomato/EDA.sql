

--1- #¿Cual es la cantidad total que gastó cada cliente en Zomato?--
SELECT a.userid,
	  sum(b.price) as total_price
FROM sales a
inner join product b on a.product_id=b.product_id
GROUP BY userid


--2- #¿Cuantos dias visito el sitio web de zomato cada cliente?
SELECT userid,
	   Count(distinct created_date) distinct_days
FROM sales
GROUP BY userid


--3- #¿ Cual fue el primer producto comprado por el cliente? --
SELECT * FROM (
SELECT *, RANK() over(partition by userid order by created_date) rnk
FROM sales ) a where rnk = 1


--4- #¿Cual es el articulo mas comprado en el menu y cuantas veces lo comprar todos los clientes?
SELECT userid, COUNT(product_id)as ctn FROM sales where product_id =
(SELECT top 1 product_id
FROM sales
GROUP BY product_id
ORDER BY COUNT(product_id) DESC)
 GROUP BY userid


 --5- #¿Qué elemento fue el mas popular para cada uno de los clientes? --
SELECT * from 
(SELECT *,rank() over(partition by userid order by cantidad desc) rnk
FROM
(SELECT userid,
		product_id,
		COUNT(product_id) cantidad
FROM sales
GROUP BY userid, product_id) a) b 
WHERE rnk = 1


--6- #¿Qué articulo compro primero el cliente despues de convertirse en miembro dorado?
SELECT d.* FROM 
(SELECT C.*, 
	rank() over(partition by userid order by created_date) rnk 
FROM
(SELECT a.userid,
	   a.created_date,
	   a.product_id,
	   b.gold_signup_date
FROM sales a
inner join goldusers_signup b on 
a.userid=b.userid and created_date >= gold_signup_date) c) d 
WHERE rnk = 1


--7- #¿Qué articulo compro el cliente justo antes de que se convirtiera en miembro?
SELECT d.* FROM 
(SELECT C.*, 
	rank() over(partition by userid order by created_date DESC) rnk 
FROM
(SELECT a.userid,
	   a.created_date,
	   a.product_id,
	   b.gold_signup_date
FROM sales a
inner join goldusers_signup b on 
a.userid=b.userid and created_date <= gold_signup_date) c) d WHERE rnk = 1


--8- #¿Cuál es el total de pedidos y el monto gastado por cada miembro antes de convertirse en miembro?

SELECT userid, 
	   count(created_date) as order_puchased, 
	   sum(price) as total_amt_spent
FROM 
(SELECT c.*, d.price from 
(SELECT a.userid,
	   a.created_date,
	   a.product_id,
	   b.gold_signup_date
FROM sales a
inner join goldusers_signup b on 
a.userid=b.userid and created_date <= gold_signup_date)c 
inner join product d on c.product_id=d.product_id) d
GROUP BY userid

 /*--9- #Si la compra de cada producto genera puntos ,por ejemplo, 5 rupias = 2 puntos zomato 
y cada producto tiene diferentes puntos de compra, por ejemplo, 
para productos p1 5 rupias = 1 punto zomato, 
para productos p2 10 rupias = 5 puntos zomato,
para productos p3 5 rupias = 1 punto zomato.*/

--9.1- Calcular puntos totales recopilados por cada uno de los clientes y su valor de reembolso --
SELECT userid, 
SUM(total_point_z) as total_points_earned,
SUM(total_point_z)*2.5 as total_money_earned
FROM
(SELECT e.*, total_amount/point_zomato as total_point_z 
FROM
(SELECT d.*, CASE WHEN product_id = 1 THEN 5 
WHEN product_id = 2 THEN 2 
WHEN product_id = 3 THEN 5 
ELSE 0 
END AS point_zomato 
FROM
(SELECT c.userid,
	   c.product_id,
	   SUM(price) total_amount
FROM
(SELECT a.*, b.price
FROM sales a 
inner join product b on a.product_id=b.product_id) c 
GROUP BY userid,product_id
) d ) e ) f
GROUP BY userid

--9.2- Calculo de puntos totales de zomato para cada producto que se les ha otorgado
SELECT product_id, 
SUM(total_point_z) as total_points_earned
FROM
(SELECT e.*, total_amount/point_zomato as total_point_z 
FROM
(SELECT d.*, CASE WHEN product_id = 1 THEN 5 
WHEN product_id = 2 THEN 2 
WHEN product_id = 3 THEN 5 
ELSE 0 
END AS point_zomato 
FROM
(SELECT c.userid,
	    c.product_id,
	    SUM(price) total_amount
FROM
(SELECT a.*, b.price
FROM sales a 
inner join product b on a.product_id=b.product_id) c 
GROUP BY userid,product_id
) d ) e ) f
GROUP BY product_id


/*--10- En el primer año, un cliente se une al programa de oro (incluida su fecha de ingreso), 
independientemente de lo que haya comprado el cliente, 
ganaron 5 puntos zomato por cada 10 rupias gastados, 
¿quién gano más?, USERS| 1 o 3 -> Usuarios con miembro dorado, 
y cuál fue su ganancia de puntos en su primera ¿año? */
--Por cada rupia gastada -> obtencion de 2 puntos zomato independientemente del producto--
--Ganancias de los usuarios de la membresia dorada en su primer año--

SELECT c.*, d.price,
			d.price*0.5 as total_point_earched
FROM
(SELECT a.userid,
	   a.created_date,
	   a.product_id,
	   b.gold_signup_date
FROM sales a
inner join goldusers_signup b on 
a.userid=b.userid 
and created_date>=gold_signup_date 
and created_date<=DATEADD(YEAR, 1,gold_signup_date) ) c
inner join product d on c.product_id=d.product_id


--11- Clasificar todas las transacciones del cliente
SELECT * FROM sales

SELECT *, RANK() over(partition by userid ORDER BY created_date) rnk from sales

/*--12- Clasificar todas las transacciones para cada miembro siempre que sea 
un miembro dorado de zomato, para cada transacción que no sea miembro dorado 
marque como NA.*/

SELECT d.*, 
CASE WHEN rnk = 0 THEN 'na' 
ELSE 
rnk END AS rnkk 
FROM
(SELECT c.*, 
CAST((CASE WHEN gold_signup_date IS NULL THEN 0 ELSE
RANK() OVER(PARTITION BY userid ORDER BY gold_signup_date DESC)
END) AS VARCHAR) AS rnk 
FROM
(SELECT a.userid,
	   a.created_date,
	   a.product_id,
	   b.gold_signup_date
FROM sales a
left join goldusers_signup b on 
a.userid=b.userid and created_date >= gold_signup_date)c )d

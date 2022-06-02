/*
 * Como parte de la modernización de nuestras video rental stores, vamos a automatizar la recepción y entrega de discos con robots.
 * Parte de la infraestructura es diseñar contenedores cilíndricos giratorios para facilitar la colocación y extracción de discos por brazos automatizados. 
 * 
 * Medidas:
 		-Cada cajita de Blu-Ray mide 20cm x 13.5cm x 1.5cm, y para que el brazo pueda manipular adecuadamente cada cajita, debe estar contenida dentro de un arnés 
 		que cambia las medidas a 30cm x 21cm x 8cm para un espacio total de 5040 centímetros cúbicos y un peso de 500 gr por película.
 * 
 * Necesidad:
		-Formular la medida de dichos cilindros de manera tal que quepan todas las copias de los Blu-Rays de cada uno de nuestros stores. 
 * 
 * Limitantes:
 		-Las medidas deben ser estándar y en cada store pueden haber más de 1 de estos cilindros. 
		-Cada cilindro aguanta un peso máximo de 50kg como máximo.
 */


--Cantidad de películas por tienda
select i.store_id as Tienda, count(i.inventory_id) as Numero_Ejemplares
	from inventory i
	group by i.store_id;
	
--Gramos totales de películas por tienda 
select i.store_id as Tienda, 500*count(i.inventory_id) as Gramos_Ejemplares
	from inventory i
	group by i.store_id;
	
--Cantidad de cilindros necesarios por tienda 
select i.store_id as Tienda, ceiling ((500*count(i.inventory_id))/50000) as Cant_Cilindros
	from inventory i
	group by i.store_id;

--Cantidad de ejemplares por cilindro (100)
select 50000/500 as ejemplares_por_cilindro;
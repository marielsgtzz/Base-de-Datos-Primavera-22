-- 1.Cuál es el promedio, en formato human-readable, de tiempo entre cada pago por cliente de la BD Sakila?
select cliente, avg(intervalos) as promedio from (
	select c.customer_id as clienteId, (c.first_name || ' ' || c.last_name) as cliente, 
	p.payment_date - lag(p.payment_date) over (partition by c.customer_id order by p.payment_date) as intervalos
	from customer c join payment p using (customer_id)
) p group by cliente 
--



select date_part('hour', '2001-02-16 20:38:40'::timestamp)



select count(r.rental_id) as rentas, (c.first_name || ' ' || c.last_name) as cliente from rental r
	join customer c using (customer_id)
	join inventory i using (inventory_id)
	join film f using (film_id)
where f.rating = 'NC-17'
group by 2 order by 1 desc limit 1;
-- 2.Sigue una distribución normal?



-- 3.Qué tanto difiere ese promedio del tiempo entre rentas por cliente?
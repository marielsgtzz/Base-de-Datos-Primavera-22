with promedio_pagos as (
	select cliente, avg(intervalos) as promedio from (
		select c.customer_id as clienteId, (c.first_name || ' ' || c.last_name) as cliente, 
		p.payment_date - lag(p.payment_date) over (partition by c.customer_id order by p.payment_date) as intervalos
		from customer c join payment p using (customer_id)
	) p group by cliente 
)


-- 1.Cuál es el promedio, en formato human-readable, de tiempo entre cada pago por cliente de la BD Sakila?
select cliente, promedio from promedio_pagos;

select count(r.rental_id) as rentas, (c.first_name || ' ' || c.last_name) as cliente from rental r
	join customer c using (customer_id)
	join inventory i using (inventory_id)
	join film f using (film_id)
where f.rating = 'NC-17'
group by 2 order by 1 desc limit 1;

-- 2.Sigue una distribución normal?
CREATE OR REPLACE FUNCTION histogram(table_name_or_subquery text, column_name text)
RETURNS TABLE(bucket int, "range" numrange, freq bigint, bar text)
AS $func$
BEGIN
RETURN QUERY EXECUTE format('
  WITH
  source AS (
    SELECT * FROM %s
  ),
  min_max AS (
    SELECT min(%s) AS min, max(%s) AS max FROM source
  ),
  histogram AS (
    SELECT
      width_bucket(%s, min_max.min, min_max.max, 20) AS bucket,
      numrange(min(%s)::numeric, max(%s)::numeric, ''[]'') AS "range",
      count(%s) AS freq
    FROM source, min_max
    WHERE %s IS NOT NULL
    GROUP BY bucket
    ORDER BY bucket
  )
  SELECT
    bucket,
    "range",
    freq::bigint,
    repeat(''*'', (freq::float / (max(freq) over() + 1) * 15)::int) AS bar
  FROM histogram',
  table_name_or_subquery,
  column_name,
  column_name,
  column_name,
  column_name,
  column_name,
  column_name,
  column_name
  );
end
$func$ LANGUAGE plpgsql;

select *
from histogram('(select extract(epoch from (max(p.payment_date) - min(p.payment_date))/(count(*)) ) as tiempo_promedio
from payment p 
group by customer_id
order by tiempo_promedio) as x', 'tiempo_promedio');



--Qué tanto difiere ese promedio del tiempo entre rentas por cliente?
set intervalstyle= 'postgres_verbose';

select c.first_name||' '||c.last_name  as customer, (max(r.rental_date) - min(r.rental_date))/(count(*)) as tiempo_promedio_rentas,  (max(p.payment_date) - min(p.payment_date))/(count(*)) as tiempo_promedio_pagos, (max(r.rental_date) - min(r.rental_date))/(count(*)) - (max(p.payment_date) - min(p.payment_date))/(count(*)) as diferencia
from payment p join customer c using(customer_id) join rental r using(customer_id)
group by  customer_id 
order by tiempo_promedio_rentas;


-- 3.Qué tanto difiere ese promedio del tiempo entre rentas por cliente?
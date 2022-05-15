--1. Cómo obtenemos todos los nombres y correos de nuestros clientes canadienses para una campaña?
select (c.first_name || ' ' || c.last_name) as Nombre, c.email as Correo from customer c 
	join address a on c.address_id = a.address_id 
	join city cy on a.city_id = cy.city_id 
	join country ct on cy.country_id = ct.country_id 
where ct.country  = 'Canada' ; 

--2. Qué cliente ha rentado más de nuestra sección de adultos?
--Muestra el/la clientx que más VECES ha rentado (ESTE ES EL BUENO)
select count(r.rental_id) as rentas, (c.first_name || ' ' || c.last_name) as cliente from rental r
	join customer c using (customer_id)
	join inventory i using (inventory_id)
	join film f using (film_id)
where f.rating = 'NC-17'
group by 2 order by 1 desc limit 1;
	--Las dos personas que más VECES han rentado han rentado la misma cantidad (13)

--Muestra el/la clientx que más ha PAGADO en rentas 
select sum(p.amount) as cantidad,(c.first_name || ' ' || c.last_name) as cliente from payment p 
	join customer c using (customer_id)
	join rental r using (rental_id)
	join inventory i using (inventory_id)
	join film f using (film_id)
where f.rating = 'NC-17'
group by 2 order by 1 desc limit 1;

--3. Qué películas son las más rentadas en todas nuestras stores?


--4. Cuál es nuestro revenue por store?


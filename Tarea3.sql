--1. Cómo obtenemos todos los nombres y correos de nuestros clientes canadienses para una campaña?
select (c.first_name || ' ' || c.last_name) as Nombre, c.email as Correo from customer c 
	join address a on c.address_id = a.address_id 
	join city cy on a.city_id = cy.city_id 
	join country ct on cy.country_id = ct.country_id 
where ct.country_id = 20 ; 

--2. Qué cliente ha rentado más de nuestra sección de adultos?


--3. Qué películas son las más rentadas en todas nuestras stores?


--4. Cuál es nuestro revenue por store?


--Qué contactos de proveedores tienen la posición de sales representative?
select s.contact_name from suppliers s where s.contact_title = 'Sales Representative';

--Qué contactos de proveedores no son marketing managers?
select s.contact_name from suppliers s where not s.contact_title = 'Marketing Manager';

--Cuales órdenes no vienen de clientes en Estados Unidos?
select o.order_id from orders o where not o.ship_country = 'USA';

--Qué productos de los que transportamos son quesos?
select p.product_name from products p where p.category_id = 4;

--Qué ordenes van a Bélgica o Francia?
select o.order_id from orders o where o.ship_country = 'Belgium' or o.ship_country = 'France';

--Qué órdenes van a LATAM?
select o.order_id from orders o where o.ship_country = 'Brazil' or o.ship_country = 'Mexico' or o.ship_country = 'Venezuela' or o.ship_country = 'Argentina';

--Qué órdenes no van a LATAM?
select o.order_id from orders o where not (o.ship_country = 'Brazil' or o.ship_country = 'Mexico' or o.ship_country = 'Venezuela' or o.ship_country = 'Argentina');

--Necesitamos los nombres completos de los empleados, nombres y apellidos unidos en un mismo registro
select (e.first_name, e.last_name) as Employee_data from employees e;

--Cuánta lana tenemos en inventario?
select SUM(p.units_in_stock * p.unit_price) as total_money_inventory from products p  ;

--Cuantos clientes tenemos de cada país?

--Obtener un reporte de edades de los empleados para checar su elegibilidad para seguro de gastos médicos menores.
--Cuál es la orden más reciente por cliente?
--De nuestros clientes, qué función desempeñan y cuántos son?
--Cuántos productos tenemos de cada categoría?
--Cómo podemos generar el reporte de reorder?
--A donde va nuestro envío más voluminoso?
--Cómo creamos una columna en customers que nos diga si un cliente es bueno, regular, o malo?
--Qué colaboradores chambearon durante las fiestas de navidad?
--Qué productos mandamos en navidad?
--Qué país recibe el mayor volumen de producto?
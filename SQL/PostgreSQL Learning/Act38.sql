-- ----------------------------------------------------------------------------------
-- Act. 38
-- ----------------------------------------------------------------------------------


-- Listado de clientes e ítems que incluya un subquery dentro del SELECT que muestre las últimas fechas de compra de cada uno de ellos
select c.idcliente ,
	   c.nombre ,
	   i.iditem ,
	   i.descripcion ,
	   (
	   	select max(vp.fecha)
	   	from ventasporcliente vp
	   	inner join itemsporventa ipv on ipv.idventa = vp.idventa
	   	where ipv.iditem = i.iditem  and vp.idcliente = c.idcliente
	   ) as UltimaFechaCompra
from clientes c
cross join inventario i;

-- 2. Construir una vista que muestre: Id Cliente y # de ventas por cliente
create or replace view v_ventas_por_cliente as
select idcliente,
	   count(*) as NumVentas
from ventasporcliente
group by idcliente;

-- 3. Construir una vista que detalle: Id Item, Descripción del Ítem, # de compras (cantidad), Id y Nombre Cliente
create or replace view v_detalle_item_cliente as
select i.iditem,
	   i.descripcion,
	   sum(ipv.cantidad) as NumCompras,
	   c.idcliente,
	   c.nombre || ' ' || c.apellido as NombreCliente
from itemsporventa ipv
join inventario i on ipv.iditem = i.iditem
join ventasporcliente v on ipv.idventa = v.idventa
join clientes c on v.idcliente = c.idcliente
group by i.iditem, i.descripcion, c.idcliente, c.nombre, c.apellido;


-- 4. Construir una vista que muestre: Fecha (AAAA-MM-DD), Id Venta, Id Cliente, Total Venta
create or replace view v_ventas_con_total as
select vp.fecha::date as Fecha,
	   vp.idventa,
	   vp.idcliente,
	   sum(ipv.cantidad * ipv.preciounitario) as TotalVenta
from ventasporcliente vp
join itemsporventa ipv on vp.idventa = ipv.idventa
group by vp.fecha, vp.idventa, vp.idcliente

-- 5. Construir un procedimiento almacenado que añada un campo ULT_FECHA_COMPRA, ULT_ITEM_COMPRA a la tabla maestro de Clientes
-- y que actualice la info. cada vez que es llamado. El procedimiento recibe como información la fecha y el id del ítem

-- 5.1 Agregamos el campo
alter table Clientes add column if not exists ULT_FECHA_COMPRA date;
alter table Clientes add column if not exists ULT_ITEM_COMPRA int;

-- 5.2 Stored Procedure
create or replace procedure SP_actualizar_ult_compra(fecha_compra date, id_item int, id_cliente int)
language plpgsql
as $$
begin 
	update clientes
	set 
		ULT_FECHA_COMPRA = fecha_compra,
		ULT_ITEM_COMPRA = id_item
	where idcliente = id_cliente;
end;
$$


-- 6. Construir un procedimiento almacenado que genere un ranking de todos los ítems por Ventas y # de Clientes
create or replace procedure SP_ranking_items()
language plpgsql
as $$
begin 
	create or replace view v_ranking_items as
	select i.iditem,
		   i.descripcion,
		   sum(ipv.cantidad) as TotalVentas,
		   count(distinct v.idcliente) as NumClientes
	from inventario i
	join itemsporventa ipv on i.iditem = ipv.iditem
	join ventasporcliente v on v.idventa = ipv.idventa
	group by i.iditem, i.descripcion
	order by TotalVentas desc;
end;
$$;
















































































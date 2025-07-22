

-- 1. Tabla Inventario

create table Inventario (
    IdItem int not null,
    Descripcion varchar(100) not null,
    PrecioVenta numeric(10,2) not null,
    constraint Inventario_pk primary key (IdItem)
);

-- 2. Tabla Ventas x Cliente
create table if not exists VentasPorCliente(
	IdVenta int not null,
	IdCliente varchar(20) not null,
	Fecha date not null,
	TotalVenta numeric(10,2) not null,
	constraint Venta_pk primary key (IdVenta),
	constraint Venta_fk foreign key (IdCliente) references Clientes(IdCliente)
);

-- 3. Tabla Items x Venta
create table if not exists ItemsPorVenta(
	IdVenta int not null,
	IdItem int not null,
	Cantidad int not null,
	PrecioUnitario numeric(10,2) not null,
	constraint IdVenta_fk foreign key (IdVenta) references VentasPorCliente(IdVenta),
	constraint IdItem_fk foreign key (IdItem) references Inventario(IdItem),
	constraint ItemsPorVenta_pk PRIMARY KEY (IdVenta, IdItem)
);

-- 4. Añadir 5 ítems
insert into Inventario (IdItem, Descripcion, PrecioVenta) values
(1, 'Playera deportiva', 299.90),
(2, 'Tenis para correr', 1349.00),
(3, 'Gorra ajustable', 199.00),
(4, 'Botella térmica', 249.50),
(5, 'Mochila urbana', 899.90);

-- 5. Adición de 20 Ventas por Cliente
-- (IdVenta, IdCliente, Fecha, TotalVenta)
insert into VentasPorCliente values (1, 1, '2025-06-01', 1048.30);
insert into VentasPorCliente values (2, 2, '2025-06-02', 2847.80);
insert into VentasPorCliente values (3, 3, '2025-06-03', 2048.80);
insert into VentasPorCliente values (4, 4, '2025-06-04', 1448.30);
insert into VentasPorCliente values (5, 5, '2025-06-05', 2847.80);
insert into VentasPorCliente values (6, 6, '2025-06-06', 1648.40);
insert into VentasPorCliente values (7, 7, '2025-06-07', 2547.80);
insert into VentasPorCliente values (8, 8, '2025-06-08', 1248.80);
insert into VentasPorCliente values (9, 9, '2025-06-09', 1998.80);
insert into VentasPorCliente values (10, 10, '2025-06-10', 2198.40);
insert into VentasPorCliente values (11, 1, '2025-06-11', 1448.30);
insert into VentasPorCliente values (12, 2, '2025-06-12', 1349.00);
insert into VentasPorCliente values (13, 3, '2025-06-13', 749.30);
insert into VentasPorCliente values (14, 4, '2025-06-14', 1798.90);
insert into VentasPorCliente values (15, 5, '2025-06-15', 2397.70);
insert into VentasPorCliente values (16, 6, '2025-06-16', 2747.80);
insert into VentasPorCliente values (17, 7, '2025-06-17', 1048.30);
insert into VentasPorCliente values (18, 8, '2025-06-18', 1598.80);
insert into VentasPorCliente values (19, 9, '2025-06-19', 999.40);
insert into VentasPorCliente values (20, 10, '2025-06-20', 1448.30);

-- 6. Adición de 3-5 ítems por venta
-- (IdVenta, IdItem, Cantidad, Precio)
-- Venta 1
insert into ItemsPorVenta values (1, 1, 1, 299.90);
insert into ItemsPorVenta values (1, 3, 2, 199.00);
insert into ItemsPorVenta values (1, 4, 1, 249.50);

-- Venta 2
insert into ItemsPorVenta values (2, 2, 2, 1349.00);
insert into ItemsPorVenta values (2, 3, 1, 199.00);
insert into ItemsPorVenta values (2, 5, 1, 899.90);

-- Venta 3
insert into ItemsPorVenta values (3, 1, 2, 299.90);
insert into ItemsPorVenta values (3, 5, 1, 899.90);
insert into ItemsPorVenta values (3, 4, 2, 249.50);

-- Venta 4
insert into ItemsPorVenta values (4, 2, 1, 1349.00);
insert into ItemsPorVenta values (4, 3, 1, 199.00);
insert into ItemsPorVenta values (4, 4, 1, 249.50);

-- Venta 5
insert into ItemsPorVenta values (5, 5, 3, 899.90);
insert into ItemsPorVenta values (5, 1, 1, 299.90);
insert into ItemsPorVenta values (5, 2, 2, 1349.90);

-- Venta 6
insert into ItemsPorVenta values (6, 2, 1, 1349.00);
insert into ItemsPorVenta values (6, 4, 1, 249.50);
insert into ItemsPorVenta values (6, 3, 1, 199.00);

-- Venta 7
insert into ItemsPorVenta values (7, 5, 2, 899.90);
insert into ItemsPorVenta values (7, 2, 1, 1349.00);
insert into ItemsPorVenta values (7, 3, 3, 199.00);

-- Venta 8
insert into ItemsPorVenta values (8, 1, 2, 299.90);
insert into ItemsPorVenta values (8, 3, 2, 199.00);
insert into ItemsPorVenta values (8, 4, 1, 249.50);

-- Venta 9
insert into ItemsPorVenta values (9, 2, 1, 1349.00);
insert into ItemsPorVenta values (9, 5, 1, 899.90);
insert into ItemsPorVenta values (9, 4, 4, 249.50);

-- Venta 10
insert into ItemsPorVenta values (10, 4, 2, 249.50);
insert into ItemsPorVenta values (10, 5, 2, 899.90);
insert into ItemsPorVenta values (10, 1, 5, 299.90);

-- Venta 11
insert into ItemsPorVenta values (11, 2, 1, 1349.00);
insert into ItemsPorVenta values (11, 3, 1, 199.00);
insert into ItemsPorVenta values (11, 4, 1, 249.50);

-- Venta 12
insert into ItemsPorVenta values (12, 2, 1, 1349.00);
insert into ItemsPorVenta values (12, 3, 2, 199.00);
insert into ItemsPorVenta values (12, 4, 3, 249.50);

-- Venta 13
insert into ItemsPorVenta values (13, 1, 1, 299.90);
insert into ItemsPorVenta values (13, 4, 1, 249.50);
insert into ItemsPorVenta values (13, 3, 1, 199.00);

-- Venta 14
insert into ItemsPorVenta values (14, 2, 1, 1349.00);
insert into ItemsPorVenta values (14, 5, 1, 899.90);
insert into ItemsPorVenta values (14, 1, 4, 299.90);

-- Venta 15
insert into ItemsPorVenta values (15, 5, 2, 899.90);
insert into ItemsPorVenta values (15, 3, 3, 199.00);
insert into ItemsPorVenta values (15, 2, 5, 1349.00);

-- Venta 16
insert into ItemsPorVenta values (16, 2, 2, 1349.00);
insert into ItemsPorVenta values (16, 5, 1, 899.90);
insert into ItemsPorVenta values (16, 3, 1, 199.00);

-- Venta 17
insert into ItemsPorVenta values (17, 1, 1, 299.90);
insert into ItemsPorVenta values (17, 3, 2, 199.00);
insert into ItemsPorVenta values (17, 4, 1, 249.50);

-- Venta 18
insert into ItemsPorVenta values (18, 2, 1, 1349.00);
insert into ItemsPorVenta values (18, 4, 1, 249.50);
insert into ItemsPorVenta values (18, 5, 2, 899.90);

-- Venta 19
insert into ItemsPorVenta values (19, 5, 1, 899.90);
insert into ItemsPorVenta values (19, 4, 1, 249.50);
insert into ItemsPorVenta values (19, 1, 3, 299.90);

-- Venta 20
insert into ItemsPorVenta values (20, 2, 1, 1349.00);
insert into ItemsPorVenta values (20, 3, 1, 199.00);
insert into ItemsPorVenta values (20, 4, 4, 249.50);


-- 7. Select los 3 ítems más vendidos
select
	I.descripcion ,
	sum(IPV.cantidad) as TotalVendida
from itemsporventa IPV
join inventario I on IPV.iditem = I.iditem
group by I.descripcion
order by TotalVendida desc
limit 3;

-- 8. Generar un listado de clientes y sus compras que involucren nada más los ítems seleccionados.
with Top3Items as (
    select IDItem
    from ItemsPorVenta
    group by IDItem
    order by sum(Cantidad) desc
    limit 3
)
select 
    C.IDCliente,
    C.Nombre,
    C.Apellido,
    I.Descripcion,
    IPV.Cantidad,
    V.Fecha
from clientes C
join ventasporcliente V on C.IDCliente = V.IDCliente
join itemsporventa IPV on V.IDVenta = IPV.IDVenta
join inventario I on IPV.IDItem = I.IDItem
where IPV.IDItem in (select IDItem from Top3Items)
order by C.IDCliente, V.Fecha;

-- 9. Generar un listado por ítem que muestre el total comprado, por cliente que compró cada uno de ellos, con su fecha y cantidad.
select 
    C.IDCliente,
    C.Nombre,
    I.Descripcion as Item,
    V.Fecha,
    IPV.Cantidad
from clientes C
join ventasporcliente V on C.IDCliente = V.IDCliente
join itemsporventa IPV on V.IDVenta = IPV.IDVenta
join inventario I on IPV.IDItem = I.IDItem
order by I.IDItem, C.IDCliente, V.Fecha;

-- 10. Generar un listado de clientes que han omprado cada ítem, usando RIGHT y/o LEFT OUTER JOIN
select 
    distinct C.IDCliente,
    C.Nombre,
    I.Descripcion,
    I.iditem
from clientes C
join ventasporcliente V on C.IDCliente = V.IDCliente
join itemsporventa IPV on V.IDVenta = IPV.IDVenta
join inventario I on IPV.IDItem = I.IDItem
order by I.IDItem, C.IDCliente;

-- 11. Generar un listado de clientes que no han omprado cada ítem, usando RIGHT y/o LEFT OUTER JOIN
select 
	distinct C.IDCliente,
	I.iditem,
    C.Nombre,
    I.Descripcion
from clientes C
join ventasporcliente V on C.IDCliente = V.IDCliente
join itemsporventa IPV on V.IDVenta = IPV.IDVenta
join inventario I on IPV.IDItem = I.IDItem
order by I.IDItem, C.IDCliente;

-- 12. Ranking de clientes con el número de compras por ítems y por fecha
select 
    C.IDCliente,
    C.Nombre,
    count(distinct V.IDVenta) as NumeroCompras,
    count(IPV.IDItem) as TotalItemsComprados
from clientes C
left join ventasporcliente V on C.IDCliente = V.IDCliente
left join itemsporventa IPV on V.IDVenta = IPV.IDVenta
group by C.IDCliente, C.Nombre
order by NumeroCompras desc, TotalItemsComprados desc;


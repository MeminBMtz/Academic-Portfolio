

-- ----------------------------------------------------------------------------------
-- Actividad 40. Project 2 - Análisis de Datos con SQL
-- ----------------------------------------------------------------------------------

-- Exploración de la información del archivo CSV
-- ===================================================================

-- Importación del archivo CSV a una tabla en la base de datos
-- Generación de tabla "SupermarketSales"
-- ===================================================================

create table if not exists SupermarketSales
(
    Invoice_ID varchar(20) not null,
    Branch char(1) not null,
    City varchar(50) not null,
    Customer_type varchar(20) not null,
    Gender varchar(10) not null,
    Product_line varchar(50) not null,
    Unit_price float not null,
    Quantity int not null,
    Tax_5 float not null,
    Total float not null,
    "Date" date not null,
    "Time" time not null,
    Payment varchar(20) not null,
    COGS float not null,
    Gross_margin_percentage float not null,
    Gross_income float not null,
    Rating float not null,
    constraint pk_invoice primary key (Invoice_ID)
);

-- 1. REVISIÓN DE LOS DATOS
select * from supermarketSales limit 10;


-- 2. Reporte total de ventas ($) y factura promedio por mes, ordenado por mes
select 
    date_trunc('month', "Date") as mes,
    sum(Total) as venta_total_mes,
    avg(Total) as factura_promedio_mes
from SupermarketSales
group by mes
order by mes;

-- 3. Número total de ventas (facturas) y número de clientes por mes
select 
    date_trunc('month', "Date") as mes,
    count(invoice_id) as total_ventas,
    count(distinct invoice_id) as total_clientes
from supermarketsales
group by mes
order by mes;


-- 4. Ranking de los ítems más vendidos (TOP 10), por mes
create or replace view top_items_by_month as
select 
    date_trunc('month', "Date") as mes,
    product_line,
    sum(quantity) as unidades_vendidas,
    rank() over ( partition by date_trunc('month', "Date") order by sum(quantity) desc ) as ranking
from supermarketsales
group by mes, product_line;

select * from top_items_by_month
where ranking <= 10
order by mes, ranking;

-- 5. KPIs generales:
-- 1) Venta total
select sum(total) as venta_total from supermarketsales;

-- 2) Ticket promedio total
select avg(Total) as ticket_promedio from SupermarketSales;

-- 3) Ranking de ítems (TOP 20) por ventas totales
select 
    product_line ,
    sum(total) as ventas_totales
from supermarketsales
group by product_line 
order by ventas_totales desc
limit 20;

-- 4) Ranking de ítems más vendidos por número de unidades
select 
    product_line ,
    sum(quantity) as unidades_vendidas
from supermarketsales
group by product_line 
order by unidades_vendidas desc
limit 20;






























-- Act. 36 | Guillermo Ian Barbosa Martínez

-- 1. Agrupación por cliente que indique el número de actividades de esta forma: Nombre, Apellido, Número de Actividades
select CL.nombre , CL.apellido , count(AC.idactividad) as NumActividades
from clientes CL
left join actividades AC on AC.idcliente = CL.idcliente 
group by CL.nombre , CL.apellido
order by CL.nombre , CL.apellido 

-- 2.1 Listado total del número de actividades por día: Fecha, # actividades
select AC.fecha , count(*)
from actividades AC
group by AC.fecha
order by AC.fecha

-- 2.2 Subdivisión por tipo de actividad: Fecha, Tipo de Actividad, # Actividades
select AC.fecha , AC.tipoactividad , count(*) as NumActividades
from actividades AC
group by AC.fecha, AC.tipoactividad 
order by AC.fecha

-- 3. Suma total de actividades y cliente: Tipo de Actividad, # Clientes
select TA.nombretipo as TipoAct, count(distinct AC.idcliente) as NumClientes
from actividades AC
inner join tipoactividades TA on TA.idtipo = AC.tipoactividad
group by TA.nombretipo, TA.idtipo 
order by TA.idtipo

-- 4.1 Cuenta (COUNT) del número total de clientes
select count(*)
from clientes c 

-- 4.2 Cuenta total de clientes con actividades
select count(distinct AC.idcliente) as ClientesConActs
from actividades AC

-- 4.3 Cuenta total de clientes sin actividades
select
	(select count(*) from clientes)
	-
	(select count(distinct idcliente) from actividades) as ClientesSinActs

-- 4.4 Cuenta total de clientes que tienen y no tienen actividades
select CL.idcliente , CL.nombre || ' ' || CL.apellido as Nombre, count(AC.idcliente) as NumActividades
from clientes CL
left join actividades AC on AC.idcliente = CL.idcliente
group by CL.idcliente, Nombre
order by CL.idcliente asc

-- 5. Actividad más reciente y la menos reciente
select min(AC.fecha) as MenosReciente, max(AC.fecha) as MasRecientes
from actividades AC











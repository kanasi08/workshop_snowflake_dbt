with 
orders as (
    select * from {{ ref('stg_tpch__orders') }}
),
customer as (
    select * from {{ ref('stg_tpch__customer') }}
),
lineitem as (
    select * from {{ ref('stg_tpch__lineitem') }}
),
nation as (
    select * from {{ ref('stg_tpch__nation') }}
),
region as (
    select * from {{ ref('stg_tpch__region') }}
)
select 
    r.r_name as region,
    n.n_name as pais,
    o.o_orderdate as fecha,
    c.c_mktsegment as industria,
    sum(coalesce(l.l_extendedprice,0) * (1 - l.l_discount)) as ventas,
    sum (coalesce(o.o_totalprice,0)) precioTotal
from 
    orders as o
left join 
    customer as c on o.o_custkey = c.c_custkey
left join 
    lineitem as l on o.o_orderkey = l.l_orderkey
left join 
    nation as n on c.c_nationkey = n.n_nationkey
left join 
    region as r on r.r_regionkey = n.n_regionkey
group by 
    r.r_name,
    n.n_name, 
    o.o_orderdate, 
    c.c_mktsegment

    -- esto es un comentario para probar el job CI
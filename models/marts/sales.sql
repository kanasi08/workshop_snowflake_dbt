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
    sum(l.l_extendedprice * (1 - l.l_discount)) as ventas
from 
    orders as o
join 
    customer as c on o.o_custkey = c.c_custkey
join 
    lineitem as l on o.o_orderkey = l.l_orderkey
join 
    nation as n on c.c_nationkey = n.n_nationkey
join 
    region as r on r.r_regionkey = n.n_regionkey
group by 
    r.r_name,
    n.n_name, 
    o.o_orderdate, 
    c.c_mktsegment
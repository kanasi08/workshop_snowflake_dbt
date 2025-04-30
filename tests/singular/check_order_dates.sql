SELECT * 
FROM {{ ref('stg_tpch__orders') }}
WHERE o_orderdate > CURRENT_DATE
with 

source as (

    select * from {{ source('tpch', 'customer') }}

),

renamed as (

    select
        c_custkey,
        c_name,
        c_address,
        c_nationkey,
        c_phone,
        c_acctbal,
        c_mktsegment,
        c_comment,
        ingest_timestamp

    from source

)

select * from renamed

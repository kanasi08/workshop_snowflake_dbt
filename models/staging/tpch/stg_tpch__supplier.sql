with 

source as (

    select * from {{ source('tpch', 'supplier') }}

),

renamed as (

    select
        s_suppkey,
        s_name,
        cast(s_address as varchar) as s_address,
        s_nationkey,
        s_phone,
        s_acctbal,
        s_comment,
        ingest_timestamp::timestamp as ingest_timestamp

    from source

)

select * from renamed

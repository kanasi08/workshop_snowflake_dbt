with 

source as (

    select * from {{ source('tpch', 'region') }}

),

renamed as (

    select
        r_regionkey,
        r_name,
        r_comment,
        ingest_timestamp

    from source

)

select * from renamed

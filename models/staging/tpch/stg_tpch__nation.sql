with 

source as (

    select * from {{ source('tpch', 'nation') }}

),

renamed as (

    select
        n_nationkey,
        n_name,
        n_regionkey,
        n_comment,
        ingest_timestamp

    from source

)

select * from renamed

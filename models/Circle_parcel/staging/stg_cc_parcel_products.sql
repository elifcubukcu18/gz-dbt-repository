{{config(materialized = 'view')}}
with 

source as (

    select * from {{ source('raw_circle', 'cc_parcel_products') }}

),

renamed as (

    select
        ParCEL_id as parcel_id,
        Model_mAME as model_name,
        QUANTITY as quantity
       

    from source

)

select * from renamed
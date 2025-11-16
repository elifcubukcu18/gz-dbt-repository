{{config(materialized = 'view')}}
with 

source as (

    select * from {{ source('raw_circle', 'cc_parcel') }}

),

renamed as (

    select
        Parcel_id as parcel_id,
        Parcel_tracking as parcel_tracking,
        Transporter as transporter,
        Priority  as priority,
        PARSE_DATE('%B %e, %Y', NULLIF(Date_purCHase, ''))   AS date_purchase,
        PARSE_DATE('%B %e, %Y', NULLIF(Date_sHIpping, ''))   AS date_shipping,
        PARSE_DATE('%B %e, %Y', NULLIF(DATE_delivery, ''))   AS date_delivery,
        PARSE_DATE('%B %e, %Y', NULLIF(DaTeCANcelled, ''))   AS date_cancelled


    from source

)

select * from renamed
{{config(materialized = 'table')}}
WITH nb_products_parcel AS (
SELECT 
 parcel_id
 , SUM(quantity) as qty
 , COUNT(DISTINCT model_name) as nb_products
FROM {{ref("stg_cc_parcel_products")}}
GROUP BY parcel_id
)

SELECT
 parcel_id
 ,n.nb_products
,parcel_tracking
,transporter
,priority
,date_purchase
,date_shipping
,date_delivery
,date_cancelled
,month_purchase
,status
, expedition_time
,transport_time
,delivery_time
,delay
,n.qty
FROM {{ref("cc_parcel")}}
LEFT JOIN nb_products_parcel AS n USING(parcel_id)
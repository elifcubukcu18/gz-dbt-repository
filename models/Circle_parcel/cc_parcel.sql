{{config(materialized = 'view')}}
WITH nb_products_parcel AS (
  SELECT
    parcel_id
    ,COUNT(DISTINCT(model_name)) AS nb_models
    ,SUM(quantity) AS qty
  FROM {{ref("stg_cc_parcel_products")}}
  GROUP BY parcel_id
)
SELECT
parcel_id
,parcel_tracking
,transporter
,priority
,date_purchase
,date_shipping
,date_delivery
,date_cancelled
,EXTRACT(MONTH FROM date_purchase) AS month_purchase
,CASE
WHEN date_cancelled IS NOT NULL THEN 'İptal Edildi'
WHEN date_shipping IS NULL THEN 'Devam Ediyor'
WHEN date_delivery IS NULL THEN 'Yolda'
WHEN date_delivery IS NOT NULL THEN 'Teslim Edildi'
ELSE NULL
END AS status
,DATE_DIFF(date_shipping,date_purchase,DAY) AS expedition_time
,DATE_DIFF(date_delivery,date_shipping,DAY) AS transport_time
,DATE_DIFF(date_delivery,date_purchase,DAY) AS delivery_time
,IF(date_delivery IS NULL,NULL,IF(DATE_DIFF(date_delivery,date_purchase,DAY)>5,1,0)) AS delay
,qty
, nb_models
FROM {{ref("stg_cc_parcel")}}
LEFT JOIN nb_products_parcel USING (parcel_id) 
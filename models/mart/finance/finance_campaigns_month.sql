{{config(materialized = 'table')}}
select
 extract(month from date_date) as datemonth,
 ads_margin,
 avg_basket,
 avg_operational_margin,
 ads_cost,
 impression,
 click,
 total_products_sold,
 sum_revenue,
 total_purchase_cost,
 total_shipping_fee,
 total_log_cost
from {{ref("finance_campaigns_day")}}
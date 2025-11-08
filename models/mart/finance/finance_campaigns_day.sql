{{config(materialized = 'table')}}
select
 date_date,
 round((avg_operational_margin - ads_cost),2) as ads_margin,
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
from {{ref("finance_day")}}
join {{ref("int_campaigns_day")}} using(date_date)
 
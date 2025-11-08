{{config(materialized = 'table')}}
select
 date_trunc(date_date, MONTH) as datemonth,
 sum(avg_operational_margin - ads_cost) as ads_margin,
 sum(avg_basket) as avg_basket,
 sum(avg_operational_margin) as operational_margin,
 sum(ads_cost) as ads_cost,
 sum(impression) as ads_impression,
 sum(click) as ads_click,
 sum(total_products_sold) as total_products_sold,
 sum(sum_revenue) as revenue,
 sum(total_purchase_cost) total_purchase_cost,
 sum(total_shipping_fee) as total_shipping_fee,
 sum(total_log_cost) as total_log_cost
from {{ref("finance_campaigns_day")}} 
group by datemonth
order by datemonth desc

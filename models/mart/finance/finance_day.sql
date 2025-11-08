select
 date_date,
 count(distinct orders_id) as total_nb_orders,
 round(sum(revenue),2) as sum_revenue,
 round(round(sum(revenue),2) / count(distinct orders_id) ) as avg_basket,
 round(avg(operational_margin)) as avg_operational_margin,
 round(sum(purchase_cost),2) as total_purchase_cost,
 round(sum(shipping_fee),2) as total_shipping_fee,
 round(sum(ship_cost + log_cost),2) as total_log_cost,
 round(sum(quantity),2) as total_products_sold,
from {{ref("int_orders_operational")}}
group by date_date
order by date_date  

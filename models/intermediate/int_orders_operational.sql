select
 orders_id,
 date_date,
 round(((margin + shipping_fee) - (log_cost + ship_cost)),2) as operational_margin,
 margin,
 revenue,
 quantity
from {{ref("int_orders_margin")}}
join {{ref("stg_raw__ship")}} using(orders_id) 
order by orders_id desc
{{config(materialized = 'view')}}
select
 *
 , quantity * purchase_price as purchase_cost
 , revenue - (quantity * purchase_price) as margin
from {{ref("stg_raw__sales")}}
join {{ref("stg_raw__product")}} using(products_id)

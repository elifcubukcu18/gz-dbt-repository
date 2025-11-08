select
 date_date,
 round(sum(ads_cost),2) as ads_cost,
 round(sum(impression),2) as impression,
 round(sum(click),2) as click
from {{ref("int_campaigns")}}
 group by date_date
 order by date_date desc


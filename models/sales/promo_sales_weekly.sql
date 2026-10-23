-- FICTIONAL: Larkspur Provisions is a made-up company; this file holds no data.
-- Weekly promotional sales by SKU and retailer.
-- Owner: Commercial Analytics. Refreshed every Monday.
create or replace table analytics.promo_sales_weekly as
select
    p.week_start,
    p.retailer_id,
    p.sku,
    c.promo_id,
    c.mechanic,
    sum(p.units)      as units,
    sum(p.net_sales)  as net_sales,
    sum(p.base_units) as baseline_units
from raw_sales.pos_weekly p
left join planning.promo_calendar c
       on c.retailer_id = p.retailer_id
      and c.sku = p.sku
      and p.week_start between c.start_week and c.end_week
group by 1, 2, 3, 4, 5;

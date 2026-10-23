-- FICTIONAL: Larkspur Provisions is a made-up company; this file holds no data.
-- Gross margin by SKU and week, with promoted weeks flagged.
-- Owner: Finance. Uses list price and standard cost; promo depth comes from sales.
create or replace table analytics.product_margin_weekly as
select
    s.week_start,
    s.sku,
    s.retailer_id,
    s.promo_id,
    s.net_sales,
    s.units * c.standard_cost                       as cost_of_goods,
    s.net_sales - s.units * c.standard_cost         as gross_margin,
    (s.net_sales - s.units * c.standard_cost)
        / nullif(s.net_sales, 0)                    as gross_margin_pct,
    l.list_price
from analytics.promo_sales_weekly s
join finance.standard_costs c on c.sku = s.sku
join finance.list_prices    l on l.sku = s.sku;

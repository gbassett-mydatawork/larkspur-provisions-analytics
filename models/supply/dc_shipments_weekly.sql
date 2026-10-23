-- FICTIONAL: Larkspur Provisions is a made-up company; this file holds no data.
-- Average weekly shipments by distribution centre and SKU, trailing 13 weeks.
create or replace table supply.dc_shipments_weekly as
select dc_id, sku, avg(units_shipped) as avg_weekly_shipments
from raw_supply.shipments
where ship_week >= dateadd(week, -13, current_date)
group by dc_id, sku;

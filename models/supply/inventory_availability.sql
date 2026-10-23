-- FICTIONAL: Larkspur Provisions is a made-up company; this file holds no data.
-- Weeks of cover and stock-out risk by SKU and distribution centre.
-- Owner: Supply Planning. Refreshed daily.
create or replace table analytics.inventory_availability as
select
    o.snapshot_date,
    o.dc_id,
    o.sku,
    o.on_hand_units,
    d.avg_weekly_shipments,
    o.on_hand_units / nullif(d.avg_weekly_shipments, 0) as weeks_of_cover,
    case when o.on_hand_units < d.avg_weekly_shipments then 1 else 0 end as stockout_risk
from supply.stock_on_hand o
join supply.dc_shipments_weekly d
  on d.dc_id = o.dc_id and d.sku = o.sku;

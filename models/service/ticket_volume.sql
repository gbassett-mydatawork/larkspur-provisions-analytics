-- FICTIONAL: Larkspur Provisions is a made-up company; this file holds no data.
-- Customer-service tickets by category and week.
create or replace table analytics.ticket_volume_weekly as
select date_trunc('week', opened_at) as week_start, category, count(*) as tickets
from service.tickets
group by 1, 2;

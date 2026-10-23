-- FICTIONAL: Larkspur Provisions is a made-up company; this file holds no data.
-- Monthly headcount by business function, for the HR dashboard.
create or replace table analytics.headcount_by_function as
select month_start, business_function, count(distinct employee_id) as headcount
from hr.employee_snapshot
group by 1, 2;

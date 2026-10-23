# Larkspur Provisions — commercial analytics (FICTIONAL)

**Larkspur Provisions is a fictional company.** This repository was created for a MyDataWork product demonstration.

- It contains model definitions only: SQL and Python, with no data.
- Every table, retailer, product and figure it refers to is made up.
- It does not describe any real company, retailer or dataset.

The layout follows a typical warehouse transformation project:

| Folder | What it holds |
|---|---|
| `models/sales` | Weekly promotional sales by SKU and retailer |
| `models/finance` | Product margin, including the margin on promoted weeks |
| `models/supply` | Inventory availability at distribution centres |
| `models/people` | Headcount reporting |
| `models/service` | Customer-service ticket volumes |
| `scripts` | Scheduled refresh |

## How these files relate

They fall into three groups, and the groups mean different things.

1. **A direct dependency.** `models/finance/product_margin.sql` reads `analytics.promo_sales_weekly`, the table that `models/sales/promo_sales_weekly.sql` writes. A tool that reads the SQL can detect this link.
2. **Relevant, but with no direct dependency.**
   - `models/supply/inventory_availability.sql` (with `dc_shipments_weekly.sql`) answers a question that matters to promotion planning: is there enough stock to support a promotion?
   - It shares no table with the sales or finance models. Supply planning keeps it separately.
   - So "no direct dependency detected" is true of it, but "not relevant" is not.
3. **Not relevant to commercial planning.** The headcount, customer-service and dashboard-refresh files belong to other teams. A real repository holds more than one team's work, so they are here on purpose.


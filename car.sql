
---

## Data source
- Raw files: CSV exports of used car listings (commonly fields: `year`, `selling_price`, `kilometer`, `fuel`, `seller_type`, `transmission`, `owner`, `engine`, `max_power`, `max_torque`, `seating_capacity`, etc.)
- In this project the raw CSVs were combined into `car_details_v3.csv`, `car_details_v4.csv` and consolidated into `all_cars` table.

---

## High-level steps (what I did)
1. **Inspect raw CSVs in Excel**
   - Quick checks: missing values, inconsistent column names, currency formats, engine text patterns.
2. **Load raw data into SQL Server** (local)
   - Create database `caranalysis` (or use existing).
   - Import CSV files into staging tables (using SQL Server Import Wizard or BULK INSERT).
3. **Consolidate with SQL** (example shown below)
   - Normalize column names, cast types, UNION/append tables into `all_cars`.
4. **Connect Power BI to SQL Server**
   - Use `Get Data → SQL Server` → connect to server & database, import `all_cars`.
5. **Power Query shaping**
   - Parse `selling_price` to numeric, remove currency symbols and separators.
   - Extract numeric `km_driven` from km text.
   - Parse `engine` string to extract engine capacity (cc) and horsepower if needed.
   - Create/format a Date table for proper time intelligence.
6. **Modeling & DAX**
   - Create useful measures (e.g., totals, averages, YoY changes, Top Fuel Type).
   - Example DAX measures are below.
7. **Design visuals**
   - KPI cards (Total Cars, Total Value, Avg Price, Avg KM)
   - Line chart for price over time
   - Donut for fuel share
   - Bar charts for engine and avg price by fuel/transmission
   - Gauge for target achievement
   - Slicers for Year, Transmission, Price range, KM range
8. **Styling**
   - Dark cinematic theme, background image (speedometer), consistent color palette and rounded cards.
9. **Export & share**
   - Optionally publish to Power BI Service (if you have a workspace), or share PBIX.

---

## SQL examples

### Create consolidated table (example)
```sql
-- Example: create 'all_cars' from two staging tables car_details_v3 and car_details_v4
CREATE TABLE dbo.all_cars (
    Year INT,
    selling_price DECIMAL(18,2),
    km_driven INT,
    fuel VARCHAR(50),
    seller_type VARCHAR(50),
    transmission VARCHAR(50),
    owner VARCHAR(50),
    engine VARCHAR(100),
    max_power VARCHAR(100),
    torque VARCHAR(100),
    seats INT
);

INSERT INTO dbo.all_cars (Year, selling_price, km_driven, fuel, seller_type, transmission, owner, engine, max_power, torque, seats)
SELECT
    CAST([Year] AS INT),
    TRY_CAST(REPLACE(REPLACE([Price], '$', ''), ',', '') AS DECIMAL(18,2)),
    TRY_CAST(REPLACE([Kilometer], ',', '') AS INT),
    [Fuel Type],
    [Seller Type],
    Transmission,
    Owner,
    Engine,
    [Max Power],
    [Max Torque],
    [Seating Capacity]
FROM dbo.car_details_v4

UNION ALL

SELECT
    CAST([year] AS INT),
    selling_price,
    km_driven,
    fuel,
    seller_type,
    transmission,
    owner,
    engine,
    max_power,
    torque,
    seats
FROM dbo.car_details_v3;

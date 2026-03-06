# DriveMetrics — Used Car Market Analysis

**Interactive Power BI Dashboard** for analyzing used car listings in India.  
One-page report with KPIs, filters, trends, and insights on price, kilometers, fuel type, transmission, engine capacity, owner history, and more.

**Live Demo/Dashboard Screenshot:**  
![Used Car Market Dashboard](Screenshot_2025-11-06_174815.png)  
*(Full dashboard view - zoom in for details)*

### Project Highlights
- **Total Cars Analyzed**: 32 (sample dataset)  
- **Total Market Value**: ₹32 Million  
- **Average Selling Price**: ₹1.01 Million  
- **Average KM Driven**: 60.63K km  
- **Key Insights**:
  - First-owner cars dominate (75% of listings) — higher resale value potential
  - Petrol cars have the highest average price (₹1M+), Diesel close second
  - Price trend shows sharp rise after 2010, with recent peaks
  - Transmission: Manual > Automatic in this sample
  - Top fuel-engine combos: Petrol 796–1197cc range most common

### Business Value
Perfect for:
- Used car dealerships — optimize inventory & pricing
- Market researchers — understand buyer preferences & trends
- Buyers — benchmark fair market price by fuel/owner/KM

### Tools & Tech Stack
- **Data Preparation**: Excel + SQL Server (local)
- **Analysis & Visualization**: Power BI Desktop (DAX measures, filters, slicers)
- **Key DAX Features**: Dynamic KPIs, Year-over-Year calculations, conditional formatting
- **Data Source**: Consolidated CSV files → SQL table (`all_cars`)

### Repository Structure
- `carsbi.pbix` → Main Power BI file (open with Power BI Desktop)
- `car.sql` → SQL script for table creation & data load
- `Screenshot_2025-11-06_174815.png` → Dashboard preview
- `README.md` → This file

### How to Use / Reproduce
1. Clone the repo: `git clone https://github.com/NarasimhaMurthy-AI/-DriveMetrics-Used-Car-Market-Analysis.git`
2. Open `carsbi.pbix` in Power BI Desktop
3. Refresh data if needed (local SQL connection)
4. Interact with slicers (Year, Fuel Type, Transmission, Owner)

### Future Scope
- Add real-time data source (API/web scrape)
- Deploy to Power BI Service for sharing
- Include predictive pricing model (Python integration)

Open to freelance/customization requests — feel free to reach out!

Made with ❤️ by Narasimha Murthy  
Portfolio: [https://cheddar-nightshade-544.notion.site/...](https://cheddar-nightshade-544.notion.site/Pilli-Narasimha-Murthy-Data-Analyst-Portfolio-2aa5fd44142c80fc8ca3e55284b1d65e)  
GitHub: https://github.com/NarasimhaMurthy-AI

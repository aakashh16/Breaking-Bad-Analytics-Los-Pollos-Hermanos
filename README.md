# Breaking Bad Analytics: Los Pollos Hermanos Sales Dashboard with SQL & Power BI

## Project Overview  
This project brings the iconic *Los Pollos Hermanos* restaurant from Breaking Bad into the realm of business intelligence. Using simulated sales data, SQL queries, and Power BI visuals, the dashboard delivers actionable insights into restaurant performance, product trends, and branch analytics.

Ever wondered what it would be like to manage Gustavo Fring’s empire? With this project, you’ll uncover deep business insights about sales, products, branches, and much more — all through data storytelling and interactive dashboards.

## Objectives  
- **Calculate key metrics:** Revenue, profit, average order value, sales by category, and branch-level performance.
- **Visualize sales trends:** Explore monthly, daily, and category-wise revenue growth.
- **Support data-driven decisions:** Surface business opportunities and operational efficiencies using interactive dashboards.
- **Bridge pop culture and analytics:** Demonstrate how fictional scenarios can deliver real-world BI and analytics skills.

## Dataset  
*Custom sales data for Los Pollos Hermanos, featuring product, category, branch, and order details. Simulated to mirror real restaurant operations.*

## Business Questions & SQL Solutions

1. **Total Revenue, Cost, & Profit**
    ```
    select 
        round(sum(LineRevenue),2) as Revenue,
        round(sum(LineCost),2) as Cost,
        round(sum(LineRevenue - LineCost),2) as Profit
    from SalesTable;
    ```

2. **Average Order Value**
    ```
    select 
        round(sum(LineRevenue) / count(distinct OrderID), 2) as AvgOrderValue
    from SalesTable;
    ```

3. **Monthly Revenue Trend**
    ```
    select 
        format(OrderDate, 'yyyy-MM') as Month,
        sum(LineRevenue) as MonthlyRevenue
    from SalesTable
    group by format(OrderDate, 'yyyy-MM')
    order by Month;
    ```

4. **% of Sales by Category**
    ```
    select 
        Category,
        round(sum(LineRevenue) * 100.0 / (select sum(LineRevenue) from SalesTable), 2) as PercentOfSales
    from SalesTable
    group by Category
    order by PercentOfSales desc;
    ```

5. **Top & Bottom 5 Products by Revenue**
    
    *Top 5:*
    ```
    select top 5 ProductName, SUM(LineRevenue) as TotalRevenue
    from SalesTable
    group by ProductName
    order by TotalRevenue desc;
    ```
    
    *Bottom 5:*
    ```
    select top 5 ProductName, SUM(LineRevenue) as TotalRevenue
    from SalesTable
    group by ProductName
    order by TotalRevenue asc;
    ```

6. **Daily Sales & Order Trends**
    ```
    select
        OrderDate,
        count(distinct OrderID) as TotalOrders,
        sum(LineRevenue) as DailyRevenue
    from SalesTable
    group by OrderDate
    order by OrderDate;
    ```

7. **Profit by Branch & Food Type**
    ```
    select 
        Branch,
        FoodType,
        sum(LineRevenue - LineCost) as Profit
    from SalesTable
    group by Branch, FoodType
    order by Profit desc;
    ```

## Dashboard Features  
- **Page 1 — Executive Overview:**  
    - Total revenue, profit, branch-wise & category breakdown  
    - KPI cards for instant snapshots  
- **Page 2 — Deep Dive Analysis:**  
    - Profit trends, top/bottom products  
    - Veg vs Non-Veg split, size-based sales, granular insights  

## Key Findings  
- **Revenue:** $14.28M  
- **Profit:** $8.02M (56.14% margin)  
- **Total Orders:** 40K+  
- **Top Categories:** Burgers, Wings & Platters  
- **Veg/Non-Veg Split:** 67% Non-Veg | 33% Veg  
- **Branch Insights:** Albuquerque leads both sales and margin.

## Conclusions  
From maximizing branch performance to optimizing the menu, actionable data insights turn plain metrics into solid business decisions for any restaurant — fictional or real. Data storytelling bridges pop culture and analytics skills, making business intelligence memorable and impactful.

## Future Work  
- Integrate customer reviews & ratings for sentiment analysis  
- Add inventory and wastage metrics to improve operational efficiency  
- Compare sales with other pop culture restaurants for benchmarking  
- Use predictive modeling for menu planning and sales forecasting  

---

> **Experience restaurant analytics, Breaking Bad style! Built with SQL, Power BI, and a passion for data storytelling.**

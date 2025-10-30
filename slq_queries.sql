select * from SalesTable

-- Total Revenue, Cost & Profit
select 
    round(sum(LineRevenue),2) as Revenue,
    round(sum(LineCost),2) as Cost,
    round(sum(LineRevenue - LineCost),2) as Profit
from SalesTable;

-- Average Order Value
select 
    round(sum(LineRevenue) / count(distinct OrderID), 2) as AvgOrderValue
from SalesTable;

-- Monthly Revenue Trend
Select 
    format(OrderDate, 'yyyy-MM') as Month,
    sum(LineRevenue) as MonthlyRevenue
from SalesTable
group by format(OrderDate, 'yyyy-MM')
order by Month;

-- % of Sales by Category
select 
    Category,
    round(sum(LineRevenue) * 100.0 / (select sum(LineRevenue) from SalesTable), 2) as PercentOfSales
from SalesTable
group by Category
order by PercentOfSales desc;

-- Top & Bottom 5 Products by Revenue
-- Top 5
select top 5 ProductName, SUM(LineRevenue) as TotalRevenue
from SalesTable
group by ProductName
order by TotalRevenue desc;

-- Bottom 5
select top 5 ProductName, SUM(LineRevenue) as TotalRevenue
from SalesTable
group by ProductName
order by TotalRevenue asc;

-- Daily Sales & Order Trends
select
    OrderDate,
    count(distinct OrderID) as TotalOrders,
    sum(LineRevenue) as DailyRevenue
from SalesTable
group by OrderDate
order by OrderDate;

-- Profir by Branch & Food Type
select 
    Branch,
    FoodType,
    sum(LineRevenue - LineCost) as Profit
from SalesTable
group by Branch, FoodType
order by Profit desc;

SELECT * FROM retail_sales;

select count(*) as total_sales from retail_sales

--How many unique Customers we have
select count(distinct customer_id) as total_sale from retail_sales

--show uniques values in category column
SELECT DISTINCT category FROM retail_sales

-- My Analysis & Findings


-- retrieve all columns for sales made on '2022-11-05'
select * from retail_sales 
where sale_date='2022-11-05';

--retrieve all transactions where the category is 'Clothing' and the quantity sold is equal or more than 4 in the month of Nov-2022
select* from retail_sales
where category='Clothing' 
and quantiy>='4' 
and year(sale_date)='2022' 
and month(sale_date)='11'

-- calculate the total sales (total_sale) for each category.
SELECT 
   category,
   SUM(total_sale) AS net_sal,
   COUNT(*) AS [total order]
FROM retail_sales 
GROUP BY category;

--find the average age of customers who purchased items from the 'Beauty' category.
select cast(AVG(age) as int) as average_age,category from retail_sales
where category='beauty'
group by category

--find all transactions where the total_sale is greater than 1000
select * from retail_sales
where total_sale > 1000;

--find the total number of transactions (transaction_id) made by each gender in each category
select category,gender,count(*) as total_trans 
from retail_sales 
group by category,gender
order by 1

--calculate the average sale for each month. Find out best selling month in each year
select year(sale_date) as the_Year,month(sale_date)as the_Month ,AVG(total_sale) as avg_total_sale
from retail_sales
group by year(sale_date),MONTH(sale_date)
order by 1,3 desc

--find the top 5 customers based on the highest total sales 
select top 5 customer_id,sum(total_sale ) AS total_sales,gender
from retail_sales
group by customer_id,gender 
order by total_sales desc

--find the number of unique customers who purchased items from each category.
select count(distinct customer_id) as customer_id,category
from retail_sales
group by category

--create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)
select *
from retail_sales
where sale_time between '12:00:00.0000000' AND '17:00:00.0000000'
ORDER BY sale_time; 


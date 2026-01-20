create database sql_project;
use sql_project;
select * from retails;
ALTER TABLE retails
CHANGE `ï»¿transactions_id` transactions_id INT;
select*from retails 
where 
transactions_id is null
or
 sale_date is null
or
sale_time is null
or 
customer_id is null
or
gender is null
or
age is null
or
category is null
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or 
total_sale is null ;



-- Data exploration

-- how many  sales we have?
select count(*) as total_sale from retails;

-- how many unique customers we have 
select count(distinct customer_id)  from retails;

-- how many category we have
select count(distinct category) from retails;
select distinct category from retails;

-- Data analysis and business key problems and answer

-- 0.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from retails where sale_date ='2022-11-05';


-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity soto is more tnan 4 the month of Nov-2022
select*from retails where category='clothing' and quantiy>=4 and sale_date between '2022-11-01' and '2022-11-320';

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select category, sum(total_sale) from retails group by category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select avg(age) from retails where category='beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from retails where total_sale>1000;

 -- Q.6 Write a SQL query to find the total number of  (transaction_id) made by each gender in each category.
 select category,gender ,count(transactions_id) from retails group by category , gender;
 
 -- Q.7 Write a SQL query to calculate the average sale for each month. 
 SELECT 
    YEAR(sale_date) ,
    MONTH(sale_date) ,
    avg(total_sale)
    
FROM retails
GROUP BY YEAR(sale_date), MONTH(sale_date),month(sale_date) 
order by YEAR(sale_date),avg(total_sale) desc;
 -- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales
 select customer_id,sum(total_sale) from retails group by customer_id order by sum(total_sale)  desc limit 5 ;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select count(distinct customer_id) ,  category from retails group by category;

--  Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
 SELECT 
    CASE
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS number_of_orders
FROM retails
GROUP BY shift;


 



create database pizzas;
use pizzas;
select * from pizza_sales;
select cast(sum(total_price) as decimal(10,2)) as total_revenue from pizza_sales;
select cast(sum(total_price) as decimal(10,2))/count(distinct order_id) as average_order_value from pizza_sales;
select sum(quantity) as total_pizzas_sold from pizza_sales;
select count(distinct order_id) as total_orders from pizza_sales;
select cast(cast(sum(quantity) as decimal(10,2))/count(distinct order_id) as decimal(10,2)) as average_order_value from pizza_sales;
select dayname(STR_TO_DATE(order_date, '%d-%m-%Y')) as order_day, count(distinct order_id) as total_orders from pizza_sales 
group by dayname(STR_TO_DATE(order_date, '%d-%m-%Y'));
select pizza_category, cast(sum(total_price) as decimal(10,2)) as total_category_revenue, cast(sum(total_price) * 100 / (select 
sum(total_price) from pizza_sales) as decimal(10,2)) as PCT from pizza_sales group by pizza_category;
select pizza_size, cast(sum(total_price) as decimal(10,2)) as total_category_revenue, cast(sum(total_price) * 100 / 
(select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT from pizza_sales group by pizza_size;
select pizza_category, sum(quantity) as total_category_quantity from pizza_sales group by pizza_category;
select pizza_name, sum(quantity) as total_quantity from pizza_sales group by pizza_name order by total_quantity desc limit 5;
select pizza_name, sum(quantity) as total_quantity from pizza_sales group by pizza_name order by total_quantity asc limit 5;
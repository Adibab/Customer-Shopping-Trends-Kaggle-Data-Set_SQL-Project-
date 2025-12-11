create database Customer_Shopping_Trends
use Customer_Shopping_Trends

select * from [dbo].[shopping_trends]


select * from [dbo].[shopping_trends_updated]

select top 10 * from [dbo].[shopping_trends_updated]

-- 1. How many unique customers have visited the store during the time period provided? (To get a sense of the sample size )

select distinct count(Customer_ID) 
from [dbo].[shopping_trends_updated]

-- 2A. Should the store stock more male or female clothing? (What % of customers are male vs. female?)
--explanation : finding out total num of customer in respect to gender
with gender_data as (
select 
Gender,  count(  distinct Customer_ID)  total_customer 
from  [dbo].[shopping_trends_updated]
group by Gender
)

-- to calculate female/ male % of total customer the formula should be ((total male or female) / total customer )*100

select 
sum(total_customer)  total_customer, 
round(100 * sum(case when Gender = 'Female' then total_customer  else 0 end) / sum (total_customer),2)as percentage_female,
round(100 * sum(case when Gender = 'Male' then total_customer  else 0 end) / sum (total_customer),2)as percentage_male
from gender_data

-- 32 percentage female and 68% male

--2B. Which age group shops the most? 50+, 1018 male customers, total spent = 60,595,
-- explanation - 

-- so the assumetion to catagorise by age ,The logic is:

-- 18–25 → younger shoppers, often students or early career.

-- 26–35 → young professionals, often high-spending in fashion/tech.

-- 36–50 → mid-career, family-oriented spending.

-- 50+ → older customers, possibly more stable but different product preferences.

select 
--catagorising as per age
case
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 50 THEN '36-50'
    ELSE '50+'
end as agegroup,

-- counting total customer in respect to femal/male as per age group
Gender,
count( distinct Customer_ID) total_customer ,
--summing up total prchase as per age group
sum (Purchase_Amount_USD) as total_spent
from  [dbo].[shopping_trends_updated]
group by 
case
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 50 THEN '36-50'
    ELSE '50+'
end,
Gender
order by total_spent desc


-- 2C.Who are the top spenders? i need indiv cutomer id, age, gender,who has spent highest amount- customer_ID 43, age- 20 , male , total_spent= $100

select 
Customer_ID,
Age,
Gender,
sum(Purchase_Amount_USD) total_spent
from  [dbo].[shopping_trends_updated]
group by
Customer_ID,
Age,
Gender
order by total_spent desc


-- 3A. What seasons are represented in the data? (Helps us track trends by time period.)
select 
distinct Season
from  [dbo].[shopping_trends_updated]
order by season asc


-- 3B. How do sales vary by month or season?
-- 3C. What should the store stock—and when—to maximize sales and reduce dead stock

-- 4.A. What are the most purchased categories and/or items by season? (This will help guide seasonal stocking strategies.)
-- answer
-- Fall                                               Jacket                                             54
-- Spring                                             Sweater                                            52
-- Winter                                             Sunglasses                                         52
-- Winter                                             Pants                                              51
-- Summer                                             Pants                                              5

select
Season,
Item_Purchased,
count(*) count_of_items

from  [dbo].[shopping_trends_updated]
group by Item_Purchased, Season
order by count_of_items desc


--4B. Which categories sell best?  clothing category, highest number of transaction 1737 and highest spending $1,04,264
select
Category,
count(*) Total_num_of_Category,
sum (Purchase_Amount_USD) Total_spend
from  [dbo].[shopping_trends_updated]
group by Category
order by Total_num_of_Category desc, Total_spend desc



--5.What are the most popular item colors by season? (Color preference can affect buying decisions.)
-- Season                                             Color                                              total_num_item_as_per_color
-------------------------------------------------- -------------------------------------------------- ---------------------------
--Spring                                             Beige                                              39
--Summer                                             Beige                                              37
--Winter                                             Beige                                              37
-- Fall                                               Beige                                              34
select 
Season,
Color,
count(*) total_num_item_as_per_color

from  [dbo].[shopping_trends_updated]
group by Season, Color
order by Color, total_num_item_as_per_color desc


--total number of stores as es per the location
select   location,
count(*) total_num_of_store
from  [dbo].[shopping_trends_updated]
group by Location
order by total_num_of_store desc

--6.A.Should stocking strategies vary by store location? (You can also explore if customer gender varies by location).
-- location plus catagory- findings are -Which categories sell best in each store location, How much spending each category generates per location,Which categories dominate in terms of total Num_of_item_purchased count.
select
Location,
Category,
count(*) Num_of_item_purchased,
sum(Purchase_Amount_USD) total_spending
from  [dbo].[shopping_trends_updated]
group by Location, Category
order by  Num_of_item_purchased desc


--stocking strategy -a location‑specific stocking strategy view — the top category per store, how gender distribution looks, and the average spend per transaction.

--the top category per store,
with category_rank as (

select 
Location, 
Category,
COUNT(*) total_mum_of_item_purchased,       --total num of item purchased for a specific category
row_number ()                               --ROW_NUMBER() assigns a sequential rank to each row.
over(  
partition by Location                       -- Partition by Store_Location → Treat each store separately. Example: New York, London, Paris each get their own “mini‑table.”resets the numbering for each store location
order by count(*) desc                      -- within each store, categories are ordered by purchase count (highest first).
) as most_purchased_category_locationWise   -- creates a column called most_purchased_category_locationWise that holds the rank (1 = most purchased category in that store).
from  [dbo].[shopping_trends_updated]
group by Location, Category
)
select              --the highest‑purchased category per store location.
Location, 
Category,
total_mum_of_item_purchased
FROM category_rank
where most_purchased_category_locationWise = 1




--how gender distribution looks, and the average spend per transaction.
--findings-
        --The top category (most purchased).

        --The number of purchases for that category.

        --The gender split (male vs female counts).

        --The average spend per transaction at that store.

with category_rank as (
select 
Location, 
Category,
COUNT(*) total_num_of_item_purchased,       --total num of item purchased for a specific category
row_number ()                               --ROW_NUMBER() assigns a sequential rank to each row.
over(  
partition by Location                       -- Partition by Store_Location → Treat each store separately. Example: New York, London, Paris each get their own “mini‑table.”resets the numbering for each store location
order by count(*) desc                      -- within each store, categories are ordered by purchase count (highest first).
) as most_purchased_category_locationWise   -- creates a column called most_purchased_category_locationWise that holds the rank (1 = most purchased category in that store).
from  [dbo].[shopping_trends_updated]
group by Location, Category
),
--groups the data by location and customer gender.counts how many transactions/customers belong to each gender at each store.
gender_dist as(
select 
Location,
Gender,
count(*) total_number_customers
 from dbo.shopping_trends_updated
 group by Location, Gender
),
avg_spending as(
select
Location,
avg(Purchase_Amount_USD) AvgSpendingPerTransaction
from dbo.shopping_trends_updated
 group by Location
)
select  
c.Location,
c.Category top_category,
c.total_num_of_item_purchased,
g.Gender,
g.total_number_customers,
a.AvgSpendingPerTransaction
from category_rank c
join gender_dist g 
 on
 c.Location = g.Location
 join avg_spending a
 on
 c.Location = a.Location
where most_purchased_category_locationWise = 1
order by c.Location, g.Gender;




--6.B.Which locations are top-performing in terms of customer experience? texas 3.91 .(Use metrics like frequency of repeat visits or average spend.)
--top loc as per review
select 
Location,
ROUND (avg(Review_Rating),2) avg_review_rating
from  [dbo].[shopping_trends_updated]
group by Location
order by avg_review_rating desc

-- top loc as per speding amount
select
Location,
avg(Purchase_Amount_USD) AvgSpendingPerTransaction
from dbo.shopping_trends_updated
 group by Location
 order by AvgSpendingPerTransaction desc

--(Use metrics like frequency of repeat visits or average spend.)
            --Count how many times each customer shops at each location.
            select
            Location,
            count (distinct Customer_ID) unique_customer,
            count(*) total_transaction
            --ROUND (count(*) * 1.00 / count (distinct Customer_ID),2) avg_visits_per_customer
            from dbo.shopping_trends_updated
            group by Location
            --order by avg_visits_per_customer

          

            --Locations with more repeat customers → stronger loyalty.

            select
            Location,
           -- count (distinct Customer_ID) unique_customer
           count (*) unique_customer
            from dbo.shopping_trends_updated
                 group by Location
                 order by unique_customer desc

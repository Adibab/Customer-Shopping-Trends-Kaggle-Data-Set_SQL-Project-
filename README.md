 # Customer Shopping Trends Analysis – SQL Project


This project explores customer behavior trends using SQL queries on Kaggle datasets.  
The goal is to uncover insights such as purchase patterns, seasonal demand, and customer segmentation through structured query analysis.

##  Project Overview
Dataset Source: [Kaggle](https://www.kaggle.com/datasets/iamsouravbanerjee/customer-shopping-trends-dataset/data)  
Tech Stack: SQL (MySQL)  
Objective: Analyze customer data to identify meaningful trends and business insights.  
Key Deliverables 
  	SQL scripts for queries  
  	Kaggle notebook with analysis  
  	Summary of findings

## Phase  1: Understand the Dataset
The Kaggle Customer Shopping Trends dataset contains:
Customer demographics: age, gender, location
Transactions: purchase_amount_usd, product category, payment method, previous_purchases.
Shopping behavior: review_rating, frequency of purchases, average spend, seasons..

## Phase  2: Understand the Problem
The purpose of this project is to analyze customer purchasing behavior using SQL queries on a Kaggle dataset. The dataset contains transaction records including customer IDs, product categories, purchase dates, and amounts spent.  
The main problem is to identify customer trends that can help businesses improve decision‑making. Specifically, we aim to answer:  
 Which products drive the highest sales?  
What seasonal patterns exist in customer purchases?  
How frequently do customers return for repeat transactions?  
Can we segment customers based on their spending behavior? 


 ## Phase 3: Problem Statements
How many unique customers have visited the store during the time period provided? (To get a sense of the sample size you're working with.)


How many unique customers have visited the store during the time period provided? (To get a sense of the sample size you're working with.)

 1. A. Should the store stock more male or female clothing? (What % of customers are male vs. female?)
    B. Which age group or gender shops the most? 
    C.Who are the top spenders? customer_ID 43, age- 20 , male , total_spent= $100

 2. A. Should the store stock more male or female clothing? (What % of customers are male vs. female?)
    B. Which age group or gender shops the most? 
    C.Who are the top spenders? customer_ID 43, age- 20 , male , total_spent= $100

3. A. What seasons are represented in the data? (Helps us track trends by time period.)
   B. How do sales vary by month or season?
   C. What should the store stock—and when—to maximize sales and reduce dead stock

4. A.  What are the most purchased categories and/or items by season? (This will help guide seasonal stocking strategies.)
5. A.  Which categories sell best? Which products are frequently bought together?
        What are the most popular item colors by season? (Color preference can affect buying decisions.)
        Total number of stores as  per the location
   
7. A. Should stocking strategies vary by store location? (You can also explore if customer gender varies by location.)
       stocking strategy -a location‑specific stocking strategy view — the top category per store, how gender distribution looks, and the average spend per transaction.
        The top category per store,
        How gender distribution looks, and the average spend per transaction.
   
6. B. Which locations are top-performing in terms of customer experience? (Use metrics like frequency of repeat visits or average spend.)
      Count how many times each customer shops at each location.
      Locations with more repeat customers → stronger loyalty.
   
7. Does having more than 10 previous purchases correlate with higher total spend? (Understanding customer loyalty and value

## Summary of Findings & Recommendations
## Executive Summary

During the analysis period, 3,900 unique customers visited the store. The customer base is predominantly male (68%), with females representing 32%. Spending is highest among male customers aged 50+, who contributed over $60,000 in total. Seasonal demand patterns show strong preferences for jackets in fall, sweaters in spring, and pants year‑round, with beige consistently the most popular color. Clothing dominates across all store locations, accounting for the majority of transactions and revenue. Customer loyalty is a critical driver of sales, with frequent buyers contributing nearly 80% of total spend.
## Key Findings
### Customer Demographics
3,900 unique customers analyzed.
68% male vs. 32% female → inventory should lean toward male categories.
Highest spending group: Male, 50+ age bracket ($60,595).
### Spending Behavior
Top spenders are spread across age groups, each contributing ~$100.
Indicates broad spending power, not concentrated in one demographic.
### Seasonal Trends
Fall → Jackets (54 purchases).
Spring → Sweaters (52).
Winter → Sunglasses (52), Pants (51).
Summer → Pants (50).
Beige is the most popular color across all seasons.
### Category Performance
Clothing: 1,737 transactions, $104,264 total spend.
Clothing items are frequently bought together, reinforcing category dominance.
### Location Insights
Clothing is the top category in every state.
Average spend per transaction varies: Alaska ($67), Alabama ($59).
Top review ratings: Texas (3.91), Wisconsin (3.89), Iowa (3.85).
### Customer Loyalty
Frequent buyers (10+ purchases): 3,116 customers.
Contribute $185,517 (≈80% of revenue).
Repeat visits strongly correlate with higher total spend.
## Recommendations
### Inventory Strategy
Stock more male clothing while maintaining female options.
Prioritize jackets in fall, sweaters in spring, pants year‑round.
Emphasize beige items in seasonal assortments.
### Location Strategy
Customize stocking per state: clothing dominates everywhere, but average spend differs.
Focus premium stock in Alaska, Pennsylvania, Arizona (higher spend per transaction).
Enhance customer experience in mid‑tier states with loyalty programs.
### Customer Engagement
Target 50+ male customers with tailored promotions.
Strengthen loyalty programs for frequent buyers (3,116 customers).
Encourage occasional buyers to increase frequency via discounts, bundles, or targeted offers.
### Seasonal Promotions
Launch jacket campaigns in fall and sweater promotions in spring.
Highlight beige‑colored items in marketing campaigns to align with customer preferences.
## Conclusion
By aligning inventory with customer demographics, seasonal demand, and loyalty patterns, the store can maximize revenue, reduce dead stock, and improve customer satisfaction. A dual focus on male‑oriented categories and location‑specific stocking strategies will ensure sustainable growth and stronger customer engagement.




    

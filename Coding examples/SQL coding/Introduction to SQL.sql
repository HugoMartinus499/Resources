-- SELECT statement is to select the columns, * means all columns
-- FROM statement is to select the database
-- LIMIT statement is to limit number of rows
-- Always use a ; when executing and statements should be capital letters
-- ORDER BY should always go between FROM and LIMIT, 
-- ORDER BY sorts in ascending order, add DESC to sort in descending order
-- ASC to sort in ascending order, order is determined by what it is next to
-- WHERE statement goes after FROM but before ORDER BY, it is a filtering statement
-- WHERE statement can also be used for non-numeric, just a ' on either side eg. 'Company Name'
-- AS statement can be used to name columns created as a result of arithmetic procedures
-- LIKE statement can be used in conjunction with WHERE to filter for partial filters
-- Using a wildcard like '%' in LIKE statement informs search, 
    -- % before string searches for any number of characters before string, ie. "ends with"
    -- % after string searches for any number of characters after string, ie. "starts with"
    -- % before and after string searches for number of characters before and after, ie. "contains"
-- IN statement can be used in conjunction with WHERE to filter for multiple identifiers, works like "is one of"
-- NOT statement is great in conjunction with LIKE and IN to find all registrations not fitting criteria, works like "is not"
-- AND and BETWEEN  operators are good for intervals and stacking filters
-- OR is great for finding differences in the data, can be used with all other operators using parentheses to stack filters
-- JOIN is used with ON to pull data from multiple tables, ON is used to determine what columnn is used to JOIN the tables
-- Aliases can be used to not have to type out long table names, can be done with the AS statement or with just a space after the name and then the alias
-- It is important to name columns, otherwise they might fuse together when joining
-- LEFT and RIGHT JOIN are effectively interchangable. If the right table contains extra rows, the query can be switched around so the right table is now the left table
-- Filtering using an AND clause when also using LEFT JOIN instead of the WHERE joins all rows but only populates the field of the AND clause when the filter is met
-- NULL occurs most often when data is missing or after a LEFT JOIN, where some rows don't fit the criteria and are therefore not populated
-- Agregate functions should be written after SELECT statement and the following field should be in brackets
-- COUNT function returns number of 
-- COUNT function does not include NULL fields
-- SUM function sums values, can therefore only be used for numeric fields. NULL is treated as 0
-- MIN and MAX can be used on all operators, it returns lowest or highest numeric value, earliest or latest date and closest to A in the alphabet or closest to Z in the alphabet
-- AVG function ignores NULLs, so if NULLS need to be 0, the average must be hardcoded using arithmetic and SUM and COUNT
-- Mean is calculated in SQL using the AVG function, Mode and Median is a bit tricky
-- GROUP BY can be used to aggregate data within subsets of the data. For example, grouping for different accounts, different regions, or different sales representatives
-- The GROUP BY always goes between WHERE and ORDER BY.
-- Any column in the SELECT statement that is not within an aggregator must be in the GROUP BY clause.
-- DISTINCT can be used instead of COUNT and the GROUP BY clause. It works like Number of Unique. NOTE: it can slow down the query significantly when using aggregation
-- HAVING is used as an alternative to the WHERE clause, when filtering on a part of the query that has been created using an aggregate
-- HAVING goes between the GROUP BY and ORDER BY clauses
-- DATE_TRUNC allows you to truncate your date to a particular part of your date-time column. Common trunctions are day, month, and year. 
-- DATE_PART can be useful for pulling a specific portion of a date, but notice pulling month or day of the week (dow) means that you are no longer keeping the years in order. Rather you are grouping for certain components regardless of which year they belonged in.
-- GROUP BY and ORDER BY clauses can reference the columns in the SELECT statement with numbers that follow the order they appear in, in the SELECT statement
-- CASE statements work as ifelse, they follow the syntax: CASE WHEN {event} THEN {outcome} ELSE {different outcome} and must end with END
-- The ELSE statement is optional and when not used, returns NULL
-- CASE statements can be stacked, so as many as you would liked can be used in conjunction before ending with END
-- CASE statements can be used with conditional operators like WHERE, AND and OR
-- Subquerys are tools for performing operations in multiple steps
-- Subquerys need to have aliases, which are added after the parenthesis
-- Use identation to make the querys easier to read, especially as they get progressively more complex
-- Subquerys can be used anywhere a table name might be used
-- WITH can be used to better readability
-- WITH should be defined in the beginning before the outer query
-- When creating multiples tables with WITH, you add a comma after every new table, except for the last one leading into the main query
-- new tables are aliased using "table_name AS" and then the query between parentheses
-- Data cleaning is useful to structure messy data
-- LEFT pulls a specified number of characters for each row in a specified column starting at the beginning (or from the left). As you saw here, you can pull the first three digits of a phone number using LEFT(phone_number, 3).
-- RIGHT pulls a specified number of characters for each row in a specified column starting at the end (or from the right). As you saw here, you can pull the last eight digits of a phone number using RIGHT(phone_number, 8).
-- LENGTH provides the number of characters for each row of a specified column. Here, you saw that we could use this to get the length of each phone number as LENGTH(phone_number).
-- POSITION takes a character and a column, and provides the index where that character is for each row. The index of the first position is 1 in SQL. 
-- If you come from another programming language, many begin indexing at 0. Here, you saw that you can pull the index of a comma as POSITION(',' IN city_state).
-- STRPOS provides the same result as POSITION, but the syntax for achieving those results is a bit different as shown here: STRPOS(city_state, ',').
-- Note, both POSITION and STRPOS are case sensitive, so looking for A is different than looking for a.
-- Therefore, if you want to pull an index regardless of the case of a letter, you might want to use LOWER or UPPER to make all of the characters lower or uppercase.
-- If names are stored in separate columns could be combined together to create a full name: CONCAT(first_name, ' ', last_name) or with piping as first_name || ' ' || last_name.
-- CAST can change the data type
-- TO_DATE can convert text date to number date, like january to 1
-- SUBSTR can be used to extract a substring from a string, following this syntax: SUBSTR(start position, number of characters extracted)
-- COALESCE can replace NULL values


-- CODING Examples --
-- SQL Basics

-- 15 events from web_events
SELECT occurred_at, account_id, channel
	FROM web_events
    LIMIT 15;

-- 10 latest orders from order
SELECT id, occurred_at, total_amt_usd
	FROM orders
ORDER BY occurred_at
    LIMIT 10;

-- 5 largest orders from orders    
SELECT id, account_id, total_amt_usd
	FROM orders
ORDER BY total_amt_usd DESC
    LIMIT 5;

-- 20 smallest orders from orders    
SELECT id, account_id, total_amt_usd
	FROM orders
ORDER BY total_amt_usd
    LIMIT 20;

-- all orders sorted in ascending order by account and then displaying the largest orders per account in descending order
SELECT id, account_id, total_amt_usd
	FROM orders
ORDER BY account_id ASC, total_amt_usd DESC;

-- all orders sorted by largest orders in descending order and then if there is identical amounts, they are sorted by account in ascending order
SELECT id, account_id, total_amt_usd
	FROM orders
ORDER BY total_amt_usd DESC, account_id ASC;

-- 5 first orders and all columns where gloss amount is greater than or equal to 1000 dollars 
SELECT *
	FROM orders
    WHERE gloss_amt_usd >= 1000
    LIMIT 5;

-- 10 first orders and all columns where total amount is less than 500 dollars    
SELECT *
	FROM orders
    WHERE total_amt_usd < 500
    LIMIT 10;

-- Name, website and primary point of contact for Exxon Mobil
SELECT name, website, primary_poc
	FROM accounts
    WHERE name = 'Exxon Mobil';

-- avg unit price for the 10 first orders
SELECT id, account_id, standard_amt_usd/standard_qty AS unit_price
	FROM orders
    LIMIT 10;
    
-- percentage of revenue generated by poster sales
SELECT id, account_id, poster_amt_usd/(standard_amt_usd + poster_amt_usd + gloss_amt_usd)*100 AS perc_poster_rev
	FROM orders;

-- All companies with names that start with 'C'
SELECT *
	FROM accounts
    WHERE name LIKE 'C%';

-- All companies with names that contain the string 'one'
SELECT *
	FROM accounts
    WHERE name LIKE '%one%';

-- All companies with names that end with 's'    
SELECT *
	FROM accounts
    WHERE name LIKE '%s';

-- Name, primary point of contact and sales rep id for Walmart, Target and Nordstrom
SELECT name, primary_poc, sales_rep_id
	FROM accounts
    WHERE name IN ('Walmart', 'Target', 'Nordstrom');

-- All information for individuals contacted through channels organic or adwords   
SELECT *
	FROM web_events
    WHERE channel IN ('organic', 'adwords');

-- Name, primary point of contact and sales rep id for all except Walmart, Target and Nordstrom
SELECT name, primary_poc, sales_rep_id
	FROM accounts
    WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

-- All information for individuals contacted through all channels except organic or adwords   
SELECT *
	FROM web_events
    WHERE channel NOT IN ('organic', 'adwords');

-- All companies with names that do not start with 'C'
SELECT *
	FROM accounts
    WHERE name NOT LIKE 'C%';

-- All companies with names that do not contain the string 'one'
SELECT *
	FROM accounts
    WHERE name NOT LIKE '%one%';

-- All companies with names that do not end with 's'    
SELECT *
	FROM accounts
    WHERE name NOT LIKE '%s';

-- all orders where standard_qty is over thousand and poster_qty and gloss_qty is 0
SELECT *
	FROM orders
    WHERE standard_qty >1000 
        AND poster_qty = 0 
        AND gloss_qty = 0;

-- all companies whose name does not start with c and ends with s  
SELECT *
	FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s';

-- order date and gloss_qty for all gloss_qty between 24 and 29 in descending order to see if values at endpoint are included    
SELECT occurred_at, gloss_qty
	FROM orders
    WHERE gloss_qty BETWEEN 24 AND 29
ORDER BY gloss_qty DESC;
    -- answer is that yes it includes values at endpoint

-- all information on  individuals who where contacted through organic or adwords channel and started their account sometime in 2016 sorted newest to oldest    
SELECT *
	FROM web_events
    WHERE channel IN ('organic', 'adwords') 
    AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;

-- List of orders where standard_qty is zero and either gloss_qty or poster_qty is greater than 1000
SELECT *
	FROM orders
    WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);
    
-- all company names that start with C or W and the primary contact contains ana or Ana, but does not contain eana
SELECT name
	FROM accounts
    WHERE (name LIKE 'C%' OR name LIKE 'W%') 
        AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') 
        AND primary_poc NOT LIKE '%eana%');


-- JOIN SQL

-- Pulling all data from accounts and joining orders by account id
SELECT accounts.*, orders.*
	FROM accounts
    JOIN orders 
        ON accounts.id = orders.account_id;
    
-- Pulling all qty from orders and joining the website and primary_poc from accounts
SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.website, accounts.primary_poc
	FROM orders
    JOIN accounts
        ON orders.account_id = accounts.id;

-- Webevents with time, channel, poc and name for walmart
SELECT we.occurred_at, we.channel, a.primary_poc, a.name
    FROM web_events we
    JOIN accounts a
        ON we.account_id = a.id
    WHERE a.name = 'Walmart';

-- Sales reps and their region and account sorted A-Z
SELECT r.name region, s.name rep, a.name account
    FROM sales_reps s
    JOIN region r
        ON s.region_id = r.id
    JOIN accounts a
        ON a.sales_rep_id = s.id
ORDER BY a.name;

-- Region for every order, unit price and account name
SELECT r.name region, a.name account, 
           o.total_amt_usd/(o.total + 0.01) unit_price
    FROM region r
    JOIN sales_reps s
        ON s.region_id = r.id
    JOIN accounts a
        ON a.sales_rep_id = s.id
    JOIN orders o
        ON o.account_id = a.id;

-- Table with midwest region, rep name and account sorted A-Z
SELECT r.name Region, s.name Rep, a.name Account
	FROM sales_reps s
	JOIN region r
		ON r.id = s.region_id
	JOIN accounts a
		ON s.id = a.sales_rep_id
	WHERE r.name = 'Midwest'
ORDER BY a.name;

-- Table with midwest region, rep first names starting with S and account sorted A-Z
SELECT r.name Region, s.name Rep, a.name Account
	FROM sales_reps s
	JOIN region r
		ON r.id = s.region_id
	JOIN accounts a
		ON s.id = a.sales_rep_id
	WHERE r.name = 'Midwest'
		AND s.name LIKE 'S%'
ORDER BY a.name;

-- Table with midwest region, rep last names starting with K and account sorted A-Z
SELECT r.name Region, s.name Rep, a.name Account
	FROM sales_reps s
	JOIN region r
		ON r.id = s.region_id
	JOIN accounts a
		ON s.id = a.sales_rep_id
	WHERE r.name = 'Midwest'
		AND s.name LIKE '%K%'
		AND s.name NOT LIKE 'K%'
ORDER BY a.name;

-- Region for every order, unit price and account name for standard_qty over 100
SELECT r.name region, a.name account, 
           o.total_amt_usd/(o.total + 0.01) unit_price
    FROM region r
    JOIN sales_reps s
        ON s.region_id = r.id
    JOIN accounts a
        ON a.sales_rep_id = s.id
    JOIN orders o
        ON o.account_id = a.id
    WHERE o.standard_qty > 100;
    
-- Region for every order, unit price and account name for standard_qty over 100 and poster_qty over 50 sorted ascending by unit price
SELECT r.name region, a.name account, 
           o.total_amt_usd/(o.total + 0.01) unit_price
    FROM region r
    JOIN sales_reps s
        ON s.region_id = r.id
    JOIN accounts a
        ON a.sales_rep_id = s.id
    JOIN orders o
        ON o.account_id = a.id
    WHERE o.standard_qty > 100
    	AND o.poster_qty > 50
ORDER BY unit_price;
        
-- Region for every order, unit price and account name for standard_qty over 100 and poster_qty over 50, sorted descendingly
SELECT r.name region, a.name account, 
           o.total_amt_usd/(o.total + 0.01) unit_price
    FROM region r
    JOIN sales_reps s
        ON s.region_id = r.id
    JOIN accounts a
        ON a.sales_rep_id = s.id
    JOIN orders o
        ON o.account_id = a.id
    WHERE o.standard_qty > 100
    	AND o.poster_qty > 50
ORDER BY unit_price DESC;

-- Unique channels used by account id 1001
SELECT DISTINCT a.name Account, w.channel Channel
	FROM accounts a
    JOIN web_events w
    	ON a.id = w.account_id
    AND a.id = 1001;
    
-- All orders from 2015
SELECT o.occurred_at, o.total, o.total_amt_usd Amount, a.name Account
	FROM orders o
    JOIN accounts a
    	ON a.id = o.account_id
    WHERE o.occurred_at BETWEEN '2015-01-01' AND '2016-01-01';

-- Agregate data --

-- Two ways to count number of accounts, returning same value
SELECT COUNT(*)
	FROM accounts;

SELECT COUNT(accounts.id)
	FROM accounts;

-- total amount of poster paper ordered
SELECT SUM(poster_qty) AS posters
	FROM orders;
    
-- total amount of standard paper ordered
SELECT SUM(standard_qty) AS standard
	FROM orders;
    
-- Total revenue from sales in USD
SELECT SUM(total_amt_usd) as Revenue
	FROM orders;
    
-- Total amount spent per order on standard and gloss
SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
    FROM orders;
    
 -- avg standard unit price
SELECT SUM(standard_amt_usd) / SUM(standard_qty) AS standard_amt_per_unit
	FROM orders;

-- Earliest order placest
SELECT MIN(occurred_at) AS earliest_order
	FROM orders;
 
-- Earliest order without aggregation
SELECT occurred_at
	FROM orders
    ORDER BY occurred_at ASC;
    
-- Latest webevent
SELECT MAX(occurred_at) AS latest_webevent
	FROM web_events;

-- Latest webevent without aggregate
SELECT occurred_at
	FROM web_events
    ORDER BY occurred_at DESC;
    
-- Average amount spent per order of each paper type as well as average amount of each papertype purchased per order
SELECT AVG(standard_qty) mean_standard, AVG(gloss_qty) mean_gloss, 
              AVG(poster_qty) mean_poster, AVG(standard_amt_usd) mean_standard_usd, 
              AVG(gloss_amt_usd) mean_gloss_usd, AVG(poster_amt_usd) mean_poster_usd
    FROM orders;

-- Median total_usd spent on all orders (Hardcoded as median is out of scope for now)
SELECT *
    FROM (SELECT total_amt_usd
         FROM orders
         ORDER BY total_amt_usd
         LIMIT 3457) AS Table1
    ORDER BY total_amt_usd DESC
LIMIT 2;
-- Since there are 6912 orders - we want the average of the 3457 and 3456 order amounts when ordered. 
-- This is the average of 2483.16 and 2482.55. This gives the median of 2482.855.
-- This obviously isn't an ideal way to compute. If we obtain new orders, we would have to change the limit. 
-- SQL didn't even calculate the median for us. 
-- The above used a SUBQUERY, but you could use any method to find the two necessary values, and then you just need the average of them.

-- Account placing the earliest order
SELECT a.name, o.occurred_at
    FROM accounts a
    JOIN orders o
        ON a.id = o.account_id
    ORDER BY occurred_at
LIMIT 1;

-- Total sales of each account
SELECT a.name, SUM(total_amt_usd) total_sales
    FROM orders o
    JOIN accounts a
        ON a.id = o.account_id
    GROUP BY a.name;

-- Channel and account of latest web event
SELECT w.occurred_at, w.channel, a.name
    FROM web_events w
    JOIN accounts a
        ON w.account_id = a.id 
    ORDER BY w.occurred_at DESC
LIMIT 1;

-- Total number of times each channel for web events was used
SELECT w.channel, COUNT(*)
    FROM web_events w
    GROUP BY w.channel

-- Primary contact associated with earliest web event
SELECT a.primary_poc
    FROM web_events w
    JOIN accounts a
        ON a.id = w.account_id
    ORDER BY w.occurred_at
LIMIT 1;

-- Smallest order placed by each account
SELECT a.name, MIN(total_amt_usd) smallest_order
    FROM accounts a
    JOIN orders o
        ON a.id = o.account_id
    GROUP BY a.name
    ORDER BY smallest_order;

-- Number of sales reps in each region
SELECT r.name, COUNT(*) num_reps
    FROM region r
    JOIN sales_reps s
        ON r.id = s.region_id
    GROUP BY r.name
    ORDER BY num_reps;

-- Avg amount of each paper type for each account
SELECT a.name, AVG(o.standard_qty) avg_stand, AVG(o.gloss_qty) avg_gloss, AVG(o.poster_qty) avg_post
	FROM accounts a
	JOIN orders o
			ON a.id = o.account_id
	GROUP BY a.name;
    
-- Avg amount spent on each paper type per order for each account
SELECT a.name, AVG(o.standard_amt_usd) avg_stand, AVG(o.gloss_amt_usd) avg_gloss, AVG(o.poster_amt_usd) avg_post
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	GROUP BY a.name;

-- Number of times a channel was used for each sales rep sorted descending
SELECT s.name, w.channel, COUNT(*) num_events
	FROM accounts a
    JOIN web_events w
    	ON a.id = w.account_id
    JOIN sales_reps s
    	ON a.sales_rep_id = s.id
    GROUP BY s.name, w.channel
    ORDER BY num_events DESC;
    
-- Number of times a channel was used for each region sorted descending
SELECT r.name AS region, w.channel, COUNT(*) num_events
		FROM accounts a
    JOIN web_events w
    	ON a.id = w.account_id
    JOIN sales_reps s
    	ON a.sales_rep_id = s.id
    JOIN region r
    	ON s.region_id = r.id
    GROUP BY region, w.channel
    ORDER BY num_events DESC;

-- Using DISTINCT to see if any accounts are associated with more than one region
SELECT a.id as "account id", r.id as "region id", 
a.name as "account name", r.name as "region name"
	FROM accounts a
	JOIN sales_reps s
		ON s.id = a.sales_rep_id
	JOIN region r
		ON r.id = s.region_id;

SELECT DISTINCT id, name
	FROM accounts; 
-- Both return 351 rows, meaning that no accounts are associated with more than one region

-- Sales reps working on more than one account
SELECT s.id, s.name, COUNT(*) num_accounts
	FROM accounts a
    JOIN sales_reps s
    	ON a.sales_rep_id = s.id
    GROUP BY s.id, s.name
    ORDER BY num_accounts;
    
SELECT DISTINCT id, name
FROM sales_reps;
-- 50 sales reps

-- Sales reps having more than 5 accounts sorted descending
SELECT s.name, COUNT(*) num_accounts
	FROM sales_reps s
    JOIN accounts a
    	ON s.id = a.sales_rep_id
    GROUP BY s.name
    HAVING COUNT(*) > 5
    ORDER BY num_accounts DESC; -- 34 salesreps

-- Using subquery for the above question
SELECT COUNT(*) num_reps_above5
	FROM(SELECT s.id, s.name, COUNT(*) num_accounts
        FROM accounts a
        JOIN sales_reps s
        	ON s.id = a.sales_rep_id
        GROUP BY s.id, s.name
        HAVING COUNT(*) > 5
        ORDER BY num_accounts) AS Table1;
    
-- Accounts with more than 20 orders sorted descending
SELECT a.name, COUNT(*) num_orders
	FROM accounts a
    JOIN orders o
    	ON a.id = o.account_id
    GROUP BY a.name
    HAVING COUNT(*) > 20
    ORDER BY num_orders DESC; -- 120 accounts
    
-- account with most orders
-- Using same query as before sorted descendingly "Leucadia National" has the most with 71 orders
-- Using a different query to only show the the account with the most orders
SELECT a.id, a.name, COUNT(*) num_orders
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	GROUP BY a.id, a.name
	ORDER BY num_orders DESC
LIMIT 1;

-- Accounts spending more than 30k USD across all orders
SELECT a.name, SUM(o.total_amt_usd) total_spenditure
	FROM accounts a
    JOIN orders o
    	ON a.id = o.account_id
    GROUP BY a.name
    HAVING SUM(total_amt_usd)>30000
    ORDER BY total_spenditure DESC;
    
-- Account with under 1k USD across all orders
SELECT a.name, SUM(o.total_amt_usd) total_spenditure
	FROM accounts a
    JOIN orders o
    	ON a.id = o.account_id
    GROUP BY a.name
    HAVING SUM(total_amt_usd)<1000
    ORDER BY total_spenditure;
    
-- Account spending the most
SELECT a.name, SUM(o.total_amt_usd) total_spenditure
	FROM accounts a
    JOIN orders o
    	ON a.id = o.account_id
    GROUP BY a.name
    ORDER BY total_spenditure DESC
LIMIT 1;

-- Account spending the least
SELECT a.name, SUM(o.total_amt_usd) total_spenditure
	FROM accounts a
    JOIN orders o
    	ON a.id = o.account_id
    GROUP BY a.name
    ORDER BY total_spenditure
LIMIT 1;

-- Accounts using facebook as a channel to contact customers more than 6 times
SELECT a.name, w.channel, COUNT(*) num_contacts
	FROM accounts a
    JOIN web_events w
    	ON a.id = w.account_id
    GROUP BY a.name, w.channel
    HAVING w.channel = 'facebook' 
    	AND COUNT(*) > 6
    ORDER BY num_contacts DESC;
    
-- Account using facebook the most
SELECT a.name, w.channel, COUNT(*) num_contacts
	FROM accounts a
    JOIN web_events w
    	ON a.id = w.account_id
    GROUP BY a.name, w.channel
    HAVING w.channel = 'facebook' 
    	AND COUNT(*) > 6
    ORDER BY num_contacts DESC
LIMIT 1;

-- Channel most frequently used
SELECT a.name, w.channel, COUNT(*) num_contacts
	FROM accounts a
    JOIN web_events w
    	ON a.id = w.account_id
    GROUP BY a.name, w.channel
    ORDER BY num_contacts DESC
LIMIT 10;

-- Total sales per year
SELECT DATE_PART('year', occurred_at) ord_year,  SUM(total_amt_usd) total_spent
	FROM orders
	GROUP BY 1
	ORDER BY 2 DESC;
-- The sales increase every year, except for 2017, Which might be due to the year not being finished in the dataset. 2013 and 2017 have less months available, only month 12 for 2013 and month 1 for 2017.

-- Total sales per month
SELECT DATE_PART('month', occurred_at) ord_month,  SUM(total_amt_usd) total_spent
	FROM orders
	WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
	GROUP BY 1
	ORDER BY 2 DESC;
-- Removed 2013 and 2017 as they each add one extra entry on either side of the scale. Month twelve has the highest revenue.

-- Total number of orders per year
SELECT DATE_PART('year', occurred_at) ord_year, COUNT(*) num_orders
	FROM orders	
    GROUP BY 1
    ORDER BY 2 DESC;
-- 2013 and 2017 ave only one month each, so they should be out

-- Total number of order per year excl. 2013 and 2017
SELECT DATE_PART('year', occurred_at) ord_year, COUNT(*) num_orders
	FROM orders	
    WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
    GROUP BY 1
    ORDER BY 2 DESC;
-- 2016 has the most orders

-- Total order per month excl 2013 and 2017
SELECT DATE_PART('month', occurred_at) ord_month, COUNT(*) num_orders
	FROM orders	
    WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
    GROUP BY 1
    ORDER BY 2 DESC;
-- Excluding 2013 and 2017, month 12 has the most orders

-- Month and year that Walmart spend most on gloss paper
SELECT DATE_TRUNC('month', o.occurred_at) ord_date, SUM(o.gloss_amt_usd) tot_spent
	FROM orders o 
	JOIN accounts a
		ON a.id = o.account_id
	WHERE a.name = 'Walmart'
	GROUP BY 1
	ORDER BY 2 DESC
LIMIT 1;
-- May 2016

-- Unit price for each account, fix with CASE (earlier assignment)
SELECT account_id, 
	CASE WHEN standard_qty = 0 OR standard_qty IS NULL 
    	THEN 0
		ELSE standard_amt_usd/standard_qty 
    END AS unit_price
	FROM orders;

-- Orders with account, level and amount
SELECT account_id, total_amt_usd, 
		CASE 
   			WHEN total_amt_usd > 3000 THEN 'Large'
   			ELSE 'Small' 
            END AS order_level
   	FROM orders;
   
-- Number of orders in 3 categories
SELECT CASE 
		WHEN total >= 2000 THEN 'At Least 2000'
		WHEN total >= 1000 AND total < 2000 THEN 'Between 1000 and 2000'
    	ELSE 'Less than 1000' 
        END AS order_category,
	COUNT(*) AS order_count
	FROM orders
	GROUP BY 1;

-- Ranking customers based on spend
SELECT a.name, SUM(total_amt_usd) total_spent, 
        CASE 
        	WHEN SUM(total_amt_usd) > 200000 THEN 'top'
        	WHEN  SUM(total_amt_usd) > 100000 THEN 'middle'
        	ELSE 'low' 
            END AS customer_level
	FROM orders o
	JOIN accounts a
		ON o.account_id = a.id 
	GROUP BY a.name
	ORDER BY 2 DESC;
    
-- Ranking customers in 2016 and 2017
SELECT a.name, SUM(total_amt_usd) total_spent, 
        CASE 
        	WHEN SUM(total_amt_usd) > 200000 THEN 'top'
        	WHEN  SUM(total_amt_usd) > 100000 THEN 'middle'
        	ELSE 'low' 
            END AS customer_level
	FROM orders o
	JOIN accounts a
		ON o.account_id = a.id 
    WHERE occurred_at > '2015-12-31'
	GROUP BY a.name
	ORDER BY 2 DESC;
    
-- Top performing sales reps based on orders
SELECT s.name, COUNT(*) num_ords,
		CASE 
    		WHEN COUNT(*) > 200 THEN 'top'
        	ELSE 'not' 
        	END AS sales_rep_level
	FROM orders o
	JOIN accounts a
		ON o.account_id = a.id 
	JOIN sales_reps s
		ON s.id = a.sales_rep_id
	GROUP BY s.name
	ORDER BY 2 DESC;
    
-- Top performing sales reps based on amount or orders
SELECT s.name, COUNT(*) num_ords, SUM(o.total_amt_usd) total,
		CASE 
    		WHEN COUNT(*) > 200 OR SUM(o.total_amt_usd) > 750000 THEN 'top'
            WHEN COUNT(*) > 150 OR SUM(o.total_amt_usd) > 500000 THEN 'middle'
        	ELSE 'not' 
        	END AS sales_rep_level
	FROM orders o
	JOIN accounts a
		ON o.account_id = a.id 
	JOIN sales_reps s
		ON s.id = a.sales_rep_id
	GROUP BY s.name
	ORDER BY 3 DESC;

-- Subquerys and temporary tables

-- Number of events for each day for each channel. 
SELECT DATE_TRUNC('day', occurred_at) AS day, 
    channel, 
    COUNT(*) AS event_count
        FROM web_events
        GROUP BY 1,2
        ORDER BY event_count DESC;

-- subquery returning output of first query
SELECT *
    FROM 
    (SELECT DATE_TRUNC('day', occurred_at) AS day, channel, COUNT(*) AS event_count
        FROM web_events
        GROUP BY 1,2
        ORDER BY event_count DESC) sub;

-- Average number of events for each day for each channel
SELECT channel, AVG(event_count) AS avg_event_count
    FROM 
    (SELECT DATE_TRUNC('day', occurred_at) AS day, channel, COUNT(*) AS event_count
        FROM web_events
        GROUP BY 1,2) sub
        GROUP BY 1
    ORDER BY 2 DESC;
-- Breaking out by day in the first query makes the subquery give average for each day

-- The average amount of each papertype sold on the first month that any order was placed in the orders table (in terms of quantity)
SELECT AVG(standard_qty) avg_std, AVG(gloss_qty) avg_gls, AVG(poster_qty) avg_pst
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = 
     (SELECT DATE_TRUNC('month', MIN(occurred_at)) FROM orders);

-- The total amount spent on all orders on the first month that any order was placed in the orders table (in terms of usd).
SELECT SUM(total_amt_usd)
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = 
      (SELECT DATE_TRUNC('month', MIN(occurred_at)) FROM orders);

-- Name of sales rep in each region with the largest amount of usd
-- First name of sales rep and region with usd
SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
    FROM sales_reps s
    JOIN accounts a
        ON a.sales_rep_id = s.id
    JOIN orders o
        ON o.account_id = a.id
    JOIN region r
        ON r.id = s.region_id
    GROUP BY 1,2
ORDER BY 3 DESC;

-- Then max the total amount
SELECT region_name, MAX(total_amt) total_amt
    FROM(SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
            FROM sales_reps s
            JOIN accounts a
                ON a.sales_rep_id = s.id
            JOIN orders o
                ON o.account_id = a.id
            JOIN region r
                ON r.id = s.region_id
            GROUP BY 1, 2) t1
            GROUP BY 1;

-- Lastly, subquery to put it all together
SELECT t3.rep_name, t3.region_name, t3.total_amt
    FROM(SELECT region_name, MAX(total_amt) total_amt
            FROM(SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
                    FROM sales_reps s
                    JOIN accounts a
                        ON a.sales_rep_id = s.id
                    JOIN orders o
                        ON o.account_id = a.id
                    JOIN region r
                        ON r.id = s.region_id
                GROUP BY 1, 2) t1
                GROUP BY 1) t2
JOIN (SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
        FROM sales_reps s
        JOIN accounts a
            ON a.sales_rep_id = s.id
        JOIN orders o
            ON o.account_id = a.id
        JOIN region r
            ON r.id = s.region_id
        GROUP BY 1,2
    ORDER BY 3 DESC) t3
        ON t3.region_name = t2.region_name AND t3.total_amt = t2.total_amt;

-- Orders placed in the region with the largest sale sum
-- First total sales in each region
SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
    FROM sales_reps s
    JOIN accounts a
        ON a.sales_rep_id = s.id
    JOIN orders o
        ON o.account_id = a.id
    JOIN region r
        ON r.id = s.region_id
    GROUP BY r.name;

-- Then finding the max amount using subquery
SELECT MAX(total_amt)
    FROM (SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
            FROM sales_reps s
            JOIN accounts a
                ON a.sales_rep_id = s.id
            JOIN orders o
                ON o.account_id = a.id
            JOIN region r
                ON r.id = s.region_id
            GROUP BY r.name) sub;
                
-- Finally using subquery, count total orders
SELECT r.name, COUNT(o.total) total_orders
    FROM sales_reps s
    JOIN accounts a
        ON a.sales_rep_id = s.id
    JOIN orders o
        ON o.account_id = a.id
    JOIN region r
        ON r.id = s.region_id
    GROUP BY r.name
HAVING SUM(o.total_amt_usd) = (
         SELECT MAX(total_amt)
            FROM (SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
                    FROM sales_reps s
                    JOIN accounts a
                        ON a.sales_rep_id = s.id
                    JOIN orders o
                        ON o.account_id = a.id
                    JOIN region r
                        ON r.id = s.region_id
                    GROUP BY r.name) sub);
                 
-- Number of accounts with more total purchases than account with largest standard qty paper bought
-- First account and total qty
SELECT a.name account_name, SUM(o.standard_qty) total_std, SUM(o.total) total
    FROM accounts a
    JOIN orders o
        ON o.account_id = a.id
    GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- Then all accounts with more purchases
SELECT a.name
    FROM orders o
    JOIN accounts a
        ON a.id = o.account_id
    GROUP BY 1
HAVING SUM(o.total) > (SELECT total 
                        FROM (SELECT a.name act_name, SUM(o.standard_qty) tot_std, SUM(o.total) total
                                FROM accounts a
                                JOIN orders o
                                    ON o.account_id = a.id
                                GROUP BY 1
                            ORDER BY 2 DESC
                            LIMIT 1) sub);
                            
-- Finally number of accounts
SELECT COUNT(*)
    FROM (SELECT a.name
            FROM orders o
            JOIN accounts a
                ON a.id = o.account_id
            GROUP BY 1
          HAVING SUM(o.total) > (SELECT total 
                      FROM (SELECT a.name act_name, SUM(o.standard_qty) tot_std, SUM(o.total) total
                                FROM accounts a
                                JOIN orders o
                                    ON o.account_id = a.id
                                GROUP BY 1
                            ORDER BY 2 DESC
                            LIMIT 1) inner_tab)
                ) counter_tab;
                
-- Web events for each channel of customer with largest total spend
-- First customer with most lifetime spend
SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
    FROM orders o
    JOIN accounts a
        ON a.id = o.account_id
    GROUP BY a.id, a.name
ORDER BY 3 DESC
LIMIT 1;

-- Then number of web events in each channel
SELECT a.name, w.channel, COUNT(*)
    FROM accounts a
    JOIN web_events w
        ON a.id = w.account_id AND a.id =  (SELECT id
                        FROM (SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
                                FROM orders o
                                JOIN accounts a
                                    ON a.id = o.account_id
                                GROUP BY a.id, a.name
                              ORDER BY 3 DESC
                              LIMIT 1) inner_table)
    GROUP BY 1, 2
ORDER BY 3 DESC;

-- Average lifetime spend for top 10 spending accounts
-- First find top 10 spending accounts
SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
    FROM orders o
    JOIN accounts a
        ON a.id = o.account_id
    GROUP BY a.id, a.name
ORDER BY 3 DESC
LIMIT 10;

-- Then average their spending
SELECT AVG(tot_spent)
    FROM (SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
            FROM orders o
            JOIN accounts a
                ON a.id = o.account_id
            GROUP BY a.id, a.name
         ORDER BY 3 DESC
         LIMIT 10) temp;

-- Lifetime average spend for companies spending more than average
-- First average all accounts
SELECT AVG(o.total_amt_usd) avg_all 
    FROM orders o;

-- Then, we want to only pull the accounts with more than this average amount. 
SELECT o.account_id, AVG(o.total_amt_usd) 
    FROM orders o 
    GROUP BY 1 
HAVING AVG(o.total_amt_usd) > (SELECT AVG(o.total_amt_usd) avg_all 
                                    FROM orders o); 

-- Finally, we just want the average of these values.
SELECT AVG(avg_amt) 
    FROM (SELECT o.account_id, AVG(o.total_amt_usd) avg_amt 
            FROM orders o 
            GROUP BY 1 
        HAVING AVG(o.total_amt_usd) > (SELECT AVG(o.total_amt_usd) avg_all 
                                            FROM orders o)) temp_table 

-- average number of events for each channel per day with the WITH statement
-- first the inner query
SELECT DATE_TRUNC('day',occurred_at) AS day, 
       channel, COUNT(*) as events
FROM web_events 
GROUP BY 1,2

-- then entering it into the WITH statement
WITH events AS (
          SELECT DATE_TRUNC('day',occurred_at) AS day, 
                        channel, COUNT(*) as events
          FROM web_events 
          GROUP BY 1,2)

-- The full query
WITH events AS (
          SELECT DATE_TRUNC('day',occurred_at) AS day, 
                        channel, COUNT(*) as events
          FROM web_events 
          GROUP BY 1,2)

SELECT channel, AVG(events) AS average_events
FROM events
GROUP BY channel
ORDER BY 2 DESC;

-- WITH statement is unlimited and can create many tables to use
WITH table1 AS (
          SELECT *
          FROM web_events),

     table2 AS (
          SELECT *
          FROM accounts)


SELECT *
FROM table1
JOIN table2
ON table1.account_id = table2.id;


-- Subquery mania, but WITH

-- Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.
WITH t1 AS (
     SELECT s.name rep_name, r.name region_name, SUM(o.total_amt_usd) total_amt
      FROM sales_reps s
      JOIN accounts a
      ON a.sales_rep_id = s.id
      JOIN orders o
      ON o.account_id = a.id
      JOIN region r
      ON r.id = s.region_id
      GROUP BY 1,2
      ORDER BY 3 DESC), 
t2 AS (
      SELECT region_name, MAX(total_amt) total_amt
      FROM t1
      GROUP BY 1)
SELECT t1.rep_name, t1.region_name, t1.total_amt
FROM t1
JOIN t2
ON t1.region_name = t2.region_name AND t1.total_amt = t2.total_amt;

-- For the region with the largest sales total_amt_usd, how many total orders were placed?
WITH t1 AS (
      SELECT r.name region_name, SUM(o.total_amt_usd) total_amt
      FROM sales_reps s
      JOIN accounts a
      ON a.sales_rep_id = s.id
      JOIN orders o
      ON o.account_id = a.id
      JOIN region r
      ON r.id = s.region_id
      GROUP BY r.name), 
t2 AS (
      SELECT MAX(total_amt)
      FROM t1)
SELECT r.name, COUNT(o.total) total_orders
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name
HAVING SUM(o.total_amt_usd) = (SELECT * FROM t2);

-- For the account that purchased the most (in total over their lifetime as a customer) standard_qty paper, how many accounts still had more in total purchases?
WITH t1 AS (
      SELECT a.name account_name, SUM(o.standard_qty) total_std, SUM(o.total) total
      FROM accounts a
      JOIN orders o
      ON o.account_id = a.id
      GROUP BY 1
      ORDER BY 2 DESC
      LIMIT 1), 
t2 AS (
      SELECT a.name
      FROM orders o
      JOIN accounts a
      ON a.id = o.account_id
      GROUP BY 1
      HAVING SUM(o.total) > (SELECT total FROM t1))
SELECT COUNT(*)
FROM t2;

-- For the customer that spent the most (in total over their lifetime as a customer) total_amt_usd, how many web_events did they have for each channel?
WITH t1 AS (
      SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
      FROM orders o
      JOIN accounts a
      ON a.id = o.account_id
      GROUP BY a.id, a.name
      ORDER BY 3 DESC
      LIMIT 1)
SELECT a.name, w.channel, COUNT(*)
FROM accounts a
JOIN web_events w
ON a.id = w.account_id AND a.id =  (SELECT id FROM t1)
GROUP BY 1, 2
ORDER BY 3 DESC;

-- What is the lifetime average amount spent in terms of total_amt_usd for the top 10 total spending accounts?
WITH t1 AS (
      SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
      FROM orders o
      JOIN accounts a
      ON a.id = o.account_id
      GROUP BY a.id, a.name
      ORDER BY 3 DESC
      LIMIT 10)
SELECT AVG(tot_spent)
FROM t1;

-- What is the lifetime average amount spent in terms of **total_amt_usd**, including only the companies that spent more per order, on average, than the average of all orders.
WITH t1 AS ( 
    SELECT AVG(o.total_amt_usd) avg_all 
    FROM orders o 
    JOIN accounts a 
    ON a.id = o.account_id), 
t2 AS ( 
    SELECT o.account_id, AVG(o.total_amt_usd) avg_amt 
    FROM orders o 
    GROUP BY 1 
    HAVING AVG(o.total_amt_usd) > (SELECT * FROM t1)) 
    SELECT AVG(avg_amt) 
    FROM t2;


-- Data cleaning

-- Number of companies with each domain
SELECT RIGHT(website, 3) AS domain, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;

-- Number of companies that start with each letter
SELECT LEFT(UPPER(name), 1) AS first_letter, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;

-- Companies that start with letters and numbers
SELECT SUM(num) nums, SUM(letter) letters
FROM (SELECT name, CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9') 
                          THEN 1 ELSE 0 END AS num, 
            CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9') 
                          THEN 0 ELSE 1 END AS letter
         FROM accounts) t1;

-- Companies that start with vowels vs other charcters
SELECT SUM(vowels) vowels, SUM(other) other
FROM (SELECT name, CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U') 
                           THEN 1 ELSE 0 END AS vowels, 
             CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U') 
                          THEN 0 ELSE 1 END AS other
            FROM accounts) t1;

-- Use the accounts table to create first and last name columns that hold the first and last names for the primary_poc.
SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name, 
   RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name
FROM accounts;
                                                   
-- Now see if you can do the same thing for every rep name in the sales_reps table. Again provide first and last name columns.
SELECT LEFT(name, STRPOS(name, ' ') -1 ) first_name, 
   RIGHT(name, LENGTH(name) - STRPOS(name, ' ')) last_name
FROM sales_reps;

-- Create an email address for each primary_poc. The email address should be the first name of the primary_poc . last name primary_poc @ company name .com.
WITH t1 AS (
    SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
    FROM accounts)
SELECT first_name, last_name, CONCAT(LOWER(first_name), '.', LOWER(last_name), '@', LOWER(name), '.com')
FROM t1;

-- Remove spaces in email adresses
WITH t1 AS (
    SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
    FROM accounts)
SELECT first_name, last_name, CONCAT(LOWER(first_name), '.', LOWER(last_name), '@', REPLACE(LOWER(name), ' ', ''), '.com')
FROM t1;

-- We would also like to create an initial password, which they will change after their first log in. 
-- The first password will be the first letter of the primary_poc's first name (lowercase), 
-- then the last letter of their first name (lowercase), the first letter of their last name (lowercase), 
-- the last letter of their last name (lowercase), the number of letters in their first name, 
-- the number of letters in their last name, and then the name of the company they are working with, 
-- all capitalized with no spaces.
WITH t1 AS (
    SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
    FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com'), 
    LEFT(LOWER(first_name), 1) || RIGHT(LOWER(first_name), 1) || LEFT(LOWER(last_name), 1) || RIGHT(LOWER(last_name), 1) || LENGTH(first_name) || LENGTH(last_name) || REPLACE(UPPER(name), ' ', '') password
FROM t1;

-- Write a query to look at the top ten rows of a dataset
SELECT *
    FROM sf_crime_data
LIMIT 10;

-- Write a query to convert the date to the right format
SELECT date orig_date, (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2)) new_date
    FROM sf_crime_data;

-- Use cast or :: to convert to a date
SELECT date orig_date, (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2)):: date new_date
    FROM sf_crime_data;

SELECT date orig_date, CAST((SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2)) AS date) new_date
FROM sf_crime_data;

-- Progressions of filling in missing data
SELECT *
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT COALESCE(o.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, o.*
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT COALESCE(o.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, o.standard_qty, o.gloss_qty, o.poster_qty, o.total, o.standard_amt_usd, o.gloss_amt_usd, o.poster_amt_usd, o.total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT COALESCE(o.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, COALESCE(o.standard_qty, 0) standard_qty, COALESCE(o.gloss_qty,0) gloss_qty, COALESCE(o.poster_qty,0) poster_qty, COALESCE(o.total,0) total, COALESCE(o.standard_amt_usd,0) standard_amt_usd, COALESCE(o.gloss_amt_usd,0) gloss_amt_usd, COALESCE(o.poster_amt_usd,0) poster_amt_usd, COALESCE(o.total_amt_usd,0) total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT COUNT(*)
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id;

SELECT COALESCE(o.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, COALESCE(o.standard_qty, 0) standard_qty, COALESCE(o.gloss_qty,0) gloss_qty, COALESCE(o.poster_qty,0) poster_qty, COALESCE(o.total,0) total, COALESCE(o.standard_amt_usd,0) standard_amt_usd, COALESCE(o.gloss_amt_usd,0) gloss_amt_usd, COALESCE(o.poster_amt_usd,0) poster_amt_usd, COALESCE(o.total_amt_usd,0) total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id;


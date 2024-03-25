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
-- The sales increase every year, except for 2017, ehich might be due to the year not being finished in the dataset. 2013 and 2017 have less months available, only month 12 for 2013 and month 1 for 2017.

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
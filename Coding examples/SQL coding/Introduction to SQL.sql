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

-- All companies with names start start with 'C'
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
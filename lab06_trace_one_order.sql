-- the storage, every recorded order
SELECT order_no, order_date, customer, amount
FROM daily_order
ORDER BY order_date, order_no;

-- the processing and output, each day's total from its rows
SELECT order_date, SUM(amount) AS day_total
FROM daily_order
GROUP BY order_date
ORDER BY order_date;

-- one number vouched backward, the October 5 total to its rows
SELECT order_no, customer, amount
FROM daily_order
WHERE order_date = DATE '2026-10-05'
ORDER BY order_no;
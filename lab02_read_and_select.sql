-- the whole population, every keyed order
SELECT order_no, customer, amount FROM daily_order ORDER BY order_no;

-- one customer's orders only
SELECT order_no, order_date, amount
FROM daily_order
WHERE customer = 'Oak Cafe';

-- the day's orders only, October 5
SELECT order_no, customer, amount
FROM daily_order
WHERE order_date = DATE '2026-10-05'
ORDER BY order_no;
-- before the change, the row as recorded
SELECT order_no, customer, amount
FROM daily_order
WHERE order_no = 1;

-- the correction, aimed at one row by its order number
UPDATE daily_order
SET amount = 150.00
WHERE order_no = 1;

-- after the change, the same row read again
SELECT order_no, customer, amount
FROM daily_order
WHERE order_no = 1;
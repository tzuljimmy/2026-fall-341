-- the correction aimed at a row that does not exist
UPDATE daily_order
SET amount = 60.00
WHERE order_no = 99;

-- the table read again, unchanged
SELECT order_no, customer, amount
FROM daily_order
ORDER BY order_no;
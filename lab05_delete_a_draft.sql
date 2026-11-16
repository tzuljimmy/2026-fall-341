-- the draft row, keyed for practice and labeled as a draft
INSERT INTO daily_order (order_no, order_date, customer, amount) VALUES
    (90, DATE '2026-10-07', 'draft, training only', 1.00);

-- confirm the draft sits in the table
SELECT order_no, customer, amount
FROM daily_order
WHERE order_no = 90;

-- the removal, aimed at the one row by its key
DELETE FROM daily_order
WHERE order_no = 90;

-- the table read again, the draft gone
SELECT order_no, customer, amount
FROM daily_order
ORDER BY order_no;
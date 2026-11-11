-- creating the table is a statement about shape, not about any order
DROP TABLE IF EXISTS daily_order;
CREATE TABLE daily_order (
    order_no INTEGER PRIMARY KEY,
    order_date DATE,
    customer TEXT,
    amount DECIMAL(10,2) CHECK (amount > 0)
);

-- inserting is a statement about facts, three orders from the pad
INSERT INTO daily_order (order_no, order_date, customer, amount) VALUES
    (1, DATE '2026-10-05', 'Oak Cafe', 120.00),
    (2, DATE '2026-10-05', 'Pine Store', 84.50),
    (3, DATE '2026-10-06', 'Elm Studio', 96.25);

-- reading back what was recorded
SELECT order_no, order_date, customer, amount
FROM daily_order
ORDER BY order_no;
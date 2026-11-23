-- update changes values in the rows the WHERE condition matches
UPDATE bakery_flat SET terms_days = 45 WHERE entry_id = 1;

-- read Queens Flour Co's rows back
SELECT entry_id, department, supplier_name, terms_days
FROM bakery_flat
WHERE supplier_name = 'Queens Flour Co';
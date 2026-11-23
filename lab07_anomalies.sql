-- Supplied infrastructure for this unit. Run it, inspect it, and do not reproduce it.
-- The flat file imitates departmental keying; the normalized tables hold the same facts.

-- clear any earlier copies of this unit's tables and view
DROP VIEW IF EXISTS v_ingredient_usage;
DROP TABLE IF EXISTS bakery_flat CASCADE;
DROP TABLE IF EXISTS bakes, rea_map, purchase, ingredient, recipe, supplier_remittance, supplier CASCADE;

-- the deliberately denormalized flat file, one line per keyed copy of a purchase
CREATE TABLE bakery_flat (
    entry_id INTEGER PRIMARY KEY,
    department TEXT NOT NULL,
    supplier_name TEXT NOT NULL,
    terms_days INTEGER NOT NULL,
    order_date DATE NOT NULL,
    ingredient_name TEXT NOT NULL,
    qty INTEGER NOT NULL,
    unit_cost DECIMAL(10,2) NOT NULL,
    line_total DECIMAL(10,2)
);

-- the normalized tables, each about one thing
CREATE TABLE supplier (
    supplier_id INTEGER PRIMARY KEY,
    supplier_name TEXT NOT NULL,
    terms_days INTEGER NOT NULL
);

-- one to one, payment details kept apart from the master row
CREATE TABLE supplier_remittance (
    supplier_id INTEGER PRIMARY KEY REFERENCES supplier(supplier_id),
    remittance_email TEXT NOT NULL,
    payment_method TEXT NOT NULL
);

CREATE TABLE ingredient (
    ingredient_id INTEGER PRIMARY KEY,
    ingredient_name TEXT NOT NULL,
    unit TEXT NOT NULL,
    unit_cost DECIMAL(10,2) NOT NULL,
    supplier_id INTEGER NOT NULL REFERENCES supplier(supplier_id),
    substitute_for INTEGER REFERENCES ingredient(ingredient_id)
);

-- the purchase event, one row per purchase, keeping date, quantity, and price
CREATE TABLE purchase (
    purchase_id INTEGER PRIMARY KEY,
    supplier_id INTEGER NOT NULL REFERENCES supplier(supplier_id),
    ingredient_id INTEGER NOT NULL REFERENCES ingredient(ingredient_id),
    purchase_date DATE NOT NULL,
    qty INTEGER NOT NULL,
    unit_cost DECIMAL(10,2) NOT NULL
);

CREATE TABLE recipe (
    recipe_id INTEGER PRIMARY KEY,
    recipe_name TEXT NOT NULL
);

-- the linking table, one row per ingredient used in one bake
CREATE TABLE bakes (
    bake_id INTEGER PRIMARY KEY,
    recipe_id INTEGER NOT NULL REFERENCES recipe(recipe_id),
    ingredient_id INTEGER NOT NULL REFERENCES ingredient(ingredient_id),
    qty_used DECIMAL(10,2) NOT NULL,
    bake_date DATE NOT NULL
);

-- the REA map, each table named with its role, used near this unit's end
CREATE TABLE rea_map (
    table_name TEXT PRIMARY KEY,
    rea_label TEXT NOT NULL,
    rea_note TEXT NOT NULL
);

-- the flat file, two purchases, each keyed twice, once per department
INSERT INTO bakery_flat (entry_id, department, supplier_name, terms_days, order_date, ingredient_name, qty, unit_cost, line_total) VALUES
    (1, 'kitchen', 'Queens Flour Co', 30, DATE '2026-10-05', 'bread flour', 5, 12.00, 60.00),
    (2, 'office', 'Queens Flour Co', 30, DATE '2026-10-05', 'bread flour', 5, 12.00, 60.00),
    (3, 'kitchen', 'Brooklyn Sugar Co', 15, DATE '2026-10-19', 'sugar', 2, 9.00, 18.00),
    (4, 'office', 'Brooklyn Sugar Co', 15, DATE '2026-10-19', 'sugar', 2, 9.00, 18.00);

-- three suppliers; Astoria Butter Co is approved with no ingredients yet
INSERT INTO supplier (supplier_id, supplier_name, terms_days) VALUES
    (1, 'Queens Flour Co', 30),
    (2, 'Brooklyn Sugar Co', 15),
    (3, 'Astoria Butter Co', 20);

INSERT INTO supplier_remittance (supplier_id, remittance_email, payment_method) VALUES
    (1, 'ar@queensflour.example', 'check'),
    (2, 'pay@brooklynsugar.example', 'ach');

-- six ingredients; margarine names butter as its substitute, the self reference
INSERT INTO ingredient (ingredient_id, ingredient_name, unit, unit_cost, supplier_id, substitute_for) VALUES
    (1, 'bread flour', 'bag', 12.00, 1, NULL),
    (2, 'cake flour', 'bag', 11.00, 1, NULL),
    (3, 'sugar', 'bag', 9.00, 2, NULL),
    (4, 'almonds', 'case', 24.00, 2, NULL),
    (5, 'butter', 'case', 18.00, 2, NULL),
    (6, 'margarine', 'case', 9.00, 2, 5);

-- the two purchases the flat file holds, one row each in the normalized world
INSERT INTO purchase (purchase_id, supplier_id, ingredient_id, purchase_date, qty, unit_cost) VALUES
    (1, 1, 1, DATE '2026-10-05', 5, 12.00),
    (2, 2, 3, DATE '2026-10-19', 2, 9.00);

INSERT INTO recipe (recipe_id, recipe_name) VALUES
    (1, 'sandwich bread'),
    (2, 'birthday cake'),
    (3, 'almond croissant');

-- four pairings; sugar appears in two recipes, and the croissant has none yet
INSERT INTO bakes (bake_id, recipe_id, ingredient_id, qty_used, bake_date) VALUES
    (1, 1, 1, 8.00, DATE '2026-10-01'),
    (2, 1, 3, 2.00, DATE '2026-10-01'),
    (3, 2, 2, 4.00, DATE '2026-10-02'),
    (4, 2, 3, 6.00, DATE '2026-10-02');

INSERT INTO rea_map (table_name, rea_label, rea_note) VALUES
    ('supplier', 'agent', 'outside participant in purchase and usage events'),
    ('supplier_remittance', 'agent', 'payment details of one outside participant'),
    ('ingredient', 'resource', 'economic resource the bakery buys, stores, and uses'),
    ('purchase', 'event', 'purchase event that brings a resource in, at its own price and date'),
    ('recipe', 'resource', 'names the finished product each bake produces'),
    ('bakes', 'event', 'usage event that consumes ingredients in production');

-- read the two worlds back
SELECT * FROM bakery_flat;
SELECT * FROM supplier;
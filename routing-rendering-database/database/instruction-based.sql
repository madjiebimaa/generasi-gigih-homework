-- Instructions materials (Homework is on the last part)
.mode markdown
CREATE TABLE categories (id INTEGER NOT NULL PRIMARY KEY, name VARCHAR(50));

CREATE TABLE items (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50) DEFAULT NULL,
  price REAL DEFAULT 0
);

pragma table_info('categories');

CREATE TABLE item_categories (
  item_id INT,
  category_id INT
);
  
INSERT INTO items (id, name, price) VALUES 
  (1, 'Nasi Goreng', 25000);

INSERT INTO items (id, name) VALUES 
  (2, 'Air Putih');

INSERT INTO items VALUES 
  (3, 'Spaghetti', 40000),
  (4, 'Green Tea Latte', 18000);

INSERT INTO items (name, price) VALUES 
  ('Orange Juice', 15000),
  ('Vanilla Ice Cream', 13000),
  ('Cordon Bleu', 36000),
  ('French Fries', 20000),
  ('Mango Juice', 15000);

UPDATE items SET name = 'Nasi Goreng Gila' where id = 1;

UPDATE items SET name = 'Ice Water', price = 2000 where id = 2;

DELETE FROM items WHERE name = 'Mango Juice';

INSERT INTO categories (name) VALUES 
  ('main dish'), 
  ('beverage'), 
  ('dessert');

INSERT INTO item_categories (item_id, category_id) VALUES 
  (1, 1), 
  (2, 2), 
  (3, 1),
  (3, 1), 
  (4, 2), 
  (5, 2), 
  (6, 3), 
  (7, 1);
  
SELECT id, name, price FROM items;
SELECT id, name FROM items;
SELECT * FROM items;
SELECT * FROM items WHERE price < 20000;
SELECT * FROM items WHERE price >= 15000 AND price <= 25000;

SELECT * FROM items WHERE price BETWEEN 15000 AND 25000;
SELECT * FROM items WHERE name = 'French Fries';
SELECT * FROM items WHERE name LIKE '%Juice%';

SELECT items.id, items.name, item_categories.category_id
FROM   items 
       LEFT JOIN item_categories ON items.id = item_categories.item_id;

SELECT items.id, items.name, item_categories.category_id
FROM   items 
       JOIN item_categories ON items.id = item_categories.item_id;

SELECT i.*, c.name
FROM   items i
       LEFT JOIN item_categories ic ON i.id = ic.item_id
       LEFT JOIN categories c ON c.id = ic.category_id;

SELECT items.id, items.name, item_categories.category_id
FROM   item_categories 
       LEFT JOIN items ON items.id = item_categories.item_id;

SELECT i.id, i.name
FROM   items i
       LEFT JOIN item_categories ic ON i.id = ic.item_id
       LEFT JOIN categories c ON c.id = ic.category_id
WHERE  c.name = 'main dish';

SELECT i.id, i.name, i.price
FROM   items i
       LEFT JOIN item_categories ic ON i.id = ic.item_id
       LEFT JOIN categories c ON c.id = ic.category_id
WHERE  c.name = 'main dish'
AND    i.price > 30000;

SELECT i.*
FROM   items i
       LEFT JOIN item_categories ic ON i.id = ic.item_id
       LEFT JOIN categories c ON c.id = ic.category_id
WHERE  c.name IS NULL;

SELECT c.id, c.name, GROUP_CONCAT(i.name), MAX(i.price) 
FROM   categories c 
       LEFT JOIN item_categories ic ON ic.category_id = c.id 
       LEFT JOIN items i ON i.id = ic.item_id 
GROUP  BY c.id;

.save orders.db

-- Run SQL statements from previous activity (based on instructions) from another file
.read instruction-based.sql 

-- using same DB for homework
.open orders.db

-- HOMEWORK solution
CREATE TABLE users
  (
     id       INTEGER NOT NULL PRIMARY KEY,
     username VARCHAR(50),
     password TEXT
  );

CREATE TABLE customers
  (
     id      INTEGER NOT NULL PRIMARY KEY,
     NAME    VARCHAR(100),
     phone   VARCHAR(20),
     address VARCHAR(255)
  );

CREATE TABLE orders
  (
     id          INTEGER NOT NULL PRIMARY KEY,
     customer_id INTEGER,
     total_price REAL DEFAULT 0,
     order_date  DATE,
     created_by  INTEGER
  );

CREATE TABLE order_details
  (
     order_id   INTEGER,
     item_id    INTEGER,
     item_price REAL,
     quantity   INTEGER DEFAULT 1
  );

INSERT INTO customers (id, NAME, phone, address) VALUES
  (1, 'Budiawan', '+6212345678', 'Jakarta Utara'),
  (2, 'Mary Jones', '+6287654321', 'Jakarta Selatan'),
  (3, 'Budiawan', '+6289753124', 'Bogor'),
  (4, 'Harry Styles', '+6281234532', 'Batam'),
  (5, 'Bayu Kurniawan', '+62843565611', 'Depok');

INSERT INTO users (username, password) VALUES
  ('harry.potter', '48f6485d600ab53f2c8ffcaeb6b756d8c820e2ed'),
  ('hgranger', 'c68ff0ac0f0ac0c90acfa087d20e0239fa100485'),
  ('ronald.weasley', '577db46a56e0b9aab0896f6aae0ded241033292e'),
  ('llovegood', '3af1994b0babcaee862cc5950155d391bcd7e402'),
  ('neville.l', '5899d53139360337ec5a5cadf6009b044816035c');

INSERT INTO orders (customer_id, order_date, total_price, created_by) VALUES
  (1, '2020-10-10', 27000, 1),
  (2, '2020-10-10', 58000, 1),
  (3, '2020-10-10', 55000, 1),
  (1, '2020-10-11', 27000, 2),
  (2, '2020-10-11', 54000, 2);

INSERT INTO order_details (order_id, item_id, item_price) VALUES
  (1, 1, 25000),
  (1, 2, 2000),
  (2, 3, 40000),
  (2, 4, 18000),
  (3, 4, 40000),
  (3, 5, 15000),
  (4, 1, 25000),
  (4, 2, 2000),
  (5, 7, 36000),
  (5, 4, 18000);

SELECT o.id order_id,
       o.order_date,
       c.NAME,
       c.phone,
       SUM(od.item_price) total,
       GROUP_CONCAT(i.NAME, ',') items
FROM   orders o
       LEFT JOIN order_details od  ON od.order_id = o.id
       LEFT JOIN items i  ON od.item_id = i.id
       LEFT JOIN customers c  ON o.customer_id = c.id
GROUP  BY o.id; 

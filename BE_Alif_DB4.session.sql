use toko2;

-- 1 --
SELECT *
FROM transactions
WHERE id_user = 1
UNION
SELECT *
FROM transactions
WHERE id_user = 2;

-- 2 --
SELECT id_user, SUM(total_qty), SUM(total_price), SUM(total_qty) * SUM(total_price) AS total_transaction
FROM transactions
WHERE id_user = 1;

-- 3 --
SELECT id_product_type, SUM(qty), SUM(price), SUM(qty) * SUM(price) AS total
FROM transaction_details
INNER JOIN products ON transaction_details.id_product = products.id_product
WHERE id_product_type = 2;

-- 4 --
SELECT products.*, product_types.name
FROM products
INNER JOIN product_types ON products.id_product_type = product_types.id_product_type;

-- 5 --
SELECT transactions.*, products.name AS name_produk, users.name AS name_user
FROM transactions
INNER JOIN users on transactions.id_user = users.id_user
INNER JOIN transaction_details on transactions.id_transaction = transaction_details.id_transaction
INNER JOIN products on transaction_details.id_product= products.id_product;

-- 8 --
SELECT *
FROM products
WHERE id_product NOT IN (SELECT id_product
FROM transaction_details);
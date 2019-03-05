-- Get all customers and their addresses.
SELECT *
FROM "customers"
JOIN "addresses" ON "customers"."id"= "addresses"."customer_id";

-- Get all orders and their line items
SELECT "orders", "quantity", "description"
FROM "orders"
JOIN "line_items" ON "orders"."id" = "line_items"."order_id"
JOIN "products" ON "line_items"."product_id" = "products"."id";

-- (orders, quantity and product).
-- Which warehouses have cheetos?
SELECT "warehouse", "description"
FROM "warehouse_product" 
JOIN "warehouse" ON "warehouse_id"= "warehouse"."id"
JOIN "products" ON "warehouse_product"."product_id"= "products"."id"
WHERE "product_id"='5';
-- Which warehouses have diet pepsi?
SELECT "warehouse", "description"
FROM "warehouse_product" 
JOIN "warehouse" ON "warehouse_id"= "warehouse"."id"
JOIN "products" ON "warehouse_product"."product_id"= "products"."id"
WHERE "product_id"='6';
-- Get the number of orders for each customer.
SELECT "customers"."first_name", "customers"."last_name", COUNT(*)
FROM "orders" 
JOIN "addresses" ON "orders"."address_id" = "addresses"."id"
JOIN "customers" ON "addresses"."customer_id" = "customers"."id"
GROUP BY "customers"."first_name", "customers"."last_name";

-- NOTE: It is OK if those without orders are not included in results.
-- How many customers do we have?
SELECT COUNT(*)
FROM "customers";
-- How many products do we carry?
SELECT COUNT(*)
FROM "customers";
-- What is the total available on-hand quantity of diet pepsi?
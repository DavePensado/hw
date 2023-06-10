CREATE TABLE products (
  code serial PRIMARY KEY,
  name VARCHAR(300),
  price DECIMAL(16, 2) CHECK (price > 0),
);
CREATE TABLE customers (
  id serial PRIMARY KEY,
  name VARCHAR(300),
  address VARCHAR(300),
  phone_number int
);
CREATE TABLE orders (
  code serial PRIMARY KEY,
  contract_number int NOT NULL,
  contract_date date,
  quantity int NOT NULL,
  product_code int REFERENCES products(code),
  customer_id int REFERENCES customers(code)
);
CREATE TABLE shipments (
  code serial PRIMARY KEY,
  order_code int REFERENCES orders(code),
  shipment_date date
);
CREATE TABLE products_to_shipments (
  product_code int REFERENCES products(code),
  shipment_code int REFERENCES shipments(code),
  quantity int NOT NULL,
  PRIMARY KEY(product_code, shipment_code)
);
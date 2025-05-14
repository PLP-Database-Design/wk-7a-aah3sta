--*Write an --SQL query* to transform this table into *1NF*, ensuring that each row represents a single product for an order

CREATE TABLE productDetail(
    order_id INT,
    customer_name VARCHAR(50),
    product_name VARCHAR(50)
);

INSERT INTO productDetail (order_id, customer_name, product_name)
VALUES
(1, 'John Doe', 'Laptop'),
(1, 'John Doe', 'Mouse'),
(2, 'Jane Smith', 'Keyboard'),
(2, 'Jane Smith', 'Tablet'),
(2, 'Jane Smith', 'Mouse'),
(3, 'Emily Clark', 'Phone');

SELECT * FROM productDetail;

-- Write an SQL query to transform this table into *2NF* by removing partial dependencies. Ensure that each non-key column fully depends on the entire primary key.

CREATE TABLE Orders(
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

INSERT INTO Orders (order_id, customer_name)
VALUES
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Emily Clark');

CREATE TABLE orderDetails(
    order_id INT,
    product_name VARCHAR(50),
    PRIMARY KEY (order_id, product_name),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO orderDetails (order_id, product_name)
VALUES
(1, 'Laptop'),
(1, 'Mouse'),
(2, 'Keyboard'),
(2, 'Tablet'),
(2, 'Mouse'),
(3, 'Phone');

SELECT * FROM Orders;
SELECT * FROM orderDetails;

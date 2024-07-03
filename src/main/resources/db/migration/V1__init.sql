CREATE TABLE bill
(
    id            BIGINT AUTO_INCREMENT NOT NULL,
    customer_id   BIGINT                NULL,
    total_amount  DECIMAL               NULL,
    creation_date datetime              NULL,
    due_date      datetime              NULL,
    status        VARCHAR(255)          NULL,
    CONSTRAINT pk_bill PRIMARY KEY (id)
);

CREATE TABLE customer
(
    id      BIGINT AUTO_INCREMENT NOT NULL,
    name    VARCHAR(255)          NULL,
    email   VARCHAR(255)          NULL,
    phone   VARCHAR(255)          NULL,
    address VARCHAR(255)          NULL,
    city    VARCHAR(255)          NULL,
    state   VARCHAR(255)          NULL,
    CONSTRAINT pk_customer PRIMARY KEY (id)
);

CREATE TABLE order_items
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    quantity   INT                   NOT NULL,
    product_id BIGINT                NULL,
    order_id   BIGINT                NULL,
    price      DOUBLE                NOT NULL,
    CONSTRAINT pk_orderitems PRIMARY KEY (id)
);

CREATE TABLE orders
(
    id           BIGINT AUTO_INCREMENT NOT NULL,
    customer_id  BIGINT                NULL,
    order_number VARCHAR(255)          NULL,
    order_status VARCHAR(255)          NULL,
    total_amount DECIMAL               NULL,
    created_at   datetime              NULL,
    updated_at   datetime              NULL,
    CONSTRAINT pk_orders PRIMARY KEY (id)
);

CREATE TABLE product
(
    id            BIGINT AUTO_INCREMENT NOT NULL,
    name          VARCHAR(255)          NULL,
    `description` VARCHAR(255)          NULL,
    price         DOUBLE                NOT NULL,
    quantity      INT                   NOT NULL,
    CONSTRAINT pk_product PRIMARY KEY (id)
);

ALTER TABLE bill
    ADD CONSTRAINT FK_BILL_ON_CUSTOMER FOREIGN KEY (customer_id) REFERENCES customer (id);

ALTER TABLE order_items
    ADD CONSTRAINT FK_ORDERITEMS_ON_ORDER FOREIGN KEY (order_id) REFERENCES orders (id);

ALTER TABLE order_items
    ADD CONSTRAINT FK_ORDERITEMS_ON_PRODUCT FOREIGN KEY (product_id) REFERENCES product (id);

ALTER TABLE orders
    ADD CONSTRAINT FK_ORDERS_ON_CUSTOMER FOREIGN KEY (customer_id) REFERENCES customer (id);
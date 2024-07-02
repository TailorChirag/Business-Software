CREATE TABLE customer
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime              NULL,
    updated_at datetime              NULL,
    name       VARCHAR(255)          NULL,
    email      VARCHAR(255)          NULL,
    phone      VARCHAR(255)          NULL,
    address    VARCHAR(255)          NULL,
    city       VARCHAR(255)          NULL,
    state      VARCHAR(255)          NULL,
    country    VARCHAR(255)          NULL,
    CONSTRAINT pk_customer PRIMARY KEY (id)
);

CREATE TABLE `order`
(
    id           BIGINT AUTO_INCREMENT NOT NULL,
    created_at   datetime              NULL,
    updated_at   datetime              NULL,
    customer_id  BIGINT                NULL,
    order_number VARCHAR(255)          NULL,
    order_status VARCHAR(255)          NULL,
    CONSTRAINT pk_order PRIMARY KEY (id)
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

CREATE TABLE product
(
    id            BIGINT AUTO_INCREMENT NOT NULL,
    created_at    datetime              NULL,
    updated_at    datetime              NULL,
    name          VARCHAR(255)          NULL,
    `description` VARCHAR(255)          NULL,
    price         DOUBLE                NOT NULL,
    quantity      INT                   NOT NULL,
    CONSTRAINT pk_product PRIMARY KEY (id)
);

ALTER TABLE order_items
    ADD CONSTRAINT FK_ORDERITEMS_ON_ORDER FOREIGN KEY (order_id) REFERENCES `order` (id);

ALTER TABLE order_items
    ADD CONSTRAINT FK_ORDERITEMS_ON_PRODUCT FOREIGN KEY (product_id) REFERENCES product (id);

ALTER TABLE `order`
    ADD CONSTRAINT FK_ORDER_ON_CUSTOMER FOREIGN KEY (customer_id) REFERENCES customer (id);
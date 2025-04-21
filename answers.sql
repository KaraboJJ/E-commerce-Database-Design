CREATE database 'E-Commerce';
use 'E-Commerce';
-- Create the product_image table
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY_KEY,
    product_id INT,
    image_url VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Create the color table
CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY_KEY,
    color_name VARCHAR(50)
);

--Create the product_category table
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY_KEY,
    category_name VARCHAR(100)
);

--Create the brand table
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY_KEY,
    brand_name VARCHAR(100)
);

--Create the product table
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY_KEY,
    name VARCHAR(100),
    brand_id INT,
    base_price DECIMAL(10, 2),
    category_id INT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id),
);

--Create the size_category table
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY_KEY,
    category_name VARCHAR(50)
);

--Create the size_option table
CREATE TABLE size_option (
    size_option_id INT AUTO_INCREMENT PRIMARY_KEY,
    size_name VARCHAR(10),
    size_category_id INT,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

--Create the product_variation table
CREATE TABLE product_variation (
    variation-id INT AUTO_INCREMENT PRIMARY_KEY,
    product_id INT,
    size_option_id INT,
    color_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id)
);

-- Create the product_item table
CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY_KEY,
    product_id INT,
    variation_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);

--Create the attribute_category table
CREATE TABLE attribute_category (
    attribute_category_id INT AUTO_INCREMENT PRIMARY_KEY,
    category_name VARCHAR(50)
);

--Create the attribute_type table
CREATE TABLE attribute_type (
    attribute_type_id INT AUTO_INCREMENT PRIMARY_KEY,
    type_name VARCHAR(50)
);

--Create the product_attribute table
CREATE TABLE product_attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY_KEY,
    product_id INT,
    attribute_type_id INT,
    value VARCHAR(100),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);
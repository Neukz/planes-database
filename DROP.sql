-- Resolve inspection-maintenance circular dependency
ALTER TABLE inspection DROP CONSTRAINT fk_inspection_maintenance;

DROP TABLE maintenance_inventory_usage;
DROP TABLE maintenance;
DROP TABLE inventory_stock;
DROP TABLE inspection;
DROP TABLE spare_part;
DROP TABLE workshop;
DROP TABLE airplane;
DROP TABLE employee;
DROP TABLE airplane_model;
DROP TABLE airport;
DROP TABLE product;
DROP TABLE producer;
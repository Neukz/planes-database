-- Delete all records
DELETE FROM maintenance;	-- Deletes maintenance_inventory_usage
DELETE FROM inspection;
DELETE FROM airplane;
DELETE FROM airport;		-- Deletes workshop, inventory_stock
DELETE FROM product;		-- Deletes airplane_model, spare_part
DELETE FROM producer;
DELETE FROM employee;
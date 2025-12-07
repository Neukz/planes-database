-- producer
CREATE TABLE producer (
	id INT IDENTITY PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
		-- CHECK
	partnership_start_date DATE NOT NULL,
		-- CHECK
	partnership_end_date DATE
		-- CHECK
);

-- product
CREATE TABLE product (
	id INT IDENTITY PRIMARY KEY,
	producer_id INT NOT NULL
		REFERENCES producer(id),
	name VARCHAR(30) NOT NULL,
		-- CHECK
	value INT NOT NULL
		CHECK (value > 0 AND value % 100 = 0)
);

-- airplane_model
CREATE TABLE airplane_model (
	product_id INT PRIMARY KEY
		REFERENCES product(id),
	passenger_capacity INT NOT NULL
		CHECK (passenger_capacity > 0),
	range INT NOT NULL
		CHECK (range > 0 AND range % 100 = 0),
	max_speed INT NOT NULL
		CHECK (max_speed > 0 AND max_speed % 10 = 0),
	fuel_capacity INT NOT NULL
		CHECK (fuel_capacity > 0 AND fuel_capacity % 10 = 0)
);

-- spare_part
CREATE TABLE spare_part (
	product_id INT PRIMARY KEY
		REFERENCES product(id),
	type VARCHAR(10) NOT NULL,
		-- CHECK
	description VARCHAR(500) NOT NULL,
	warranty_period INT NOT NULL
		CHECK (warranty_period > 0)
);

-- airport
CREATE TABLE airport (
	iata_code CHAR(3) PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
		-- CHECK
	country VARCHAR(50) NOT NULL,
		-- CHECK
	city VARCHAR(60) NOT NULL,
		-- CHECK
);

-- airplane
CREATE TABLE airplane (
	registration_code CHAR(6) PRIMARY KEY,
		-- CHECK
	airplane_model_id INT NOT NULL
		REFERENCES airplane_model(product_id),
	location_airport_iata_code CHAR(3) NOT NULL
		REFERENCES airport(iata_code),
	acquisition_date DATE NOT NULL,
		-- CHECK
	status VARCHAR(12) NOT NULL,
		-- CHECK
);

-- workshop
CREATE TABLE workshop (
	airport_iata_code CHAR(3) NOT NULL
		REFERENCES airport(iata_code),
	number INT NOT NULL,
		CHECK (number > 0),
	is_occupied BIT NOT NULL,

	PRIMARY KEY (airport_iata_code, number)
);

-- employee
CREATE TABLE employee (
	id INT IDENTITY PRIMARY KEY,
	first_name VARCHAR(30) NOT NULL,
		-- CHECK
	last_name VARCHAR(30) NOT NULL,
		-- CHECK
	email VARCHAR(40) UNIQUE NOT NULL,
		-- CHECK
	role VARCHAR(24) NOT NULL,
		-- CHECK
);

-- inspection
CREATE TABLE inspection (
	id INT IDENTITY PRIMARY KEY,
	airplane_registration_code CHAR(6) NOT NULL
		REFERENCES airplane(registration_code),
	performed_by_employee_id INT NOT NULL
		REFERENCES employee(id),
	validated_maintenance_id INT,
	type VARCHAR(16) NOT NULL,
		-- CHECK
	date DATE NOT NULL,
		-- CHECK
	result VARCHAR(10) NOT NULL
		-- CHECK
);

-- maintenance
CREATE TABLE maintenance (
	id INT IDENTITY PRIMARY KEY,
	initiating_inspection_id INT NOT NULL
		REFERENCES inspection(id),
	coordinated_by_employee_id INT NOT NULL
		REFERENCES employee(id),
	workshop_airport_iata_code CHAR(3) NOT NULL,
	workshop_number INT NOT NULL,
	start_date DATE,
		-- CHECK
	end_date DATE,
		-- CHECK

	CONSTRAINT fk_maintenance_workshop
		FOREIGN KEY (workshop_airport_iata_code, workshop_number)
		REFERENCES workshop(airport_iata_code, number)
);

-- Resolve inspection-maintenance circular dependency
ALTER TABLE inspection
	ADD CONSTRAINT fk_inspection_maintenance
		FOREIGN KEY (validated_maintenance_id) REFERENCES maintenance(id);

-- inventory_stock
CREATE TABLE inventory_stock (
	id INT IDENTITY PRIMARY KEY,
	spare_part_id INT NOT NULL
		REFERENCES spare_part(product_id),
	workshop_airport_iata_code CHAR(3) NOT NULL,
    workshop_number INT NOT NULL,
    quantity INT NOT NULL
		CHECK (quantity >= 0),
    reorder_level INT NOT NULL
		CHECK (reorder_level > 0),
	
	CONSTRAINT fk_inventory_stock_workshop
		FOREIGN KEY (workshop_airport_iata_code, workshop_number)
		REFERENCES workshop(airport_iata_code, number)
);

-- maintenance_inventory_usage
CREATE TABLE maintenance_inventory_usage (
	maintenance_id INT NOT NULL
		REFERENCES maintenance(id),
	inventory_stock_id INT NOT NULL
		REFERENCES inventory_stock(id),
	quantity_used INT NOT NULL
		CHECK (quantity_used > 0),

	PRIMARY KEY (maintenance_id, inventory_stock_id)
);
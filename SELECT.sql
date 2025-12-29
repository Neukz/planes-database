-- Create view to store airplane_model fields with producer.id, producer.name, product.name, and product.value
CREATE VIEW airplane_model_details AS
SELECT
	producer.id AS producer_id,
	producer.name AS producer_name,
	product.name AS model_name,
	product.value,
	am.*
FROM airplane_model am
JOIN product
	ON am.product_id = product.id
JOIN producer
	ON product.producer_id = producer.id;

GO


-- Create view to store spare_part fields with producer.id, producer.name, product.name, and product.value
CREATE VIEW spare_part_details AS
SELECT
	producer.id AS producer_id,
	producer.name AS producer_name,
	product.name AS spare_part_name,
	product.value,
	sp.*
FROM spare_part sp
JOIN product
	ON sp.product_id = product.id
JOIN producer
	ON product.producer_id = producer.id;

GO


-- Purpose: Calculate inspection failure rate, per airplane model
-- Business need: Identify if a specific producer's planes have quality control issues
SELECT
	amd.producer_name,
	amd.model_name,
	COUNT(i.id) AS total_inspections,
	SUM(CASE WHEN i.result = 'failed' THEN 1 ELSE 0 END) AS failed_inspections,
	ROUND(CAST(AVG(CASE WHEN i.result = 'failed' THEN 1.0 ELSE 0.0 END) * 100 AS FLOAT), 2) AS failure_rate_pct
FROM airplane_model_details amd
JOIN airplane a
	ON amd.product_id = a.airplane_model_id
JOIN inspection i
	ON a.registration_code = i.airplane_registration_code
GROUP BY amd.producer_name, amd.model_name
ORDER BY failure_rate_pct DESC;


-- Purpose: Calculate total value of spare parts consumed in maintenance tasks within the last year, per part type
-- Business need: Identify which categories of parts are driving the highest maintenance costs
SELECT
	spd.type AS spare_part_type,
	ISNULL(SUM(spd.value * miu.quantity_used), 0) AS total_cost
FROM spare_part_details spd
LEFT JOIN inventory_stock ist
	ON spd.product_id = ist.spare_part_id
LEFT JOIN maintenance_inventory_usage miu
	ON ist.id = miu.inventory_stock_id
LEFT JOIN maintenance m
	ON miu.maintenance_id = m.id AND
		m.start_date >= DATEADD(YEAR, -1, GETDATE()) AND
		m.end_date IS NOT NULL	-- Only consider completed maintenance
GROUP BY spd.type
ORDER BY total_cost DESC;


-- Purpose: Show the most recent inspection result for every airplane in the fleet
-- Business need: Provide a snapshot of the fleet's current "health" status
SELECT
	a.registration_code,
	a.status,
	i.date AS last_inspection_date,
	i.type AS last_inspection_type,
	i.result AS last_inspection_result
FROM airplane a
LEFT JOIN inspection i
	ON a.registration_code = i.airplane_registration_code AND
		i.date = (
			SELECT MAX(i_sub.date)
			FROM inspection i_sub
			WHERE
				i_sub.airplane_registration_code = a.registration_code AND
				i_sub.result <> 'scheduled' AND	-- Ignore scheduled inspections
				i_sub.date <= GETDATE()			-- Ignore future inspections
		)
WHERE a.status <> 'retired'	-- Ignore retired airplanes
ORDER BY a.registration_code;


-- Purpose: Calculate the average duration (in days) of maintenance tasks within the last year, per workshop
-- Business need: Compare workshop performance
SELECT 
	workshop_airport_iata_code,
	workshop_number,
	COUNT(*) AS maintenance_count,
	AVG(DATEDIFF(DAY, start_date, end_date)) AS avg_maintenance_days
FROM maintenance
WHERE
	start_date >= DATEADD(YEAR, -1, GETDATE()) AND
	end_date IS NOT NULL	-- Only consider completed maintenance
GROUP BY workshop_airport_iata_code, workshop_number
ORDER BY avg_maintenance_days DESC;


-- Purpose: Check the number of inspections performed by each Inspection Specialist in November 2025
-- Business need: Balance workload between employees
SELECT
	e.id AS employee_id,
	e.first_name + ' ' + e.last_name AS inspection_specialist,
	e.email,
	COUNT(i.id) AS inspection_count
FROM employee e
LEFT JOIN inspection i
	ON e.id = i.performed_by_employee_id AND
		YEAR(i.date) = 2025 AND
		MONTH(i.date) = 11
WHERE e.role = 'Inspection Specialist'
GROUP BY e.id, e.first_name, e.last_name, e.email
ORDER BY inspection_count DESC;


-- Purpose: Find the longest range airplane model, per producer
-- Business need: Compare airplane models from different producers when planning new long-distance routes
SELECT
	amd.producer_name,
	amd.model_name,
	amd.range,
	amd.value AS price
FROM airplane_model_details amd
WHERE amd.range = (
	SELECT MAX(amd_sub.range)
	FROM airplane_model_details amd_sub
	WHERE amd_sub.producer_id = amd.producer_id
)
ORDER BY amd.range DESC;
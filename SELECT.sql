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


-- Purpose: Calculate the average duration (in days) of maintenance tasks per workshop within the last year
-- Business need: Compare workshop performance
SELECT 
	workshop_airport_iata_code,
	workshop_number,
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
		i.date >= '2025-11-01' AND
		i.date <= '2025-11-30'
WHERE e.role = 'Inspection Specialist'
GROUP BY e.id, e.first_name, e.last_name, e.email
ORDER BY inspection_count DESC;
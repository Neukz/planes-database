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
GROUP BY workshop_airport_iata_code, workshop_number;
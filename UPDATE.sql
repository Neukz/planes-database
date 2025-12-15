-- Re-register airplane SP-LAA with a new registration code SP-LAX
-- Triggers UDPATE in related inspection records
UPDATE airplane
	SET registration_code = 'SP-LAX'
	WHERE registration_code = 'SP-LAA';


-- Rename Gdansk Lech Walesa Airport (GDN) to Gdansk International Airport (GIA)
-- Triggers UPDATE in related airplane, workshop, inventory_stock, and maintenance records
UPDATE airport
	SET iata_code = 'GIA', name = 'Gdansk International Airport'
	WHERE iata_code = 'GDN';


-- Inspection Specialist with id = 3 will have a day off at 2026-01-20, his inspections will be delegated to Inspection Specialist with id = 5
UPDATE inspection
	SET performed_by_employee_id = 5
	WHERE
		performed_by_employee_id = 3 AND
		date = '2026-01-20' AND
		result = 'scheduled';


-- Partnership with Embraer (id = 4) is extended for 3 more years
UPDATE producer
	SET partnership_end_date = DATEADD(YEAR, 3, partnership_end_date)
	WHERE id = 4;


-- Minimum required stock levels (reorder_level) for all hydraulic parts in Warsaw (WAW) workshops is doubled
UPDATE inventory_stock
	SET reorder_level = reorder_level * 2
	FROM inventory_stock
	INNER JOIN spare_part ON inventory_stock.spare_part_id = spare_part.product_id
	WHERE
		spare_part.type = 'hydraulic' AND
		inventory_stock.workshop_airport_iata_code = 'WAW';
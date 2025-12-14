INSERT INTO producer (name, partnership_start_date, partnership_end_date)
VALUES
	('Airbus', '1992-01-01', NULL),
	('Boeing', '1994-07-01', NULL),
	('Bombardier', '1997-10-01', NULL),
	('Embraer', '1999-04-01', NULL),
	('Gulfstream Aerospace', '2005-07-01', NULL),
	('Mitsubishi Aircraft', '2012-01-01', '2030-12-31'),
	('Sukhoi', '2008-01-01', '2027-10-31'),
	('De Havilland Canada', '2004-04-01', '2027-06-30'),
	('ATR', '1992-01-01', '2029-12-31'),
	('COMAC', '2001-01-01', '2027-12-31');


INSERT INTO airport (iata_code, name, country, city)
VALUES
    ('GDN', 'Gdansk Lech Walesa Airport', 'Poland', 'Gdansk'),
	('WAW', 'Warsaw Chopin Airport', 'Poland', 'Warsaw'),
	('BZG', 'Ignacy Jan Paderewski Bydgoszcz Airport', 'Poland', 'Bydgoszcz'),
	('KRK', 'Krakow John Paul II International Airport', 'Poland', 'Krakow'),
	('LHR', 'London Heathrow Airport', 'England', 'London'),
	('DUB', 'Dublin Airport', 'Ireland', 'Dublin'),
	('CDG', 'Paris Charles de Gaulle Airport', 'France', 'Paris'),
	('ORY', 'Paris Orly Airport', 'France', 'Paris'),
	('AMS', 'Amsterdam Airport Schiphol', 'Netherlands', 'Amsterdam'),
	('BER', 'Berlin Brandenburg Airport', 'Germany', 'Berlin');


INSERT INTO workshop (airport_iata_code, number, is_occupied)
VALUES
    ('GDN', 1, 0),
    ('GDN', 2, 0),
    ('WAW', 1, 0),
    ('WAW', 2, 0),
    ('BZG', 1, 0),
    ('BZG', 2, 0),
    ('KRK', 1, 0),
    ('KRK', 2, 0),
    ('LHR', 1, 0),
    ('LHR', 2, 0),
    ('DUB', 1, 0),
    ('DUB', 2, 0),
    ('CDG', 1, 0),
    ('CDG', 2, 0),
    ('ORY', 1, 0),
    ('ORY', 2, 0),
    ('AMS', 1, 0),
    ('AMS', 2, 0),
    ('BER', 1, 0),
    ('BER', 2, 0);


INSERT INTO product (producer_id, name, value)
VALUES
    -- Airplane models (id: 1-15)
    (1, 'Airbus A320neo', 112000000),      -- $112M
    (1, 'Airbus A321neo', 129000000),      -- $129M  
    (1, 'Airbus A350-900', 317000000),     -- $317M
    (2, 'Boeing 737-800', 106000000),      -- $106M
    (2, 'Boeing 737 MAX 8', 121000000),    -- $121M
    (2, 'Boeing 787-8', 248000000),        -- $248M
    (2, 'Boeing 787-9', 292000000),        -- $292M
    (3, 'Bombardier CRJ900', 52000000),    -- $52M
    (4, 'Embraer E195-E2', 63000000),      -- $63M
    (5, 'Gulfstream G650ER', 70000000),    -- $70M
    (6, 'SpaceJet M90', 47000000),         -- $47M
    (7, 'Superjet 100', 36000000),         -- $36M
    (8, 'Dash 8 Q400', 32000000),          -- $32M
    (9, 'ATR 72-600', 29000000),           -- $29M
    (10, 'COMAC C919', 50000000),          -- $50M
    
    -- Spare parts, only for Airbus and Boeing (id: 16-30)
    (1, 'Landing Gear', 1250000),               -- $1.25M
    (1, 'Engine Fan Blade', 850000),            -- $850K
    (1, 'Avionics Flight Computer', 325000),    -- $325K
    (1, 'Hydraulic Actuator', 95000),           -- $95K
    (1, 'Wing Flap Track', 275000),             -- $275K
    (1, 'Thrust Reverser', 1850000),            -- $1.85M
    (1, 'APU Unit', 675000),                    -- $675K
    (2, 'Passenger Seat', 12500),               -- $12.5K
    (2, 'Weather Radar Antenna', 145000),       -- $145K
    (2, 'Fuel Control Unit', 89000),            -- $89K
    (2, 'Cabin Pressure Controller', 68000),    -- $68K
    (2, 'Flight Control Computer', 285000),     -- $285K
    (2, 'Emergency Oxygen System', 1200),       -- $1.2K
    (2, 'Emergency Slide Pack', 18500),         -- $18.5K
    (2, 'Fire Detection System', 42000);        -- $42K


INSERT INTO airplane_model (product_id, passenger_capacity, range, max_speed, fuel_capacity)
VALUES
    (1, 180, 6500, 840, 26500),    -- A320neo
    (2, 206, 7400, 850, 28000),    -- A321neo
    (3, 325, 15400, 900, 156000),  -- A350-900
    (4, 162, 5700, 870, 26000),    -- B737-800
    (5, 178, 6500, 870, 25500),    -- B737 MAX 8
    (6, 242, 13500, 910, 101000),  -- B787-8
    (7, 296, 15700, 910, 110000),  -- B787-9
    (8, 90, 3500, 870, 19800),     -- CRJ900
    (9, 120, 5200, 830, 21000),    -- E195-E2
    (10, 19, 13000, 960, 18600),   -- G650ER
    (11, 88, 3800, 870, 19000),    -- SpaceJet M90
    (12, 98, 3100, 870, 15800),    -- Superjet 100
    (13, 78, 2000, 660, 5700),     -- Dash 8 Q400
    (14, 70, 1600, 510, 5900),     -- 72-600
    (15, 168, 5600, 870, 26000);   -- C919


INSERT INTO spare_part (product_id, type, description, warranty_period)
VALUES
    (16, 'mechanical', 'Main landing gear truck with shock absorbers', 36),
    (17, 'mechanical', 'High pressure turbine fan blade set', 24),
    (18, 'avionics', 'Primary flight management computer module', 48),
    (19, 'hydraulic', 'Primary flight control surface actuator', 30),
    (20, 'structural', 'Inboard flap track with bearings', 60),
    (21, 'mechanical', 'Cascade thrust reverser', 24),
    (22, 'electrical', 'Auxiliary power unit with starter generator', 36),
    (23, 'cabin', 'Economy class seat with 16G compliance', 18),
    (24, 'avionics', 'Multi-scan weather radar transceiver', 48),
    (25, 'hydraulic', 'Electronic engine fuel control unit', 30),
    (26, 'avionics', 'Digital cabin pressure and outflow valve controller', 36),
    (27, 'safety', 'Engine fire detection and suppression loop', 24),
    (28, 'avionics', 'Triple redundant flight control computer', 48),
    (29, 'safety', 'Passenger oxygen mask drop system', 12),
    (30, 'safety', 'Type III emergency evacuation slide with inflation system', 18);


INSERT INTO employee (first_name, last_name, email, role)
VALUES
    ('Jan', 'Kowalski', 'j.kowalski@lot.pl', 'Inspection Specialist'),
    ('Robert', 'Lewandowski', 'r.lewandowski@lot.pl', 'Maintenance Coordinator'),
    ('Adam', 'Nowak', 'a.nowak@lot.pl', 'Inspection Specialist'),
    ('Joachim', 'Wozniak', 'j.wozniak@lot.pl', 'Maintenance Coordinator'),
    ('John', 'Smith', 'j.smith@lot.pl', 'Inspection Specialist'),
    ('Krzysztof', 'Malinowski', 'k.malinowski@lot.pl', 'Maintenance Coordinator'),
    ('Edward', 'Dzban', 'e.dzban@lot.pl', 'Inspection Specialist'),
    ('Marek', 'Grabowski', 'm.grabowski@lot.pl', 'Maintenance Coordinator'),
    ('Maciej', 'Komorowski', 'm.komorowski@lot.pl', 'Inspection Specialist'),
    ('John', 'Doe', 'j.doe@lot.pl', 'Maintenance Coordinator');


INSERT INTO airplane (registration_code, airplane_model_id, location_airport_iata_code, acquisition_date, status)
VALUES
    -- Airbus
    ('SP-LAA', 1, 'WAW', '2015-03-10', 'active'),
    ('SP-LAB', 1, 'GDN', '2016-06-20', 'active'),
    ('SP-LAC', 1, 'WAW', '2014-09-05', 'inspection'),
    ('SP-LAD', 2, 'CDG', '2017-01-15', 'active'),
    ('SP-LAE', 2, 'LHR', '2018-01-15', 'active'),
    ('SP-LAF', 2, 'BER', '2018-01-15', 'active'),
    ('SP-LAG', 3, 'BZG', '2018-01-01', 'active'),
    ('SP-LAH', 3, 'BER', '2018-01-01', 'active'),
    ('SP-LAI', 3, 'LHR', '2019-01-01', 'active'),

    -- Boeing
    ('SP-LBA', 4, 'LHR', '2018-11-30', 'active'),
    ('SP-LBB', 4, 'DUB', '2019-05-22', 'active'),
    ('SP-LBC', 4, 'AMS', '2019-02-14', 'active'),
    ('SP-LBD', 5, 'GDN', '2019-02-14', 'active'),
    ('SP-LBE', 5, 'KRK', '2020-07-03', 'active'),
    ('SP-LBF', 5, 'ORY', '2021-07-03', 'active'),
    ('SP-LBG', 6, 'AMS', '2021-10-01', 'active'),
    ('SP-LBH', 6, 'WAW', '2021-10-01', 'active'),
    ('SP-LBI', 6, 'KRK', '2021-10-01', 'active'),
    ('SP-LBJ', 7, 'BER', '2022-01-03', 'inspection'),
    ('SP-LBK', 7, 'BZG', '2023-04-09', 'active'),
    ('SP-LBL', 7, 'WAW', '2024-08-11', 'active'),

    -- Bombardier
    ('SP-LCA', 8, 'KRK', '2019-04-18', 'active'),
    ('SP-LCB', 8, 'BZG', '2010-08-25', 'active'),

    -- Embraer
    ('SP-LDA', 9, 'WAW', '2016-12-01', 'active'),
    ('SP-LDB', 9, 'GDN', '2017-08-10', 'active'),

    ('SP-LEA', 10, 'LHR', '2013-03-15', 'suspended'),  -- Gulfstream Aerospace
    ('SP-LFA', 11, 'CDG', '2018-11-20', 'suspended'),  -- Mitsubishi Aircraft
    ('SP-LGA', 12, 'BER', '2015-06-12', 'suspended'),  -- Sukhoi
    ('SP-LHA', 13, 'AMS', '2019-02-28', 'retired'),    -- De Havilland Canada
    ('SP-LIA', 14, 'DUB', '2012-10-05', 'retired'),    -- ATR
    ('SP-LJA', 15, 'ORY', '2014-07-22', 'retired');    -- COMAC


INSERT INTO inventory_stock (spare_part_id, workshop_airport_iata_code, workshop_number, quantity, reorder_level)
VALUES
    -- GDN
    (16, 'GDN', 1, 5, 2),
    (17, 'GDN', 1, 8, 3),
    (23, 'GDN', 1, 20, 5),
    (24, 'GDN', 1, 3, 1),

    -- WAW
    (18, 'WAW', 1, 4, 2),
    (19, 'WAW', 1, 6, 3),
    (25, 'WAW', 1, 5, 2),
    (26, 'WAW', 1, 4, 2),

    -- BZG
    (20, 'BZG', 1, 7, 3),
    (21, 'BZG', 1, 2, 1),
    (27, 'BZG', 1, 6, 2),
    (28, 'BZG', 1, 2, 1),

    -- KRK
    (22, 'KRK', 1, 3, 1),
    (16, 'KRK', 1, 4, 2),
    (29, 'KRK', 1, 15, 5),
    (30, 'KRK', 1, 8, 3),

    -- LHR
    (17, 'LHR', 1, 6, 2),
    (19, 'LHR', 1, 10, 4),
    (23, 'LHR', 1, 25, 10),
    (25, 'LHR', 1, 6, 3),
    
    -- DUB
    (18, 'DUB', 1, 5, 2),
    (20, 'DUB', 1, 8, 3),
    (24, 'DUB', 1, 4, 2),
    (26, 'DUB', 1, 5, 2),

    -- CDG
    (21, 'CDG', 1, 3, 1),
    (22, 'CDG', 1, 4, 2),
    (27, 'CDG', 1, 8, 3),
    (29, 'CDG', 1, 12, 4),

    -- ORY
    (16, 'ORY', 1, 4, 2),
    (19, 'ORY', 1, 5, 2),
    (28, 'ORY', 1, 3, 1),
    (30, 'ORY', 1, 6, 2),

    -- AMS
    (17, 'AMS', 1, 5, 2),
    (20, 'AMS', 1, 9, 4),
    (23, 'AMS', 1, 18, 6),
    (25, 'AMS', 1, 4, 2),

    -- BER
    (18, 'BER', 1, 3, 1),
    (21, 'BER', 1, 2, 1),
    (24, 'BER', 1, 3, 1),
    (26, 'BER', 1, 5, 2);


INSERT INTO inspection (airplane_registration_code, performed_by_employee_id, type, date, result)
VALUES
    -- Passed, non-post-maintenance (id: 1-5)
    ('SP-LAA', 1, 'pre-flight',  '2025-10-01', 'passed'),
    ('SP-LAD', 3, 'post-flight', '2025-10-02', 'passed'),
    ('SP-LAE', 5, 'routine',     '2025-10-03', 'passed'),
    ('SP-LBB', 1, 'pre-flight',  '2025-10-04', 'passed'),
    ('SP-LBC', 3, 'post-flight', '2025-10-05', 'passed'),

    -- Failed, non-post-maintenance - lead to maintenance (id: 6–25)
    ('SP-LAA', 1, 'pre-flight',  '2025-10-06', 'failed'),
    ('SP-LAB', 3, 'post-flight', '2025-10-07', 'failed'),
    ('SP-LAC', 5, 'routine',     '2025-10-08', 'failed'),
    ('SP-LAD', 1, 'pre-flight',  '2025-10-09', 'failed'),
    ('SP-LAE', 3, 'post-flight', '2025-10-10', 'failed'),
    ('SP-LAF', 5, 'routine',     '2025-10-11', 'failed'),
    ('SP-LAG', 1, 'pre-flight',  '2025-10-12', 'failed'),
    ('SP-LAH', 3, 'post-flight', '2025-10-13', 'failed'),
    ('SP-LAI', 5, 'routine',     '2025-10-14', 'failed'),
    ('SP-LBA', 1, 'pre-flight',  '2025-10-15', 'failed'),
    ('SP-LBB', 3, 'post-flight', '2025-10-16', 'failed'),
    ('SP-LBC', 5, 'routine',     '2025-10-17', 'failed'),
    ('SP-LBD', 1, 'pre-flight',  '2025-10-18', 'failed'),
    ('SP-LBE', 3, 'post-flight', '2025-10-19', 'failed'),
    ('SP-LBF', 5, 'routine',     '2025-10-20', 'failed'),
    ('SP-LBG', 1, 'pre-flight',  '2025-10-21', 'failed'),
    ('SP-LBH', 3, 'post-flight', '2025-10-22', 'failed'),
    ('SP-LBI', 5, 'routine',     '2025-10-23', 'failed'),
    ('SP-LBJ', 1, 'pre-flight',  '2025-10-24', 'failed'),
    ('SP-LBK', 3, 'post-flight', '2025-10-25', 'failed');


INSERT INTO maintenance (initiating_inspection_id, coordinated_by_employee_id, workshop_airport_iata_code, workshop_number, start_date, end_date)
VALUES
    -- Maintenances from failed non-post-maintenance inspections 6-25 (id: 1-20),
    (6,  2,  'WAW', 1, '2025-10-06', '2025-11-01'),
    (7,  4,  'CDG', 1, '2025-10-07', '2025-11-02'),
    (8,  2,  'LHR', 1, '2025-10-08', '2025-11-03'),
    (9,  4,  'DUB', 1, '2025-10-09', '2025-11-04'),
    (10, 6,  'AMS', 1, '2025-10-10', '2025-11-05'),
    (11, 8,  'KRK', 1, '2025-10-11', '2025-11-06'),
    (12, 10, 'GDN', 1, '2025-10-12', '2025-11-07'),
    (13, 2,  'LHR', 1, '2025-10-13', '2025-11-08'),
    (14, 4,  'CDG', 1, '2025-10-14', '2025-11-09'),
    (15, 6,  'BER', 1, '2025-10-15', '2025-11-10'),
    (16, 8,  'AMS', 1, '2025-10-16', '2025-11-11'),
    (17, 10, 'DUB', 1, '2025-10-17', '2025-11-12'),
    (18, 2,  'ORY', 1, '2025-10-18', '2025-11-13'),
    (19, 4,  'WAW', 1, '2025-10-19', '2025-11-14'),
    (20, 6,  'CDG', 1, '2025-10-20', '2025-11-15'),
    (21, 8,  'LHR', 1, '2025-10-21', '2025-11-16'),
    (22, 10, 'DUB', 1, '2025-10-22', '2025-11-17'),
    (23, 2,  'AMS', 1, '2025-10-23', '2025-11-18'),
    (24, 4,  'KRK', 1, '2025-10-24', '2025-11-19'),
    (25, 6,  'GDN', 1, '2025-10-25', '2025-11-20');


INSERT INTO inspection (airplane_registration_code, performed_by_employee_id, validated_maintenance_id, type, date, result)
VALUES
    -- Passed, post-maintenance - confirm maintenances 1-15 (id: 26-40)
    ('SP-LAA', 1, 1,  'post-maintenance', '2025-11-01', 'passed'),
    ('SP-LAB', 3, 2,  'post-maintenance', '2025-11-02', 'passed'),
    ('SP-LAC', 5, 3,  'post-maintenance', '2025-11-03', 'passed'),
    ('SP-LAD', 1, 4,  'post-maintenance', '2025-11-04', 'passed'),
    ('SP-LAE', 3, 5,  'post-maintenance', '2025-11-05', 'passed'),
    ('SP-LAF', 5, 6,  'post-maintenance', '2025-11-06', 'passed'),
    ('SP-LAG', 1, 7,  'post-maintenance', '2025-11-07', 'passed'),
    ('SP-LAH', 3, 8,  'post-maintenance', '2025-11-08', 'passed'),
    ('SP-LAI', 5, 9,  'post-maintenance', '2025-11-09', 'passed'),
    ('SP-LBA', 1, 10, 'post-maintenance', '2025-11-10', 'passed'),
    ('SP-LBB', 3, 11, 'post-maintenance', '2025-11-11', 'passed'),
    ('SP-LBC', 5, 12, 'post-maintenance', '2025-11-12', 'passed'),
    ('SP-LBD', 1, 13, 'post-maintenance', '2025-11-13', 'passed'),
    ('SP-LBE', 3, 14, 'post-maintenance', '2025-11-14', 'passed'),
    ('SP-LBF', 5, 15, 'post-maintenance', '2025-11-15', 'passed'),

    -- Failed, post-maintenance - fail maintenances 16-20 (id: 41–45)
    ('SP-LBG', 1, 16, 'post-maintenance', '2025-11-16', 'failed'),
    ('SP-LBH', 3, 17, 'post-maintenance', '2025-11-17', 'failed'),
    ('SP-LBI', 5, 18, 'post-maintenance', '2025-11-18', 'failed'),
    ('SP-LBJ', 1, 19, 'post-maintenance', '2025-11-19', 'failed'),
    ('SP-LBK', 3, 20, 'post-maintenance', '2025-11-20', 'failed');


INSERT INTO maintenance (initiating_inspection_id, coordinated_by_employee_id, workshop_airport_iata_code, workshop_number, start_date, end_date)
VALUES
    -- Maintenances from failed post-maintenance inspections 41-45 (id: 21-25)
    (41, 2,  'LHR', 1, '2025-11-16', '2025-11-21'),
    (42, 4,  'DUB', 1, '2025-11-17', '2025-11-22'),
    (43, 6,  'AMS', 1, '2025-11-18', '2025-11-23'),
    (44, 8,  'KRK', 1, '2025-11-19', '2025-11-24'),
    (45, 10, 'GDN', 1, '2025-11-20', '2025-11-25');


INSERT INTO inspection (airplane_registration_code, performed_by_employee_id, validated_maintenance_id, type, date, result)
VALUES
    -- Passed, post-maintenance - confirm the maintenances 21-25 triggered above (id: 46–50)
    ('SP-LBG', 1, 21, 'post-maintenance', '2025-11-21', 'passed'),
    ('SP-LBH', 3, 22, 'post-maintenance', '2025-11-22', 'passed'),
    ('SP-LBI', 5, 23, 'post-maintenance', '2025-11-23', 'passed'),
    ('SP-LBJ', 1, 24, 'post-maintenance', '2025-11-24', 'passed'),
    ('SP-LBK', 3, 25, 'post-maintenance', '2025-11-25', 'passed'),

    -- Pending (id: 51–52)
    ('SP-LAC', 1, NULL, 'pre-flight',  '2025-12-13', 'pending'),
    ('SP-LBJ', 3, NULL, 'post-flight', '2025-12-13', 'pending'),

    -- Scheduled (id: 53–55)
    ('SP-LBJ', 1, NULL, 'pre-flight',  '2026-01-09', 'scheduled'),
    ('SP-LBK', 3, NULL, 'post-flight', '2026-01-20', 'scheduled'),
    ('SP-LBL', 5, NULL, 'routine',     '2026-01-27', 'scheduled');


INSERT INTO maintenance_inventory_usage (maintenance_id, inventory_stock_id, quantity_used)
VALUES
    (1, 6, 1),
    (2, 26, 1),
    (3, 17, 2),
    (4, 21, 1),
    (5, 33, 1),
    (6, 13, 1),
    (7, 1, 1),
    (8, 18, 1),
    (9, 25, 2),
    (10, 37, 1),
    (10, 39, 1),
    (11, 35, 1),
    (12, 23, 2),
    (13, 31, 1),
    (14, 7, 1),
    (15, 28, 1),
    (16, 20, 1),
    (17, 24, 1),
    (18, 36, 2),
    (19, 15, 1),
    (20, 3, 1),
    (21, 19, 1),
    (22, 24, 1),
    (23, 35, 1),
    (24, 16, 1),
    (25, 4, 1);
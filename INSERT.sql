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


INSERT INTO product (producer_id, name, value)
VALUES
    -- Airplane models
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
    
    -- Spare parts
    (1, 'Landing Gear', 1250000),               -- $1.25M
    (2, 'Engine Fan Blade', 850000),            -- $850K
    (1, 'Avionics Flight Computer', 325000),    -- $325K
    (2, 'Hydraulic Actuator', 95000),           -- $95K
    (3, 'Wing Flap Track', 275000),             -- $275K
    (1, 'Thrust Reverser', 1850000),            -- $1.85M
    (2, 'APU Unit', 675000),                    -- $675K
    (4, 'Passenger Seat', 12500),               -- $12.5K
    (1, 'Weather Radar Antenna', 145000),       -- $145K
    (2, 'Fuel Control Unit', 89000),            -- $89K
    (3, 'Cabin Pressure Controller', 68000),    -- $68K
    (1, 'Flight Control Computer', 285000),     -- $285K
    (2, 'Emergency Oxygen System', 1200),       -- $1.2K
    (4, 'Emergency Slide Pack', 18500),         -- $18.5K
    (10, 'Fire Detection System', 42000);       -- $42K


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


INSERT INTO workshop (airport_iata_code, number, is_occupied)
VALUES
    ('GDN', 1, 1),
    ('GDN', 2, 0),
    ('WAW', 1, 1),
    ('WAW', 2, 0),
    ('BZG', 1, 0),
    ('BZG', 2, 0),
    ('KRK', 1, 0),
    ('KRK', 2, 0),
    ('LHR', 1, 1),
    ('LHR', 2, 0),
    ('DUB', 1, 0),
    ('DUB', 2, 0),
    ('CDG', 1, 0),
    ('CDG', 2, 0),
    ('ORY', 1, 0),
    ('ORY', 2, 0),
    ('AMS', 1, 0),
    ('AMS', 2, 0),
    ('BER', 1, 1),
    ('BER', 2, 0);


INSERT INTO airplane (registration_code, airplane_model_id, location_airport_iata_code, acquisition_date, status)
VALUES
    -- Airbus
    ('SP-LAA', 1, 'WAW', '2015-03-10', 'active'),
    ('SP-LAB', 1, 'GDN', '2016-06-20', 'maintenance'),
    ('SP-LAC', 2, 'WAW', '2014-09-05', 'inspection'),
    ('SP-LAD', 3, 'CDG', '2017-01-15', 'active'),
    ('SP-LAE', 3, 'LHR', '2017-01-15', 'active'),

    -- Boeing
    ('SP-LBA', 4, 'LHR', '2013-11-30', 'maintenance'),
    ('SP-LBB', 5, 'DUB', '2012-05-22', 'active'),
    ('SP-LBC', 6, 'AMS', '2018-02-14', 'active'),
    ('SP-LBD', 6, 'BER', '2018-02-14', 'maintenance'),
    ('SP-LBE', 7, 'BER', '2011-07-03', 'active'),

    -- Bombardier
    ('SP-LCA', 8, 'KRK', '2019-04-18', 'active'),
    ('SP-LCB', 8, 'BZG', '2010-08-25', 'inspection'),

    -- Embraer
    ('SP-LDA', 9, 'WAW', '2016-12-01', 'maintenance'),
    ('SP-LDB', 9, 'GDN', '2017-08-10', 'active'),

    -- Gulfstream Aerospace
    ('SP-LEA', 10, 'LHR', '2013-03-15', 'active'),

    -- Mitsubishi Aircraft
    ('SP-LFA', 11, 'CDG', '2018-11-20', 'active'),

    -- Sukhoi
    ('SP-LGA', 12, 'BER', '2015-06-12', 'active'),

    -- De Havilland Canada
    ('SP-LHA', 13, 'AMS', '2019-02-28', 'active'),

    -- ATR
    ('SP-LIA', 14, 'DUB', '2012-10-05', 'active'),

    -- COMAC
    ('SP-LJA', 15, 'ORY', '2014-07-22', 'active');
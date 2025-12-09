INSERT INTO producer
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


INSERT INTO airport
VALUES
    ('GDN', 'Gdañsk Lech Wa³êsa Airport', 'Poland', 'Gdañsk'),
	('WAW', 'Warsaw Chopin Airport', 'Poland', 'Warsaw'),
	('BZG', 'Ignacy Jan Paderewski Bydgoszcz Airport', 'Poland', 'Bydgoszcz'),
	('KRK', 'Kraków John Paul II International Airport', 'Poland', 'Kraków'),
	('LHR', 'London Heathrow Airport', 'England', 'London'),
	('DUB', 'Dublin Airport', 'Ireland', 'Dublin'),
	('CDG', 'Paris Charles de Gaulle Airport', 'France', 'Paris'),
	('ORY', 'Paris Orly Airport', 'France', 'Paris'),
	('AMS', 'Amsterdam Airport Schiphol', 'Netherlands', 'Amsterdam'),
	('BER', 'Berlin Brandenburg Airport', 'Germany', 'Berlin');


INSERT INTO product
VALUES
    -- Airplane models
    (1, 'Airbus A320neo', 112000000),    -- $112M
    (1, 'Airbus A321neo', 129000000),    -- $129M  
    (1, 'Airbus A350-900', 317000000),   -- $317M
    (2, 'Boeing 737-800', 106000000),    -- $106M
    (2, 'Boeing 737 MAX 8', 121000000),  -- $121M
    (2, 'Boeing 787-8', 248000000),      -- $248M
    (2, 'Boeing 787-9', 292000000),      -- $292M
    (3, 'Bombardier CRJ900', 52000000),  -- $52M
    (4, 'Embraer E195-E2', 63000000),    -- $63M
    (10, 'ATR 72-600', 29000000),        -- $29M
    
    -- Spare parts
    (1, 'Landing Gear', 1250000),                 -- $1.25M
    (2, 'Engine Fan Blade', 850000),              -- $850K
    (1, 'Avionics Flight Computer', 325000),      -- $325K
    (2, 'Hydraulic Actuator', 95000),             -- $95K
    (3, 'Wing Flap Track', 275000),               -- $275K
    (1, 'Thrust Reverser', 1850000),              -- $1.85M
    (2, 'APU Unit', 675000),                      -- $675K
    (4, 'Passenger Seat', 12500),                 -- $12.5K
    (1, 'Weather Radar Antenna', 145000),         -- $145K
    (2, 'Fuel Control Unit', 89000),              -- $89K
    (3, 'Cabin Pressure Controller', 68000),      -- $68K
    (1, 'Flight Control Computer', 285000),       -- $285K
    (2, 'Emergency Oxygen System', 1200),         -- $1.2K
    (4, 'Emergency Slide Pack', 18500),           -- $18.5K
    (10, 'Fire Detection System', 42000);         -- $42K


INSERT INTO airplane_model
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
    (10, 70, 1600, 510, 5900);     -- 72-600


INSERT INTO spare_part
VALUES
    (11, 'mechanical', 'Main landing gear truck with shock absorbers', 36),
    (12, 'mechanical', 'High pressure turbine fan blade set', 24),
    (13, 'avionics', 'Primary flight management computer module', 48),
    (14, 'hydraulic', 'Primary flight control surface actuator', 30),
    (15, 'structural', 'Inboard flap track with bearings', 60),
    (16, 'mechanical', 'Cascade thrust reverser', 24),
    (17, 'electrical', 'Auxiliary power unit with starter generator', 36),
    (18, 'cabin', 'Economy class seat with 16G compliance', 18),
    (19, 'avionics', 'Multi-scan weather radar transceiver', 48),
    (20, 'hydraulic', 'Electronic engine fuel control unit', 30),
    (21, 'avionics', 'Digital cabin pressure and outflow valve controller', 36),
    (22, 'safety', 'Engine fire detection and suppression loop', 24),
    (23, 'avionics', 'Triple redundant flight control computer', 48),
    (24, 'safety', 'Passenger oxygen mask drop system', 12),
    (25, 'safety', 'Type III emergency evacuation slide with inflation system', 18);


INSERT INTO employee
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
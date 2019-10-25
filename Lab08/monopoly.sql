--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Property;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY,
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY,
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE Property (
	ID integer PRIMARY KEY,
	playerID integer REFERENCES Player(ID),
	name varchar(50),
	color varchar(50),
	price integer,
	rent0House integer,
	rent1House integer,
	rent2House integer,
	rent3House integer,
	rent4House integer,
	rentHotel integer,
	numHouses integer,
	housePrice integer,
	morgaged boolean
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	score integer,
	cash integer,
	location varchar(50)
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO PlayerGame VALUES (1, 1, 0.00);
INSERT INTO PlayerGame VALUES (1, 2, 0.00);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00);
INSERT INTO PlayerGame VALUES (2, 2, 4.00);
INSERT INTO PlayerGame VALUES (2, 3, 500.00);
INSERT INTO PlayerGame VALUES (3, 2, 21.00);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00);

INSERT INTO Property VALUES (1, 1, 'Boardwalk', 'Blue', 400.00, 50.00, 200.00, 600.00, 1400.00, 1700.00, 2000.00, 5, 200.00, FALSE);
INSERT INTO Property VALUES (2, 2, 'Illinois Avenue', 'Red', 240.00, 20.00, 100.00, 300.00, 750.00, 925.00, 1100.00, 0, 150.00, FALSE);
INSERT INTO Property VALUES (3, 1, 'Kentucky Avenue', 'Red', 220.00, 18.00, 90.00, 250.00, 700.00, 875.00, 1050.00, 0, 150.00, TRUE);
INSERT INTO Property VALUES (4, 3, 'Indiana Avenue', 'Red', 220.00, 18.00, 90.00, 250.00, 700.00, 875.00, 1050.00, 0, 150.00, FALSE);

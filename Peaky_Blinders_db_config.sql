CREATE DATABASE Peaky_Blinders;

CREATE TABLE character_details (
  character_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_year INT,
  sex VARCHAR(1),
  intro_season_id INT,
  current_status VARCHAR(30),
  last_season_id INT
);

CREATE TABLE season_details (
  season_id INT,
  season_name VARCHAR(30),
  episode_id DECIMAL(3,2),
  episode_name VARCHAR(50),
  enemy_id INT,
  FOREIGN KEY(enemy_id) REFERENCES character_details(character_id) ON DELETE SET NULL
);

CREATE TABLE enemy_details (
  enemy_id INT,
  enemy_gang VARCHAR(30),
  reason_for_war VARCHAR(200),
  FOREIGN KEY(enemy_id) REFERENCES season_details(enemy_id) ON DELETE CASCADE
);

-- -----------------------------------------------------------------------------

-- CHARACTER_DETAILS
INSERT INTO character_details VALUES(100, 'Arthur', 'Shelby Sr.', 1860, 'M', 2, 'Dead', 2);
INSERT INTO character_details VALUES(101, 'Arthur', 'Shelby', 1887, 'M', 1, 'Alive', 5);
INSERT INTO character_details VALUES(102, 'Thomas', 'Shelby', 1890, 'M', 1, 'Alive', 5);
INSERT INTO character_details VALUES(103, 'Grace', 'Shelby', 1894, 'F', 1, 'Alive', 3);
INSERT INTO character_details VALUES(104, 'John', 'Shelby', 1885, 'M', 1, 'Alive', 4);
INSERT INTO character_details VALUES(105, 'Polly', 'Grey', 1884, 'F', 1, 'Alive', 5);
INSERT INTO character_details VALUES(106, 'Michael', 'Gray', 1903, 'M', 2, 'Alive', 5);
INSERT INTO character_details VALUES(107, 'Gina', 'Kapoor', 1904, 'F', 5, 'Alive', 5);
INSERT INTO character_details VALUES(108, 'Gold', 'Aberama', 1875, 'M', 4, 'Alive', 5);
INSERT INTO character_details VALUES(109, 'Bonnie', 'Gold', 1898, 'M', 4, 'Alive', 4);
INSERT INTO character_details VALUES(110, 'Billy', 'Kimber', 1880, 'M', 1, 'Dead', 1);
INSERT INTO character_details VALUES(111, 'Inspector', 'Campbell', 1875, 'M', 1, 'Dead', 2);
INSERT INTO character_details VALUES(112, 'Father', 'Hughes', 1876, 'M', 3, 'Dead', 3);
INSERT INTO character_details VALUES(113, 'Luca', 'Changretta', 1889, 'M', 4, 'Dead', 4);
INSERT INTO character_details VALUES(114, 'Oswald', 'Mosley', 1887, 'M', 5, 'Alive', 5);

-- SEASON_DETAILS
INSERT INTO season_details VALUES(1, 'Series-1', 1.1, 'Episode 1', 110);
INSERT INTO season_details VALUES(1, 'Series-1', 1.2, 'Episode 2', 110);
INSERT INTO season_details VALUES(1, 'Series-1', 1.3, 'Episode 3', 110);
INSERT INTO season_details VALUES(1, 'Series-1', 1.4, 'Episode 4', 110);
INSERT INTO season_details VALUES(1, 'Series-1', 1.5, 'Episode 5', 110);
INSERT INTO season_details VALUES(1, 'Series-1', 1.6, 'Episode 6', 110);
INSERT INTO season_details VALUES(2, 'Series-2', 2.1, 'Episode 1', 111);
INSERT INTO season_details VALUES(2, 'Series-2', 2.2, 'Episode 2', 111);
INSERT INTO season_details VALUES(2, 'Series-2', 2.3, 'Episode 3', 111);
INSERT INTO season_details VALUES(2, 'Series-2', 2.4, 'Episode 4', 111);
INSERT INTO season_details VALUES(2, 'Series-2', 2.5, 'Episode 5', 111);
INSERT INTO season_details VALUES(2, 'Series-2', 2.6, 'Episode 6', 111);
INSERT INTO season_details VALUES(3, 'Series-3', 3.1, 'Episode 1', 112);
INSERT INTO season_details VALUES(3, 'Series-3', 3.2, 'Episode 2', 112);
INSERT INTO season_details VALUES(3, 'Series-3', 3.3, 'Episode 3', 112);
INSERT INTO season_details VALUES(3, 'Series-3', 3.4, 'Episode 4', 112);
INSERT INTO season_details VALUES(3, 'Series-3', 3.5, 'Episode 5', 112);
INSERT INTO season_details VALUES(3, 'Series-3', 3.6, 'Episode 6', 112);
INSERT INTO season_details VALUES(4, 'Series-4', 4.1, 'The Noose', 113);
INSERT INTO season_details VALUES(4, 'Series-4', 4.2, 'Heathens', 113);
INSERT INTO season_details VALUES(4, 'Series-4', 4.3, 'Blackbird', 113);
INSERT INTO season_details VALUES(4, 'Series-4', 4.4, 'Dangerous', 113);
INSERT INTO season_details VALUES(4, 'Series-4', 4.5, 'The Duel', 113);
INSERT INTO season_details VALUES(4, 'Series-4', 4.6, 'The Company', 113);
INSERT INTO season_details VALUES(5, 'Series-5', 5.1, 'Black Tuesday', 114);
INSERT INTO season_details VALUES(5, 'Series-5', 5.2, 'Black Cats', 114);
INSERT INTO season_details VALUES(5, 'Series-5', 5.3, 'Strategy', 114);
INSERT INTO season_details VALUES(5, 'Series-5', 5.4, 'The Loop', 114);
INSERT INTO season_details VALUES(5, 'Series-5', 5.5, 'The Shock', 114);
INSERT INTO season_details VALUES(5, 'Series-5', 5.6, 'Mr Jones', 114);

-- ENEMY DETAIL
INSERT INTO enemy_details VALUES(110, 'Birmingham Boys', 'Ran most of the legal tracks outside of London');
INSERT INTO enemy_details VALUES(111, 'Royal Irish Constabulary', 'Hired by Winston Churchill, to locate and recover the missing consignment of guns from the Birmingham Small Arms Company factory');
INSERT INTO enemy_details VALUES(112, 'The Economic League', 'Hughes does represent the Crown and was acting under orders to report to the Reds because they wanted to provoke an attack on British soil, that would break diplomatic relations with the Communists.');
INSERT INTO enemy_details VALUES(113, 'Changretta mob', 'Launched a vandetta against Shelbys for killing his father.');
INSERT INTO enemy_details VALUES(114, 'British Union of Fascists', 'Starting evil political regime');
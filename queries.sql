-- ------ BASICS ------



-- Show metadata of character_details table
DESCRIBE character_details;

-- Show "character_details" table asc by intro season id
SELECT *
FROM character_details
ORDER BY intro_season_id;

-- Show how many total episodes there are
SELECT DISTINCT COUNT(episode_id)
FROM season_details;



-- ------ WILDCARDS, LIMITS, ORDER BY, JOINS ------



-- Show characters who are male and have first name containing 'ly' or last_name second character = 'h'
SELECT first_name,
       TRIM(last_name),
       sex
FROM character_details
WHERE sex='M' and (first_name LIKE '%ly%' or last_name LIKE '_h%') ;

-- Show the 5 oldest characters
SELECT first_name as forename,
       last_name as surname,
       year(current_date)-birth_year as age
FROM character_details
ORDER BY age DESC
LIMIT 5;

-- Show the name of the intro season for each character in the character_details table
SELECT DISTINCT character_id,
                character_details.first_name,
                character_details.last_name,
                season_details.season_id as Intro_Season
FROM character_details
LEFT OUTER JOIN season_details
ON character_details.intro_season_id = season_details.season_id;



-- ------ ALTER TABLE/COLUMN, CREATE NEW TABLE, DELETE/DROP ------



-- Update episode_id column in season_details to remove trailing '0'
ALTER TABLE season_details MODIFY COLUMN episode_id DECIMAL(2,1);

-- Update Changretta mob to have 'gang_country' column with value='Italian'
ALTER TABLE enemy_details ADD enemy_country_origin VARCHAR(50);

UPDATE enemy_details
SET enemy_details.enemy_country_origin = 'Italian'
WHERE enemy_details.enemy_gang = 'Changretta mob';

-- Create column showing sum of season episodes in season_details table
ALTER TABLE season_details ADD episodes_in_season INT;

UPDATE season_details as sd
INNER JOIN
    (SELECT DISTINCT season_id as season,
    COUNT(episode_id) as season_count
    FROM season_details
    GROUP BY season_id) sd1
ON sd.season_id=sd1.season
SET sd.episodes_in_season = sd1.season_count
WHERE sd.season_id=sd1.season;

-- Create new table
CREATE TABLE season_one_detail (
    character_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    gang VARCHAR(20) DEFAULT 'Peaky Blinders'
);
INSERT INTO season_one_detail (character_id, name, gang) VALUES (101, 'Arthur Shelby', DEFAULT);
INSERT INTO season_one_detail (character_id, name, gang) VALUES (102, 'Thomas Shelby', DEFAULT);
INSERT INTO season_one_detail (character_id, name, gang) VALUES (103, 'John Shelby', DEFAULT);
INSERT INTO season_one_detail (character_id, name, gang) VALUES (113, 'Luca Changretta', 'Changretta mob');

-- Delete all rows in season_one_detail with character_id below 111
DELETE FROM season_one_detail
WHERE character_id <= 110;

-- Drop 'gang' column from season_one_detail
ALTER TABLE season_one_detail DROP COLUMN gang;

-- Drop season_one_detail from "Peaky_Blinders" database

DROP TABLE season_one_detail;



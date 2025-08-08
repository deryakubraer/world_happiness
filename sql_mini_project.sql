CREATE DATABASE if not exists sql_project;
USE sql_project;


DROP TABLE IF EXISTS score;

CREATE TABLE score (
    country_id INT NOT NULL,
    year_id INT NOT NULL,
    score FLOAT,
    PRIMARY KEY (country_id, year_id),
    FOREIGN KEY (country_id) REFERENCES country(country_id),
    FOREIGN KEY (year_id) REFERENCES years(year_id)
);

drop table years;

CREATE TABLE if not exists metrics (
    country_id INT NOT NULL,
    year_id INT NOT NULL,
    gdp_per_capita DOUBLE NOT NULL,
    social_support DOUBLE NOT NULL,
    healthy_life_expectancy DOUBLE NOT NULL,
    freedom_to_make_life_choices DOUBLE NOT NULL,
    generosity DOUBLE NOT NULL,
    perceptions_of_corruption DOUBLE,
    PRIMARY KEY (country_id, year_id),
    FOREIGN KEY (country_id) REFERENCES country(country_id),
    FOREIGN KEY (year_id) REFERENCES years(year_id)
);

CREATE TABLE if not exists years (
year_id INT NOT NULL,
years INT NOT NULL,
PRIMARY KEY (year_id)
);


drop table country;
CREATE TABLE if not exists country (
country_id INT NOT NULL,
country varchar(40) NOT NULL,
PRIMARY KEY (country_id)
);

SHOW CREATE TABLE years;

SELECT * FROM years;

SELECT c.country, s2019.overall_rank - s2018.overall_rank AS rank_difference,
m2019.gdp_per_capita - m2018.gdp_per_capita AS capita_difference,
m2019.social_support - m2018.social_support AS support_difference,
m2019.healthy_life_expectancy - m2018.healthy_life_expectancy AS health_difference,
m2019.freedom_to_make_life_choices - m2018.freedom_to_make_life_choices AS freedom_difference,
m2019.generosity - m2018.generosity AS generosity_difference,
m2019.perceptions_of_corruption - m2018.perceptions_of_corruption AS corruption_difference
FROM country AS c
JOIN score AS s2019
ON c.country_id = s2019.country_id
JOIN score AS s2018 
ON c.country_id = s2018.country_id
JOIN metrics AS m2019
ON c.country_id = m2019.country_id
JOIN metrics AS m2018
ON c.country_id = m2018.country_id
WHERE s2018.year_id = 1 AND s2019.year_id = 2 AND m2019.year_id = 2 AND M2018.year_id = 1 AND s2019.overall_rank - s2018.overall_rank = -1
ORDER BY capita_difference DESC;


SELECT c.country, s2019.overall_rank - s2018.overall_rank AS rank_difference,
m2019.gdp_per_capita - m2018.gdp_per_capita AS capita_difference,
m2019.social_support - m2018.social_support AS support_difference,
m2019.healthy_life_expectancy - m2018.healthy_life_expectancy AS health_difference,
m2019.freedom_to_make_life_choices - m2018.freedom_to_make_life_choices AS freedom_difference,
m2019.generosity - m2018.generosity AS generosity_difference,
m2019.perceptions_of_corruption - m2018.perceptions_of_corruption AS corruption_difference
FROM country AS c
JOIN score AS s2019
ON c.country_id = s2019.country_id
JOIN score AS s2018 
ON c.country_id = s2018.country_id
JOIN metrics AS m2019
ON c.country_id = m2019.country_id
JOIN metrics AS m2018
ON c.country_id = m2018.country_id
WHERE s2018.year_id = 1 AND s2019.year_id = 2 AND m2019.year_id = 2 AND M2018.year_id = 1 AND s2019.overall_rank - s2018.overall_rank = 1
ORDER BY capita_difference DESC;



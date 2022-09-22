USE world;
SHOW TABLES;

SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM countrylanguage;

SELECT COUNT(CountryCode) FROM city WHERE CountryCode="USA";
#2.	Find out the population and life expectancy for people in Argentina.
SELECT Population, LifeExpectancy FROM country WHERE Name="Argentina";
#3.	Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
SELECT name, LifeExpectancy FROM country ORDER BY LifeExpectancy DESC
LIMIT 1;
#4.	Using JOIN ... ON, find the capital city of Spain.

SELECT 
Country.Name,
Continent,
Capital,
City.Name
 FROM country
 JOIN city ON Capital=ID
WHERE country.Name = "Spain";

#5.	Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
 
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM countrylanguage;

SELECT CountryCode, Language, country.name, Region FROM countrylanguage
JOIN country ON CountryCode=Code
WHERE Region="Southeast Asia";

SELECT 
COUNT(Language)
FROM countrylanguage
JOIN country ON CountryCode=Code
WHERE Region="Southeast Asia";

#6.	Using a single query, list 25 cities around the world that start with the letter F
SELECT * FROM city
WHERE Name LIKE 'F%'
LIMIT 25;

SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM countrylanguage;

#7.	Using COUNT and JOIN ... ON, get the number of cities in China.
SELECT COUNT(city.Name) FROM city
JOIN country ON CountryCode=Code
WHERE country.Name="China";

#8.	Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
SELECT Population, Name FROM country
WHERE (Population is NOT NULL AND Population>0)
ORDER BY Population ASC
LIMIT 1;
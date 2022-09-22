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

#9.	Using aggregate functions, return the number of countries the database contains.
SELECT COUNT(country.Name) FROM country;

#10.	What are the top ten largest countries by area?
SELECT
SurfaceArea,
country.Name
FROM country
ORDER BY SurfaceArea DESC
LIMIT 10;

SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM countrylanguage;

#11.	List the five largest cities by population in Japan.
SELECT city.Name,
country.Name
FROM city
JOIN country ON CountryCode=Code
WHERE country.Name="Japan"
ORDER BY city.Name DESC
LIMIT 5;

#12.	List the names and country codes of every country with Elizabeth II as its Head of State. 
#You will need to fix the mistake first!

SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM countrylanguage;

SELECT HeadOfState,
Name,
Code
FROM country
WHERE HeadOfState="Elisabeth II";

#13.	List the top ten countries with the smallest population-to-area ratio. 
#Discard any countries with a ratio of 0

SELECT
SurfaceArea,
Population,
SurfaceArea/Population,
country.Name
FROM country
WHERE SurfaceArea/Population >0
ORDER BY 3 ASC
LIMIT 10;

#14.	List every unique world language.
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM countrylanguage;


SELECT DISTINCT(language)
FROM countrylanguage;

#List the names and GNP of the world's top 10 richest countries.
SELECT Name,
GNP
FROM country
ORDER BY GNP DESC
LIMIT 10;

#15.	List the names of, and number of languages spoken by, the top ten most multilingual countries.
SELECT COUNT(Language),
country.Name
FROM countrylanguage
JOIN country ON CountryCode=Code
GROUP BY country.Name
ORDER BY 1 DESC
LIMIT 10;


#16.List every country where over 50% of its population can speak German.
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM countrylanguage;

SELECT Language,
Percentage,
country.name
FROM countrylanguage
JOIN country ON Countrycode=Code
WHERE Percentage >=50 AND Language="German";

#17.	Which country has the worst life expectancy? Discard zero or null values.
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM countrylanguage;

SELECT LifeExpectancy,
Name 
FROM country
WHERE LifeExpectancy IS NOT NULL
ORDER BY LifeExpectancy ASC
LIMIT 1;

#19.	List the top three most common government forms.
SELECT GovernmentForm,
COUNT(GovernmentForm)
FROM country
GROUP BY 1
ORDER BY COUNT(GovernmentForm) DESC
LIMIT 3;

#20.How many countries have gained independence since records began?
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM countrylanguage;

SELECT COUNT(Name)
FROM country
WHERE IndepYear IS NOT NULL;







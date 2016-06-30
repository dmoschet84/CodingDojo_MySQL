--1. Countries that speak Slovene
SELECT name, L.language, L.percentage
FROM countries
LEFT JOIN languages L ON countries.code = L.country_code
WHERE L.language = 'Slovene'
ORDER BY L.percentage desc

--2. Total cities for each country. Order by total cities desc.
SELECT countries.name, count(*) as Cities
FROM cities 
LEFT JOIN countries ON cities.country_code = countries.code
GROUP BY name
ORDER BY Cities desc

--3. What query would you run to get all the cities in Mexico with a population of greater than 500,000? Your query should arrange the result by population in descending order.
SELECT cities.name, cities.population
FROM cities 
LEFT JOIN countries ON cities.country_code = countries.code
WHERE countries.name = 'Mexico'
AND cities.population > 500000
ORDER BY cities.population desc

--4. What query would you run to get all languages in each country with a percentage greater than 89%? Your query should arrange the result by percentage in descending order. 
SELECT countries.name, languages.language, languages.percentage
FROM countries 
LEFT JOIN languages ON countries.code = languages.country_code
WHERE languages.percentage > 89
ORDER BY languages.percentage desc

--5. What query would you run to get all the countries with Surface Area below 501 and Population greater than 100,000?
SELECT name, surface_area, population
FROM countries
WHERE surface_area < 501
AND population > 100000

--6. What query would you run to get countries with only Constitutional Monarchy with a capital greater than 200 and a life expectancy greater than 75 years?
SELECT name, capital, life_expectancy
FROM countries
WHERE capital > 200
AND life_expectancy > 75

--7. What query would you run to get all the cities of Argentina inside the Buenos Aires district and have the population greater than 500, 000? The query should return the Country Name, City Name, District and Population.
SELECT countries.name as Country, cities.name as City, cities.district, cities.population
FROM cities
LEFT JOIN countries ON cities.country_code = countries.code
WHERE countries.name = 'Argentina'
AND cities.district = 'Buenos Aires'
AND cities.population > 500000

--8. What query would you run to summarize the number of countries in each region? The query should display the name of the region and the number of countries. Also, the query should arrange the result by the number of countries in descending order. 
SELECT region, count(name) as countries
FROM countries
GROUP BY region
ORDER BY count(name) desc





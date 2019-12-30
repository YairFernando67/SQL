SELECT population FROM world
  WHERE name = 'Germany';

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

SELECT name, continent, population FROM world

SELECT name FROM world
  WHERE population >= 200000000

SELECT name, gdp/population from world
  where population > 200000

SELECT name, population / 1000000 from world 
  where continent = 'South America'

SELECT name, population from world
  WHERE name in ('France', 'Germany', 'Italy')
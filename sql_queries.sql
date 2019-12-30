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

SELECT name from world
  where name like '%United%'

SELECT name, population, area from world
  where area > 3000000 or population > 250000000

SELECT name, population, area from world
  where area > 3000000 xor population > 250000000

SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) from world
  where continent = 'South America'

SELECT name, capital FROM world
  WHERE LENGTH(name) = LENGTH(capital)

SELECT name, capital FROM world
  WHERE LEFT(name,1) = LEFT(capital,1) and name <> capital

SELECT name
   FROM world
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %'

SELECT yr, subject, winner FROM nobel
 WHERE yr = 1950

SELECT winner FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

SELECT yr, subject from nobel
  WHERE winner = 'Albert Einstein'

SELECT winner from nobel
  WHERE subject = 'Peace' and yr >= 2000

SELECT yr, subject, winner from nobel
  WHERE yr between 1980 and 1989 and subject = 'Literature'
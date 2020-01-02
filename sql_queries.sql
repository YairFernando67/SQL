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

SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')
          
SELECT winner from nobel
  WHERE winner LIKE 'John%'

SELECT yr, subject, winner from nobel
  WHERE subject = 'Physics' and yr = 1980 or subject = 'Chemistry' and yr = 1984

SELECT yr, subject, winner from nobel
  WHERE yr = 1980 and subject not in ('Chemistry','Medicine')

SELECT yr, subject, winner from nobel
  WHERE subject = 'Medicine' and yr < 1910 or subject = 'Literature' and yr >= 2004

SELECT * FROM nobel where winner = 'PETER GRÜNBERG'

SELECT * FROM nobel where winner = "EUGENE O\'NEILL"

SELECT winner, yr, subject FROM nobel where winner like 'Sir%'

SELECT winner, subject FROM nobel
  WHERE yr=1984 ORDER BY subject IN ('Physics','Chemistry'),subject,winner

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

SELECT name from world
  where continent = 'Europe' and gdp/population > (select gdp/population from world where name = 'United Kingdom')

SELECT name, continent from world
  where continent in (select continent from world where name in ('Argentina','Australia')) order by name

SELECT name, population from world
  WHERE population > (SELECT population from world WHERE name = 'Canada') and population < (SELECT population FROM world WHERE name = 'Poland')

SELECT name, CONCAT(ROUND(100*population/(SELECT population 
                              FROM world 
                              WHERE name = 'Germany')), '%')
  FROM world WHERE continent = 'Europe'

SELECT name from world
  WHERE gdp > ALL(SELECT gdp from world where gdp > 0 and continent = 'Europe')

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

SELECT continent, name from world as x
  WHERE name <= ALL 
    (SELECT name from world as y where y.continent = x.continent)

SELECT name, continent, population FROM world x
  WHERE 25000000 > ALL(select POPULATION from world y where x.continent = y.continent AND y.population > 0)

SELECT name, continent from world x
  WHERE population > ALL(select population*3 from world y where x.continent = y.continent AND y.population > 0 AND y.name != x.name)
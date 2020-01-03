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

SELECT SUM(population) FROM world

SELECT DISTINCT continent from world

SELECT SUM(gdp) from world
  WHERE continent = 'Africa'

SELECT COUNT(name) from world
  WHERE area >= 1000000

SELECT SUM(population) from world
  WHERE name in  ('Estonia', 'Latvia', 'Lithuania')

SELECT continent, COUNT(name) from world group by continent

SELECT continent, COUNT(name) from world
  WHERE population >= 10000000 group by continent

SELECT DISTINCT continent from world
  GROUP BY continent HAVING SUM(population) >= 100000000

SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

SELECT id,stadium,team1,team2
  FROM game WHERE id = 1012

SELECT player, teamid,stadium, mdate
  FROM game JOIN goal ON (id=matchid) WHERE teamid = 'GER'

SELECT team1, team2, player from game JOIN goal ON (id=matchid) where player LIKE '%Mario%'

SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on teamid = id
 WHERE gtime<=10

SELECT mdate, teamname from game
  JOIN eteam on game.team1 = eteam.id
  where coach = 'Fernando Santos'

SELECT player from goal
  JOIN game on goal.matchid = game.id
    WHERE stadium = 'National Stadium, Warsaw'

SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (teamid!='GER' AND (team1='GER' OR team2='GER'))

SELECT teamname, COUNT(matchid)
  FROM eteam JOIN goal ON id=teamid
    GROUP BY teamna

SELECT stadium, COUNT(matchid) from game
  JOIN goal on id=matchid GROUP BY stadium

SELECT matchid,mdate,COUNT(player)
  FROM game JOIN goal ON (matchid = id AND (team1 = 'POL' OR team2='POL')) GROUP BY matchid,mdate

SELECT id, mdate, COUNT(player) from game
  JOIN goal on (id=matchid AND (team1= 'GER' OR team2='GER') AND teamid = 'GER')
    GROUP BY Id, mdate

SELECT mdate,
  team1, SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) as score1, 
  team2, 
  SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END)as score2
  FROM game LEFT JOIN goal ON matchid = id
  GROUP BY mdate, team1, team2 ORDER BY mdate, matchid

SELECT id, title
 FROM movie
 WHERE yr=1962

SELECT yr from movie where title = 'Citizen Kane'

SELECT id, title, yr from movie
  WHERE title like '%Star Trek%' order by yr

SELECT id from actor WHERE name = 'Glenn Close'

SELECT id from movie WHERE title = 'Casablanca'

SELECT name from movie m
  join casting c on m.id=c.movieid
  join actor a on c.actorid=a.id
  where movieid=11768

SELECT name from movie m
  join casting c on m.id=c.movieid
  join actor a on c.actorid=a.id
  where title='Alien'

SELECT m.title from movie m
  join casting c on m.id=c.movieid
  join actor a on c.actorid=a.id
  where a.name='Harrison Ford'

SELECT title from movie
  JOIN casting on (id=movieid AND actorid = (SELECT id from actor WHERE name = 'Harrison Ford') AND ord != 1)

SELECT title, name from movie m
  join casting c on m.id=c.movieid
  join actor a on c.actorid =a.id
    WHERE ord=1 AND yr=1962

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

SELECT title,name 
  from movie 
  JOIN casting ON (movieid=movie.id AND ord=1)
  JOIN actor ON (actorid=actor.id)
    WHERE movie.id in 
      (SELECT movieid FROM casting WHERE actorid IN 
        (SELECT id FROM actor WHERE name='Julie Andrews'))

SELECT name from actor
  JOIN casting on (id = actorid AND (SELECT COUNT(ord) FROM casting 
    WHERE actorid = actor.id AND ord = 1)>=30) group by name

SELECT title, COUNT(actorid) as cast
  FROM movie JOIN casting on id=movieid
  WHERE yr = 1978
    GROUP BY title
    ORDER BY cast DESC, title

SELECT name from actor
  join casting on id=actorid
  join movie m on movieid=m.id
    where title in (SELECT title from actor 
      join casting on id=actorid
      join movie m on movieid=m.id
      where name='Art Garfunkel') and name != 'Art Garfunkel'

SELECT name from teacher
  WHERE dept IS NULL

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
  FROM teacher LEFT JOIN dept
    ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
  FROM dept LEFT JOIN teacher
    ON (dept.id=teacher.dept)

SELECT name
      ,COALESCE(mobile, '07986 444 2266')
  FROM teacher

SELECT teacher.name, COALESCE(dept.name, 'None') from teacher
  left join dept on teacher.dept=dept.id

SELECT COUNT(name), COUNT(mobile) from teacher

SELECT dept.name, COUNT(teacher.name)
  FROM teacher right join dept on teacher.dept=dept.id
    GROUP by dept.name

SELECT teacher.name, CASE WHEN dept.id=1 THEN 'Sci'
                          WHEN dept.id=2 THEN 'Sci' ELSE 'Art' END from teacher
  LEFT JOIN dept on teacher.dept=dept.id

SELECT teacher.name, CASE WHEN dept.id=1 THEN 'Sci'
                          WHEN dept.id=3 THEN 'Art'
                          WHEN dept.id=2 THEN 'Sci' ELSE 'None' END from teacher
  LEFT JOIN dept on teacher.dept=dept.id

SELECT COUNT(id) from stops

SELECT id from stops 
  WHERE name = 'Craiglockhart'

SELECT id, name from stops 
  JOIN route on id=stop WHERE company='LRT' and num='4'

SELECT company, num, COUNT(*)as visits
  FROM route WHERE stop=149 OR stop=53
  GROUP BY company, num
  HAVING visits=2

SELECT a.company, a.num, a.stop, b.stop
  FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  WHERE a.stop=53 and b.stop=149

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name='London Road'

SELECT DISTINCT a.company, a.num FROM route a JOIN route b ON
  (a.company =b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name='Leith'

SELECT DISTINCT a.company, a.num
FROM route a
  JOIN route b ON (a.num=b.num AND a.company=b.company)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross'

SELECT stopa.name, a.company, a.num
FROM route a
  JOIN route b ON (a.num=b.num AND a.company=b.company)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopb.name = 'Craiglockhart'

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Tollcross';
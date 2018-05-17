CREATE TABLE restaurant(
  id SERIAL NOT NULL PRIMARY KEY,
  name varchar,
  distance numeric,
  stars numeric,
  category varchar,
  favorite_dish varchar,
  does_takeout boolean,
  last_time date
  );
  
  INSERT INTO restaurant VALUES (
  DEFAULT, 'Steak Haus', 1.1, 5, 'fine dining','NY Strip',FALSE,'2018-01-01'
);

SELECT name FROM restaurant WHERE stars = 5;

SELECT name, favorite_dish FROM restaurant WHERE stars = 5;

SELECT id FROM restaurant WHERE name = 'Pizza Palace';

SELECT * FROM restaurant WHERE does_takeout = TRUE;

SELECT * FROM restaurant WHERE  = 'BBQ';

SELECT * FROM restaurant WHERE category = 'BBQ' AND does_takeout = TRUE;

SELECT * FROM restaurant WHERE distance <= 2;

SELECT * FROM restaurant WHERE last_time < NOW() - INTERVAL '1 WEEKS';

SELECT * FROM restaurant WHERE last_time < NOW() - INTERVAL '1 WEEKS' AND stars = 5;

SELECT * FROM restaurant ORDER BY distance ASC;

SELECT * FROM restaurant ORDER BY distance ASC LIMIT 2;

SELECT * FROM restaurant ORDER BY stars DESC LIMIT 2;

SELECT * FROM restaurant WHERE distance <2 ORDER BY stars DESC LIMIT 2;

SELECT COUNT(*) FROM restaurant;

SELECT category,COUNT(*) FROM restaurant GROUP BY category;

SELECT category,AVG(stars) FROM restaurant GROUP BY category;

SELECT category,MAX(stars) FROM restaurant GROUP BY category;
CREATE TABLE reviewer (
id SERIAL PRIMARY KEY,
name VARCHAR,
email VARCHAR,
karma INTEGER CHECK (karma >= 0 AND karma <= 7)
);

CREATE TABLE restaurant (
id SERIAL PRIMARY KEY,
name VARCHAR,
address VARCHAR,
category VARCHAR
);

CREATE TABLE review (
id SERIAL PRIMARY KEY,
reviewer_id INTEGER REFERENCES reviewer ,
stars INTEGER CHECK (stars >= 1 AND stars <=5),
title VARCHAR,
review VARCHAR,
restaurant_id INTEGER REFERENCES restaurant
);

SELECT * FROM review WHERE restaurant_id = 3;

SELECT review.title, review.review, restaurant.name FROM review 
  INNER JOIN restaurant on review.restaurant_id=restaurant.id
  WHERE restaurant.name = '2 Spoons Steakhouse';
  
SELECT review.title, review.review, reviewer.name FROM review 
  INNER JOIN reviewer on review.reviewer_id=reviewer.id
  WHERE reviewer.name = 'Joey Bats';
  
SELECT review.review, restaurant.name FROM review 
  INNER JOIN restaurant on review.restaurant_id=restaurant.id;
  
SELECT restaurant.name, AVG(review.stars) as Avg_Star_Rating FROM review 
  INNER JOIN restaurant on review.restaurant_id=restaurant.id
GROUP BY restaurant.name;

SELECT restaurant.name, COUNT(review.stars) as No_Reviews FROM review 
  INNER JOIN restaurant on review.restaurant_id=restaurant.id
GROUP BY restaurant.name;

SELECT restaurant.name AS restaurant_name, review.review, reviewer.name AS reviewer_name FROM review 
  FULL JOIN restaurant on review.restaurant_id=restaurant.id
  FULL JOIN reviewer on review.reviewer_id=reviewer.id
  WHERE review IS NOT NULL
;

SELECT reviewer.name AS reviewer_name, AVG(review.stars) as Avg_Star_Rating FROM review 
  FULL JOIN restaurant on review.restaurant_id=restaurant.id
  FULL JOIN reviewer on review.reviewer_id=reviewer.id
  WHERE review IS NOT NULL
  GROUP BY reviewer.name
;

SELECT reviewer.name AS reviewer_name, MIN(review.stars) as Lowest_Star_Rating FROM review 
  FULL JOIN restaurant on review.restaurant_id=restaurant.id
  FULL JOIN reviewer on review.reviewer_id=reviewer.id
  WHERE review IS NOT NULL
  GROUP BY reviewer.name
;

SELECT restaurant.category, count(restaurant.id)  FROM restaurant 
  GROUP BY restaurant.category
;

SELECT restaurant.name AS restaurant_name,SUM(CASE WHEN review.stars=5 THEN 1 ELSE 0 END) FROM review 
  FULL JOIN restaurant on review.restaurant_id=restaurant.id
  FULL JOIN reviewer on review.reviewer_id=reviewer.id
  WHERE review IS NOT NULL
  GROUP BY restaurant.name
;


SELECT restaurant.category,AVG(review.stars) FROM review 
  FULL JOIN restaurant on review.restaurant_id=restaurant.id
  FULL JOIN reviewer on review.reviewer_id=reviewer.id
  WHERE review IS NOT NULL
  GROUP BY restaurant.category
;

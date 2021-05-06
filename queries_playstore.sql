-- Comments in SQL Start with dash-dash --
SELECT * FROM analytics WHERE id = 1880;
SELECT ID, app_name FROM analytics WHERE last_updated = '2018-08-01';
SELECT category, COUNT(*) FROM analytics GROUP BY category;
SELECT app_name, reviews FROM analytics LIMIT 5;
SELECT * FROM analytics WHERE rating >= 4.8 ORDER BY reviews desc LIMIT 1;
SELECT category, AVG(rating) AS avg_rate FROM analytics GROUP BY category ORDER BY avg_rate desc;
SELECT app_name, price, rating FROM analytics WHERE rating < 3 ORDER BY price desc LIMIT 1;
SELECT * FROM analytics WHERE min_installs <= 50 AND rating IS NOT NULL ORDER BY rating;
SELECT app_name FROM analytics WHERE rating < 3 AND reviews >= 10000;
SELECT app_name, price, reviews FROM analytics WHERE price BETWEEN 0.1 AND 1 ORDER BY reviews desc LIMIT 10;
SELECT app_name, last_updated FROM analytics WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);
SELECT app_name, price FROM analytics WHERE price = (SELECT MAX(price) FROM analytics);
SELECT COUNT(reviews) FROM analytics;
SELECT category, COUNT(*) FROM analytics GROUP BY category HAVING COUNT(*) > 300;
SELECT app_name, reviews, min_installs, min_installs/reviews AS proportion FROM analytics WHERE min_installs >= 100000 ORDER BY proportion desc LIMIT 1;
-- FS1. Find the name and rating of the top rated apps in each category, 
-- among apps that have been installed at least 50,000 times.
SELECT category, app_name, rating FROM analytics WHERE (rating, category) IN 
(SELECT MAX(rating), category FROM analytics WHERE min_installs >= 50000 GROUP BY category) 
ORDER BY category;
-- FS2. Find all the apps that have a name similar to "facebook".
SELECT app_name FROM analytics WHERE app_name ILIKE '&facebook&';
-- FS3. Find all the apps that have more than 1 genre.
SELECT app_name FROM analytics WHERE array_length(genres, 1) > 1;
-- FS4. Find all the apps that have education as one of their genres.
SELECT app_name FROM analytics WHERE genres && '{"education"}' = true;
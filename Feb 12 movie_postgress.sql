--Question 1 Give the name, release year, and worldwide gross of the lowest grossing movie.
SELECT
s."film_title" AS "s.name", 
s."release_year" AS "s.year", 
r1."worldwide_gross" AS "r1.w_gross"
FROM specs AS s
LEFT JOIN revenue AS r1
ON s."movie_id"= r1."movie_id"
ORDER By r1.worldwide_gross ASC;
--Answer Semi_Tough 1977 $37187139


--Question 2 What year has the highest average imdb rating?
SELECT s."release_year", AVG(imdb_rating)
FROM specs AS s
LEFT JOIN rating AS r
ON s."movie_id"= r."movie_id"
GROUP BY s."release_year", r."imdb_rating"
ORDER BY imdb_rating DESC;
--Answer 2008


--Question 3. What is the highest grossing G-rated movie? Which company distributed it?
SELECT * 
FROM revenue
left JOIN specs
on revenue."movie_id" = specs."movie_id"
Left Join distributors
ON distributors."distributor_id" = specs."movie_id"
WHERE mpaa_rating = 'G'
Order by worldwide_gross DESC
Limit 3

SELECT distributors."company_name"
FROM distributors
WHERE company_name = '86124'
--Answer Toy Story 4 Walt Disney


--Question 4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.
SELECT company_name, film_title
FROM distributors
LEFT JOIN specs
ON distributors."distributor_id" = specs."domestic_distributor_id"
ORDER BY company_name


--Question5. Write a query that returns the five distributors with the highest average movie budget.
SELECT company_name, AVG(film_budget), specs."movie_id"
FROM distributors
INNER JOIN specs 
ON distributors."distributor_id" = specs."domestic_distributor_id"
INNER JOIN revenue
on revenue."movie_id" = specs."movie_id" 
GROUP BY company_name, specs."movie_id", revenue."film_budget"
ORDER by film_budget DESC
LIMIT 10
--Answer Walt Disney (1st-4th) and Warner Bros. (5th)


--Question 6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?
SELECT *
FROM distributors
WHERE headquarters NOT LIKE '%CA%'
--Answer 2

       
--Question 7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?

SELECT AVG(imdb_rating), MIN(length_in_min), MAX(length_in_min)
FROM rating
INNER JOIN specs
ON specs."movie_id" = rating."movie_id"
GROUP BY length_in_min
Order BY length_in_min ASC, length_in_min DESC


--Answer









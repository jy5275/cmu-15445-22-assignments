
-- For all people born in 1955, get their name and average rating on all movies they have been part of through their careers. Output the 9th decile of individuals as measured by their average career movie rating.
-- Details: Calculate average ratings for each individual born in 1955 across only the movies they have been part of. Compute the quantiles for each individual's average rating using NTILE(10).
-- Make sure your output is formatted as follows (round average rating to the nearest hundredth, results should be ordered by a compound value of their ratings descending and secondly their name in alphabetical order): Stanley Nelson|7.13
-- Note: You should take quantiles after processing the average career movie rating of individuals. In other words, find the individuals who have an average career movie rating in the 9th decile of all individuals.

-- window func: https://zhuanlan.zhihu.com/p/114921777
SELECT name, ar FROM (
SELECT 
	name, 
	round(avg(rating), 2) ar, 
	ntile(10) OVER (ORDER BY round(avg(rating), 2)) bktId  
FROM ratings r JOIN (
	SELECT p.name, title_id FROM (SELECT person_id, name FROM people where born = 1955) p JOIN (
		SELECT t.title_id, c.person_id FROM titles t JOIN crew c ON c.title_id=t.title_id AND t.type = "movie"
	) c ON p.person_id = c.person_id
) c ON r.title_id = c.title_id
GROUP BY name) t WHERE bktId = 9 ORDER BY ar DESC, name;
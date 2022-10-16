-- Compute intersting statistics on the ratings of content on a per-decade basis.
-- Details: Get the avg rating (rounded to two decimal places), top rating, min rating, and the number of releases in each decade. 
-- Exclude titles which have not been premiered (NULL). 
-- Print the relevant decade string that looks like 1990s. Order the decades 1st by avg(rating) desc and 2nd by decade asc, to break ties.
-- output format: DECADE|AVG_RATING|TOP_RATING|MIN_RATING|NUM_RELEASES
SELECT 
	t.premiered || "s" DECADE,  
	round(avg(rating), 2) AVG_RATING, 
	max(rating) TOP_RATING, 
	min(rating) MIN_RATING, 
	count(*) NUM_RELEASES 
FROM ratings r JOIN (
	SELECT title_id, premiered - premiered % 10 AS premiered FROM titles WHERE premiered IS NOT NULL
) t ON  r.title_id = t.title_id 
GROUP BY t.premiered
ORDER BY AVG_RATING DESC, DECADE;
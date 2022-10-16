-- Determine the most popular works with a person who has "Cruise" in their name and is born in 1962.
-- Details: Get the works with the most votes that have a person in the crew with "Cruise" in their name who was born in 1962. 
-- Return both the name of the work and the number of votes and only list the top 10 results in order from most to least votes. 
-- Make sure your output is formatted as follows: Top Gun|408389

SELECT primary_title, votes FROM ratings r JOIN (
	SELECT primary_title, t.title_id title_id FROM titles t JOIN (
		SELECT p.name name, c.title_id title_id FROM (SELECT * FROM people WHERE name like "%Cruise%" AND born = 1962)  p 
		JOIN crew c ON p.person_id = c.person_id
	) c ON t.title_id = c.title_id
) t ON r.title_id = t.title_id
ORDER BY votes DESC LIMIT 10;
-- Find the people who appear most frequently as crew members.
SELECT name, cnt FROM people p JOIN
(SELECT person_id, count(*) cnt FROM crew GROUP BY person_id  ORDER BY cnt DESC LIMIT 20) a 
ON a.person_id = p.person_id ORDER BY cnt DESC
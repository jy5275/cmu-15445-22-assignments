-- List the all the different actors and actresses who have starred in a work with Nicole Kidman (born in 1967).
-- Details: Print only the names of the actors and actresses in alphabetical order. 
-- The answer should include Nicole Kidman herself. Each name should only appear once in the output.
-- Note: As mentioned in the schema, when considering the role of an individual on the crew, refer to the field category. 
-- The roles "actor" and "actress" are different and should be accounted for as such.


WITH allc AS( 
	SELECT * FROM (SELECT name, person_id FROM people) p JOIN crew c ON c.person_id =p.person_id
)
SELECT DISTINCT c2.name FROM allc c1 JOIN allc c2 
ON c1.name = "Nicole Kidman" AND c1.title_id = c2.title_id AND (c2.category = "actor" or c2.category = "actress") ORDER BY c2.name;

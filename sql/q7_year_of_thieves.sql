-- List the number of works that premiered in the same year that "Army of Thieves" premiered.
-- Details: Print only the total number of works. The answer should include "Army of Thieves" itself. 
-- For this question, determine distinct works by their title_id, not their names.

SELECT count(DISTINCT t2.title_id) FROM titles t1 JOIN titles t2 ON  t1.primary_title = "Army of Thieves" AND  t1.premiered = t2.premiered;

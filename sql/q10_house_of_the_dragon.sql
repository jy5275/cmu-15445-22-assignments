-- CTE https://sqlite.org/lang_with.html
-- Recursive: https://www.51cto.com/article/677598.html
-- Why Can’t I Use ROW_NUMBER() in WHERE? https://learnsql.com/blog/window-functions-not-allowed-in-where/
WITH RECURSIVE	conc(x, lastId) AS (
	SELECT * FROM (
		SELECT *, row_number() OVER(ORDER BY title) AS seqId FROM (
			SELECT DISTINCT title FROM akas a JOIN (SELECT * FROM titles WHERE type="tvSeries" AND primary_title="House of the Dragon") t ON t.title_id=a.title_id ORDER BY title
		) t LIMIT 1
	)
	UNION 
	SELECT x || ", " || s.title, seqId FROM conc JOIN (
			SELECT *, row_number() OVER(ORDER BY title) AS seqId FROM (
				SELECT DISTINCT title FROM akas a JOIN (SELECT * FROM titles WHERE type="tvSeries" AND primary_title="House of the Dragon") t ON t.title_id=a.title_id ORDER BY title
				) t
		) s ON conc.lastId = s.seqId-1  ORDER BY seqId
) SELECT  x FROM conc ORDER BY length(x) DESC limit 1;

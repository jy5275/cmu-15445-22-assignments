-- Find the 10 `Sci-Fi` works with the longest runtimes.
select primary_title, premiered, runtime_minutes || " (mins)" FROM titles 
WHERE genres like '%Sci-Fi%' and runtime_minutes is not NULL ORDER BY runtime_minutes DESC limit 10;


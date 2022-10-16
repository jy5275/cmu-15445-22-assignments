-- Determine the oldest people in the dataset who were born in or after 1900. You should assume that a person without a known death year is still alive.
-- Details: Print the name and age of each person. People should be ordered by a compound value of their age and secondly their name in alphabetical order. Return the first 20 results.
-- Your output should have the format: NAME|AGE
SELECT name, 2022 - born as age FROM people WHERE died is NULL AND born >= 1900 ORDER BY born, name limit 20;

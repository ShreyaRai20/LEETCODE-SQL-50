SELECT results
FROM
(SELECT NAME results
FROM USERS U
JOIN 
(SELECT user_id, count(rating) c_rating
FROM MovieRating
GROUP BY user_id
ORDER BY c_rating DESC LIMIT 1) R
ON U.USER_ID = R.USER_ID

UNION

SELECT M.title results
FROM MOVIES M
JOIN (
SELECT movie_id, avg(rating) MARating
FROM MovieRating
WHERE created_at between "2020-02-01" and "2020-02-29"
GROUP BY movie_id
ORDER BY MARating DESC, movie_id ASC LIMIT 1)
MAR
ON M.movie_id = MAR.movie_id) AS combined_results;

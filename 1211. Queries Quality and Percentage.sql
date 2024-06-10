SELECT query_name, 
ROUND(AVG(CAST(rating AS DECIMAL)/position),2) quality,
ROUND(SUM(CASE WHEN RATING<3 THEN 1 ELSE 0 END)*100/COUNT(*),2) poor_query_percentage
FROM QUERIES
WHERE query_name is not null
GROUP BY query_name;

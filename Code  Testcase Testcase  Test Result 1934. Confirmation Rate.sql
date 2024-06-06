
select s.user_id, round(avg(if(c.action="confirmed",1,0)),2) as confirmation_rate
from Signups s 
left join Confirmations c 
on s.user_id= c.user_id 
group by user_id;

________________________________________________________

ADDITIONAL QUERIES


SELECT S1.user_id,action, COUNT(action) AC
FROM Confirmations C RIGHT JOIN Signups S1
on C.user_id = S1.user_id
GROUP BY S1.user_id, action


SELECT S1.user_id, COUNT(action) TAC
FROM Confirmations C RIGHT JOIN Signups S1
on C.user_id = S1.user_id
GROUP BY S1.user_id

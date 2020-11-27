-- 5 problems

-- 1. the number of projects per category
SELECT category, COUNT(category)
FROM ksprojects2016
GROUP BY category;

-- 2. the average goal amount per category
SELECT category, AVG(goal)
FROM ksprojects2016
GROUP BY category;

-- 3. the average amount pledged per category
SELECT category, AVG(pledged)
FROM ksprojects2016
GROUP BY category;

-- 4. the percentage of projects that met their goal by category
select temp1.category, round(goalmet/count(ksprojects2016.name)*100, 2) as percentage
from ksprojects2016
inner join (
	SELECT category, count(name) as goalmet
	FROM ksprojects2016
	WHERE pledged>=goal
	group by category
	order by category) as temp1
on ksprojects2016.category = temp1.category
group by ksprojects2016.category
order by ksprojects2016.category;


-- 5. and the average time from launch to deadline by category
select category, avg(datediff(deadline, launched)) as avg_days_taken 
from ksprojects2016
group by category
order by category;
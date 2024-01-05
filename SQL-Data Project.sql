--Use HR

 
select termdate
from hr_data
order by termdate DESC


update hr_data
SET termdate=FORMAT(CONVERT(DATETIME, LEFT(termdate ,  19) ,120), 'yyyy-MM-dd' )

Alter TAble hr_data
ADD new_termdate DATE


Update hr_data
set new_termdate =CASE
WHEN termdate IS NOT NULL AND ISDATE(termdate)=1 THEN CAST(termdate as DATETIME ) 
ELSE NULL END  

--create new column "age"
alter table hr_data
add age nvarchar(50)

--let's populate age column
update hr_data
set age=DATEDIFF(YEAR,birthdate, GETDATE())	


	

--what's the age distribution in the company ? (age dist, group by gender)

select
MIN(age) as Youngest ,
MAX (age ) as Oldest
from hr_data





Select age_grouped,
Count (*) as count

From
(Select  
Case
When age<=21 AND age<=30 THEN '21 to 30' 
When age<=31 AND age<=40 THEN '31 to 40'
When age<=41 AND age<=50 THEN '41 to 50'
ELSE '50+'	
END as age_grouped 
From hr_data
WHERE new_termdate IS NULL
) 
AS Subquery

Group by age_grouped
order by age_grouped

--Age group by Gender 

Select age_grouped, gender,
Count (*) as count
From
(Select  
Case
When age<=21 AND age<=30 THEN '21 to 30' 
When age<=31 AND age<=40 THEN '31 to 40'
When age<=41 AND age<=50 THEN '41 to 50'
ELSE '50+'	
END as age_grouped ,
gender
From hr_data
WHERE new_termdate IS NULL
) 
AS Subquery

Group by age_grouped, gender 
order by age_grouped, gender



-- what's the gender breakdown in the company ?

select gender,
count (gender) as count
from hr_data
where new_termdate IS NULL
GROUP BY gender
ORDER BY gender DESC

--How does gender vary across departments and job titles?

select  department, gender,
count (gender) as count
from hr_data
where new_termdate IS NULL
GROUP BY department, gender 
ORDER BY  department, gender ASC

--job titles

select  department, jobtitle, gender,
count (gender) as count
from hr_data
where new_termdate IS NULL
GROUP BY department,jobtitle, gender 
ORDER BY  department, jobtitle, gender ASC

--What's the race distribution in the company?

select race ,
count (*) as count
from hr_data
where new_termdate IS NULL
group by race
order by race  DESC

--what's the avg. length of employment in the company?

select 
AVG(DATEDIFF(year, hire_date,new_termdate)) as tenure 
from hr_data
where new_termdate IS NOT NULL AND  new_termdate <=GETDATE()




--which deparment has the highest turnover rate?
--get total count
--get terminated count
--terminated count/total count 


SELECT department, total_count ,terminated_count,
(ROUND((CAST(terminated_count AS  FLOAT)/total_count ), 2 ))*100 AS Turnover_Rate
FROM

(select department,
COUNT (*) AS total_count  ,
SUM(CASE
When new_termdate IS  NOT NULL AND  new_termdate <=GETDATE() THEN 1 ELSE 0
END)
AS terminated_count
FROM hr_data
Group by department
) AS subquery  
ORDER BY Turnover_Rate DESC
 
 --Whats's the tenure distribution for each department?
 --note we'll use question 5's information (what's the avg. length of employment in the company?)

 select department,
AVG(DATEDIFF(year, hire_date,new_termdate)) as tenure 
from hr_data
where new_termdate IS NOT NULL AND  new_termdate <=GETDATE()
group by department
order by tenure DESC

--how many employees work remotely for each department?

SELECT location,
count (*) as count
from hr_data
where new_termdate IS NULL
Group by location

--What's the distribution of employees across different states?

SELECT location_state ,
count(*) as count 
FROM hr_data
WHERE new_termdate IS NULL
group by location_state
order by  count DESC

--How are job titles distributed in the company ?

SELECT jobtitle ,
count (*) as count 
From hr_data 
where new_termdate IS NULL
Group by jobtitle
order by count DESC 

--How have employee hire counts  varied over time ?
--calculate over hires
--calculate terminations
--(hires-terminations)/hires percent hire change * 100


SELECT 
hire_year, 
hires, 
terminations, 
hires-terminations as net_change , 
(ROUND	(CAST(hires-terminations  AS FLOAT)/hires ,2)) *100 AS percent_hire_change

FROM
(Select  
	  YEAR(hire_date) AS hire_year ,
	count (*) as hires,
	SUM(CASE 
	WHEN new_termdate IS NOT NULL AND  new_termdate <=GETDATE() THEN 1 ELSE 0
	END)  AS terminations 
	from hr_data
	group by YEAR(hire_date)
	) as SUBQUERY
order by percent_hire_change ASC
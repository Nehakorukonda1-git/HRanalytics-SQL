--create a join table
select * from absenteeism_at_work as  a
left join compensation as c
on a.ID= c.ID
left join reasons as r
on a.Reason_for_absence = r.Number;

--find the healthiest employees for the bonus
select * from absenteeism_at_work
where social_drinker =0 and social_smoker =0
and body_mass_index < 25 and 
absenteeism_time_in_hours <(select avg(absenteeism_time_in_hours) from absenteeism_at_work) ;

--compensation rate increase for non_smokers /budget $983,221 so 0.68 increase per hour, $1,414.4 year
select count(*) as non_smokers from absenteeism_at_work
where social_smoker = 0 ;

--Optimize this query
select a.ID, r.reason, month_of_absence, body_mass_index,
CASE WHEN body_mass_index <18.5 THEN 'Under Weight'
     WHEN body_mass_index BETWEEN 18.5 AND 25 THEN 'Healthy Weight'
	 WHEN body_mass_index BETWEEN 25 AND 30 THEN 'Over Weight'
	 WHEN body_mass_index > 30 THEN 'Obese'
	 ELSE 'Unkown' END AS BMI_category,
CASE when Month_of_absence IN (12,1,2) THEN 'Winter'
     WHEN month_of_absence IN (3,4,5) THEN 'Spring'
	 WHEN month_of_absence IN (6,7,8) Then 'Summer'
	 WHEN month_of_absence IN (9,10,11) THEN 'Fall'
	 ELSE 'unknown' END as season_names, 
month_of_absence, 
day_of_the_week,
transportation_expense, 
education,
son,
social_drinker,
social_smoker,
pet,
disciplinary_failure,
age,
work_load_average_day
from absenteeism_at_work as  a
left join compensation as c
on a.ID= c.ID
left join reasons as r
on a.Reason_for_absence = r.Number;



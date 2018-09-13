/*
	Find all students who have more than 3 advisors
*/

select name, ID
from student join (select s_id, count(i_id) as cnt
			 from advisor
			 group by s_id
			 having cnt > 3) as x on student.ID = s_id
;

/*
	Find all students who are co-advised by Prof. Srinivas and Prof. Ashok.		   	 	  			    
*/
select name, ID
from student join (select distinct a1.s_id
			 from advisor as a1 join advisor as a2 on a1.s_id = a2.s_id
			 where a1.i_id = (select id 
		    			      from instructor
		    				where name = 'Srinivasan') and a2.i_id = (select id 
									    				from instructor
									    				where name = 'Ashok')) as x on student.id = x.s_id  
;
					    
/*
	Find students advised by instructors from different departments. etc.
*/

drop view v;
create view v as (select distinct ID, s_ID, dept_name 
			from advisor join instructor
			on ID = i_ID);
select distinct student.ID, name
from student join v on student.ID = s_ID
where student.dept_name != v.dept_name
;	

/*
	Delete all information in the database which is more than 10 years old. 
	Add data as necessary to verify your query.					    
*/

delete 
from section
where year < YEAR(CURDATE()) - 10;

/*
	Delete the course CS 101.  Any course which has CS 101 as a prereq should 
	remove CS 101 from its prereq set.  Create a cascade constraint to enforce the above rule, 
	and verify that it is 	working.
	Cascade constraint for above rule is created in "a3DDL.sql"
*/

delete 
from course 
where course_id = 'CS-101'; 

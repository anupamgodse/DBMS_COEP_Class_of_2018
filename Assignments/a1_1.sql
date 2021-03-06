/*
	Find the names of all the students whose total credits are greater than 100.
*/

select name
from student 
where tot_cred > 100;	


/*
	Find the course id and grades of all courses taken by any student named 'Tanaka'.
*/
select course_id, grade
from takes 
where id = (select id 
	 	from student
       	where name = 'Tanaka')
;	

/*	
	Find the ID and name of instructors who have taught a course in the Comp. Sci. department, even if they are themselves not from the 	Comp. Sci. department. To test this query, make sure you add appropriate data, and include the corresponding insert statements along 		with your query.
*/

insert into instructor values ('10000', 'success', 'Elec. Eng.', '80000');
insert into teaches values ('10000', 'CS-101', '1', 'Fall', '2009');

select ID, name 
from (	select ID
		from teaches natural join (	select course_id
					  		from course
					  		where dept_name = 'Comp. Sci.') as c) as x natural join instructor
where dept_name != 'Comp. Sci.';


/*
	--Find the courses which are offered in both 'Fall' and 'Spring' semester (not necessarily in the same year).
*/


select course_id, title
from (select s1.course_id
	from (select course_id, semester  
     		from section) as s1, (select course_id, semester  
     				   	    from section) as s2
	where s1.course_id = s2.course_id and s1.semester = 'Fall' and s2.semester = 'Spring') as x natural join course as c;

/*
	Find the names of all the instructors from Comp. Sci. department.
*/

select name
from instructor
where dept_name = 'Comp. Sci.'
;

/*
	Find the course id and titles of all courses taught by an instructor named 'Srinivasan'
*/

select it.course_id, title
from 
	(select course_id
	from
		((select id
		from instructor 
		where name = 'Srinivasan') as i natural join teaches)) as it natural join course
;

/*
	Find names of instructors who have taught at least one course in Spring 2009.
*/
select distinct name
from 
	(select Id 
	from teaches
	where year = 2009 and semester = 'Spring') as t natural join instructor
;


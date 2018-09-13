/*
	Query 1:
	Find the id and title of all courses which do not require any  prerequisites.
*/

select course.course_id, title
from course left join prereq on course.course_id = prereq.course_id
where prereq.course_id is NULL
;

/*
	Query 2:
	Find the names of students who have not taken any biology dept courses
*/

(select name 
from	(select distinct ID
	 from takes left join (select course_id
				     from course
				     where dept_name = 'Biology') as x on takes.course_id = x.course_id
	 where x.course_id is NULL) as y natural join student)
union
(select name 
from student left join takes on student.id = takes.id
where takes.id is NULL)	
;

/*
	Query 3:
	1. Give a 10% hike to all instructors.
*/

update instructor
set salary = 1.1 * salary
;

/*
	Query 4:
	2. Increase the tot_creds of all students who have taken the course titled "Genetics"  by the number of credits associated with 	     that course.
*/

update student, (select ID, credits
		     from takes natural join course
		     where title = 'Genetics') as x
set tot_cred = tot_cred + x.credits
where student.ID = x.ID
;

/*
	Query 5:
	3. For all instructors who are advisors of atleast 2 students, increase their salary by 50000.
*/

update instructor, (select i_id
			  from (select i_id, count(s_id) as cnt
			        from advisor
		   		  group by i_id) as x
		   	  where cnt >= 2)  as y
set salary = salary + 50000 
where instructor.id = y.i_id
;
      

/*
	Query 6:
	4. Set the  credits to 2 for all courses which have less than 5 students taking them (across all sections for the course, across all 		   years/semesters).
*/

update course, (select course_id
		    from (select course_id, count(distinct ID) as cnt
		   	   from takes natural join course
		   	   group by course_id) as x
		    where cnt < 5) as y
set credits = 2
where course.course_id = y.course_id
; 	

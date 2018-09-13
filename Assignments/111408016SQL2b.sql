/*
	Query 1:
	Find the id and title of all courses which do not require any  prerequisites.
*/

select course.course_id, title
from course left join prereq on course.course_id = prereq.course_id
where prereq.course_id is NULL
;

/*
	OUTPUT:-
	+-----------+----------------------------+
	| course_id | title                      |
	+-----------+----------------------------+
	| BIO-101   | Intro. to Biology          |
	| CS-101    | Intro. to Computer Science |
	| FIN-201   | Investment Banking         |
	| HIS-351   | World History              |
	| MU-199    | Music Video Production     |
	| PHY-101   | Physical Principles        |
	+-----------+----------------------------+
	6 rows in set (0.00 sec)
*/

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
	OUTPUT:-
	+----------+
	| name     |
	+----------+
	| Zhang    |
	| Shankar  |
	| Levy     |
	| Williams |
	| Brown    |
	| Bourikas |
	| Aoi      |
	| Chavez   |
	| Brandt   |
	| Sanchez  |
	| Peltier  |
	| Snow     |
	+----------+
	12 rows in set (0.00 sec)
*/

/*
	Query 3:
	1. Give a 10% hike to all instructors.
*/

update instructor
set salary = 1.1 * salary
;

/*
	OUTPUT:-
	Query OK, 13 rows affected (0.11 sec)
	Rows matched: 13  Changed: 13  Warnings: 0
	
	Table changes to :-
	
	mysql> select * from instructor;
	+-------+------------+------------+-----------+
	| ID    | name       | dept_name  | salary    |
	+-------+------------+------------+-----------+
	| 10000 | success    | Elec. Eng. |  88000.00 |
	| 10101 | Srinivasan | Comp. Sci. |  71500.00 |
	| 12121 | Wu         | Finance    |  99000.00 |
	| 15151 | Mozart     | Music      |  44000.00 |
	| 22222 | Einstein   | Physics    | 104500.00 |
	| 32343 | El Said    | History    |  66000.00 |
	| 33456 | Gold       | Physics    |  95700.00 |
	| 45565 | Katz       | Comp. Sci. |  82500.00 |
	| 58583 | Califieri  | History    |  68200.00 |
	| 76543 | Singh      | Finance    |  88000.00 |
	| 76766 | Crick      | Biology    |  79200.00 |
	| 83821 | Brandt     | Comp. Sci. | 101200.00 |
	| 98345 | Kim        | Elec. Eng. |  88000.00 |
	+-------+------------+------------+-----------+
	13 rows in set (0.00 sec)
*/	

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
	OUTPUT:-
	Query OK, 1 row affected (0.11 sec)
	Rows matched: 1  Changed: 1  Warnings: 0

	Relation changes to:-
	mysql> select * from student;
	+-------+----------+------------+----------+
	| ID    | name     | dept_name  | tot_cred |
	+-------+----------+------------+----------+
	| 00128 | Zhang    | Comp. Sci. |      102 |
	| 12345 | Shankar  | Comp. Sci. |       32 |
	| 19991 | Brandt   | History    |       80 |
	| 23121 | Chavez   | Finance    |      110 |
	| 44553 | Peltier  | Physics    |       56 |
	| 45678 | Levy     | Physics    |       46 |
	| 54321 | Williams | Comp. Sci. |       54 |
	| 55739 | Sanchez  | Music      |       38 |
	| 70557 | Snow     | Physics    |        0 |
	| 76543 | Brown    | Comp. Sci. |       58 |
	| 76653 | Aoi      | Elec. Eng. |       60 |
	| 98765 | Bourikas | Elec. Eng. |       98 |
	| 98988 | Tanaka   | Biology    |      124 |
	+-------+----------+------------+----------+
	13 rows in set (0.00 sec)
*/

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
	OUTPUT:-
	Query OK, 3 rows affected (0.07 sec)
	Rows matched: 3  Changed: 3  Warnings: 0

	Table before:-
	mysql> select * from instructor;
	+-------+------------+------------+-----------+
	| ID    | name       | dept_name  | salary    |
	+-------+------------+------------+-----------+
	| 10000 | success    | Elec. Eng. |  88000.00 |
	| 10101 | Srinivasan | Comp. Sci. |  71500.00 |
	| 12121 | Wu         | Finance    |  99000.00 |
	| 15151 | Mozart     | Music      |  44000.00 |
	| 22222 | Einstein   | Physics    | 104500.00 |
	| 32343 | El Said    | History    |  66000.00 |
	| 33456 | Gold       | Physics    |  95700.00 |
	| 45565 | Katz       | Comp. Sci. |  82500.00 |
	| 58583 | Califieri  | History    |  68200.00 |
	| 76543 | Singh      | Finance    |  88000.00 |
	| 76766 | Crick      | Biology    |  79200.00 |
	| 83821 | Brandt     | Comp. Sci. | 101200.00 |
	| 98345 | Kim        | Elec. Eng. |  88000.00 |
	+-------+------------+------------+-----------+
	13 rows in set (0.00 sec)

	Table after:-
	mysql> select * from instructor;
	+-------+------------+------------+-----------+
	| ID    | name       | dept_name  | salary    |
	+-------+------------+------------+-----------+
	| 10000 | success    | Elec. Eng. |  88000.00 |
	| 10101 | Srinivasan | Comp. Sci. |  71500.00 |
	| 12121 | Wu         | Finance    |  99000.00 |
	| 15151 | Mozart     | Music      |  44000.00 |
	| 22222 | Einstein   | Physics    | 154500.00 |
	| 32343 | El Said    | History    |  66000.00 |
	| 33456 | Gold       | Physics    |  95700.00 |
	| 45565 | Katz       | Comp. Sci. | 132500.00 |
	| 58583 | Califieri  | History    |  68200.00 |
	| 76543 | Singh      | Finance    |  88000.00 |
	| 76766 | Crick      | Biology    |  79200.00 |
	| 83821 | Brandt     | Comp. Sci. | 101200.00 |
	| 98345 | Kim        | Elec. Eng. | 138000.00 |
	+-------+------------+------------+-----------+
	13 rows in set (0.00 sec)
*/

/*
	Query 6:
	4. Set the  credits to 2 for all courses which have less than 5 students taking them (across all sections for the course, across all 		   years/semesters).
*/

update course, (select x.course_id
		    from (select course.course_id, count(distinct ID) as cnt
		   	   from course left join takes on course.course_id = takes.course_id
		   	   group by course.course_id) as x
		    where cnt < 5) as y
set credits = 2
where course.course_id = y.course_id
; 	

/*
	OUTPUT:-

	Query OK, 12 rows affected (0.11 sec)
	Rows matched: 12  Changed: 12  Warnings: 0

	Table before:-
	mysql> select * from course order by course_id;
	+-----------+----------------------------+------------+---------+
	| course_id | title                      | dept_name  | credits |
	+-----------+----------------------------+------------+---------+
	| BIO-101   | Intro. to Biology          | Biology    |       4 |
	| BIO-301   | Genetics                   | Biology    |       4 |
	| BIO-399   | Computational Biology      | Biology    |       3 |
	| CS-101    | Intro. to Computer Science | Comp. Sci. |       4 |
	| CS-190    | Game Design                | Comp. Sci. |       4 |
	| CS-315    | Robotics                   | Comp. Sci. |       3 |
	| CS-319    | Image Processing           | Comp. Sci. |       3 |
	| CS-347    | Database System Concepts   | Comp. Sci. |       3 |
	| EE-181    | Intro. to Digital Systems  | Elec. Eng. |       3 |
	| FIN-201   | Investment Banking         | Finance    |       3 |
	| HIS-351   | World History              | History    |       3 |
	| MU-199    | Music Video Production     | Music      |       3 |
	| PHY-101   | Physical Principles        | Physics    |       4 |
	+-----------+----------------------------+------------+---------+
	13 rows in set (0.00 sec)

	Table after:-
	mysql> select * from course order by course_id;
	+-----------+----------------------------+------------+---------+
	| course_id | title                      | dept_name  | credits |
	+-----------+----------------------------+------------+---------+
	| BIO-101   | Intro. to Biology          | Biology    |       2 |
	| BIO-301   | Genetics                   | Biology    |       2 |
	| BIO-399   | Computational Biology      | Biology    |       2 |
	| CS-101    | Intro. to Computer Science | Comp. Sci. |       4 |
	| CS-190    | Game Design                | Comp. Sci. |       2 |
	| CS-315    | Robotics                   | Comp. Sci. |       2 |
	| CS-319    | Image Processing           | Comp. Sci. |       2 |
	| CS-347    | Database System Concepts   | Comp. Sci. |       2 |
	| EE-181    | Intro. to Digital Systems  | Elec. Eng. |       2 |
	| FIN-201   | Investment Banking         | Finance    |       2 |
	| HIS-351   | World History              | History    |       2 |
	| MU-199    | Music Video Production     | Music      |       2 |
	| PHY-101   | Physical Principles        | Physics    |       2 |
	+-----------+----------------------------+------------+---------+
	13 rows in set (0.00 sec)
*/

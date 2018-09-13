/*
	Each offering of a course (i.e. a section) can have many Teaching assistants; 
	each teaching assistant is a student.  Extend the existing schema(Add/Alter tables) 
	to accommodate this requirement.
*/
drop table assistant;
create table assistant 
	(
	 ID			varchar(5), 
	 course_id		varchar(8),
	 sec_id		varchar(8), 
	 semester		varchar(6),
	 year			numeric(4,0),
	 primary key (ID, course_id, sec_id, semester, year),
	 foreign key (ID) references student (ID) on delete cascade,
	 foreign key (course_id, sec_id, semester, year) references section (course_id, sec_id, semester, year) on delete cascade
	);

/*
	According to the existing schema, one student can have only one advisor.
	Alter the schema to allow a student to have multiple advisors and make sure that you 
	are able to insert multiple advisors for a student.
*/

alter table advisor drop foreign key advisor_ibfk_1;
alter table advisor drop foreign key advisor_ibfk_2; 
alter table advisor drop primary key, add primary key (s_ID, i_ID);
alter table advisor add foreign key (s_ID) references student (ID) on delete cascade;
alter table advisor add foreign key (i_ID) references instructor (ID) on delete cascade;


/*
	Delete the course CS 101.  Any course which has CS 101 as a prereq should remove CS 101 from its prereq set.  Create a cascade 		constraint to enforce the above rule, and verify that it is working.
*/
alter table prereq drop foreign key prereq_ibfk_2;
alter table prereq add foreign key (prereq_id) references course (course_id) on delete cascade;


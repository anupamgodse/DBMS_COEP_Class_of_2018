delete from assistant;	
insert into assistant values ('00128', 'BIO-101', '1', 'Summer', '2009');
insert into assistant values ('12345', 'BIO-101', '1', 'Summer', '2009');
insert into assistant values ('12345', 'CS-347', '1', 'Fall', '2009');
insert into assistant values ('19991', 'FIN-201', '1', 'Spring', '2010');


insert into advisor values ('12345', '45565');
insert into advisor values ('12345', '76543');
insert into advisor values ('12345', '98345');
insert into advisor values ('00128', '10101');
insert into advisor values ('00128', '12121');
insert into advisor values ('55739', '76543');

/* 
	inserting Ashok into instructor
*/

insert into instructor values ('54321', 'Ashok', 'Finance', '80000');

/*
	inserting into advisor students under Ashok
*/

insert into advisor values ('00128', '54321');
insert into advisor values ('55739', '54321');


insert into section values ('BIO-301', '1', 'Summer', '2005', 'Painter', '514', 'A');
insert into section values ('CS-190', '1', 'Fall', '2004', 'Packard', '101', 'H');
insert into teaches values ('83821', 'CS-190', '1', 'Fall', '2004');
insert into teaches values ('98345', 'BIO-301', '1', 'Summer', '2005');
insert into takes values ('00128', 'CS-190', '1', 'Fall', '2004', 'A');
insert into takes values ('12345', 'BIO-301', '1', 'Summer', '2005', 'A-');


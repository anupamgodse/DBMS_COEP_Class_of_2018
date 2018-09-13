/*
	Find pairs of stations (station codes) that have a track (direct connection) with distance less than 20Kms between them.
*/

select stcode1, stcode2
from track
where distance < 20
;

/*
	Find the IDs of all the trains which have a stop at THANE
*/

select id
from
	  (select stcode
	   from station
	   where name = 'THANE') as s  natural join trainhalts
;

/*
	Find the names of all trains that start at MUMBAI.
*/

select name
from
	(select id
	from
		(select stcode 
		from station
		where name = 'MUMBAI') as s natural join trainhalts
	where seqno = 0) as x natural join train
;	
/*
	List all the stations in order of visit by the train 'CST-AMR_LOCAL'.
*/

/*select name
from
	(select seqno, stcode
	from 
		(select id
		from train
		where name = 'CST-AMR_LOCAL') as t natural join trainhalts) as x natural join station order by seqno asc
;
*/
select name
from trainhalts natural join station 
where id = (select id
		from train
		where name = 'CST-AMR_LOCAL')
order by seqno asc
; 

/*
	Find the name of the trains which have stop at Thane, before the 6th station in the route of the train.
*/

select name
from
	(select id 
	 from trainhalts
	 where seqno < 6 and stcode = (select stcode
					     	 from station
						 where name = 'THANE')) as x natural join train
;

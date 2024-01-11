## WORKER DATABASE ##

create database worker;

use worker;

create table worker_info(Worker_id int,First_name varchar(20),Last_name varchar(20),Salary int,Joining_Date datetime, Dept varchar(20));

insert into worker_info values (1, "Monika", "Arora","100000","2014-2-20 09:00:00", "HR"),
(2, "Niharika", "Verma", "80000","2014-6-11 09:00:00","Admin"),
(3, "Vishal", "Singhal","300000","2014-2-20 09:00:00","HR"),
(4, "Amitabh", "Singh","500000","2014-2-20 09:00:00","Admin"),
(5, "Vivek", "Bhati","500000","2014-6-11 09:00:00","Admin"),
(6, "Vipul", "Diwan","200000","2014-6-11 09:00:00","Account"),
(7, "Satish", "Kumar","75000","2014-1-20 09:00:00","Account"),
(8, "Geetika", "Chauhan","90000","2014-4-11 09:00:00","Admin");

#(1)
select * from worker_info order by First_name;

select * from worker_info order by Dept desc;

#(2)
select * from worker_info where First_name in ("Vipul","Satish");

#(3)
select * from worker_info where First_name like "%h" and length(First_name) = 6;

#(4)
select * from worker_info where salary between 0 and 100000;

#(5)
select dept,count(*) from worker_info group by dept having count(*)>1;

#(6)
select * from worker_info limit 6;

#(7)
select dept, count(*) from worker_info group by dept having count(*) <5;

#(8)
select dept, count(*) from worker_info group by dept;

#(9)
SELECT first_name, dept,salary
FROM worker_info
WHERE salary IN (SELECT max(salary) FROM worker_info GROUP BY dept) ;




## SCHOOL DATABASE ##



create database school;

use school;

create table student(StdID int,Stdname varchar(30),Sex varchar(10),Percentage int,Class int,Sec varchar(1),Stream varchar(10), DOB date);

# in Database wrong DOB of 1005,1010

insert into student values(1001,"Surekha Joshi","Female","82","12","A","Science","1998-03-08"),
(1002,"Maahi Agarwal","Female","56","11","C","Commerce","2008-11-23"),
(1003,"Sanam Verma","Male","59","11","C","Commerce","2006-06-23"),
(1004,"Ronit Kumar","Male","63","11","C","Commerce","1997-11-05"),
(1005,"Dipesh Pulkit","Male","78","11","B","Science","2003-09-14"),
(1006,"Jahnavi Puri","Female","60","11","B","Commerce","2008-11-07"),
(1007,"Sanam Kumar","Male","23","12","F","Commerce","1998-03-08"),
(1008,"Sahil Saras","Male","56","11","C","Commerce","2008-11-07"),
(1009,"Akshra Agarwal","Female","72","12","B","Commerce","1996-10-01"),
(1010,"Stuti Mishra","Female","39","11","F","Science","2008-11-23"),
(1011,"Harsh Agarwal","Male","42","11","C","Science","1998-03-08"),
(1012,"Nikunj Agarwal","Male","49","12","C","Commerce","1998-06-28"),
(1013,"Akriti Saxena","Female","89","12","A","Science","2008-11-23"),
(1014,"Tani Rastogi","Female","82","12","A","Science","2008-11-23");

#(1)
select * from student;

#(2)
select stdname,dob from student;

#(3)
select * FROM student WHERE percentage >= 80;

#(4)
select stdname,Stream,Percentage from student where percentage > 80;

#(5)
select * from student where stream = "science" and percentage > 75;
create database college;
use college;
create table student(
id int primary key,
name varchar(50),
age int not null
); 
insert into student values(1, "Aman", 26);
insert into student
(id, name, age) 
values
(2, "Shradha", 24);

show databases;

drop database if exists company;
create database if not exists xyz;
use xyz;
create table employee(
id int primary key,
name varchar(50),
salary int not null
);
insert into employee
(id, name, salary)
values
(1, "Adam", 25000),
(2, "bob", 30000),
(3, "casey", 40000);

select *from employee;
use college;
create table temp1(
id int unique
);
insert into temp1 values(101);
insert into temp1 values(101);
show tables;
use college;
create table emp(
id int,
salary int default 25000
);
insert into emp(id) values(101);
show tables;
select *from emp;
create database college1;
use college1;
create table student(
rollno int primary key,
name varchar(50),
marks int not null,
grade varchar(1),
city varchar(20)
);
insert into student
(rollno, name, marks, grade, city)
values
(101, "Anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 98, "A", "delhi"),
(105, "emanuel", 12, "F" , "delhi"),
(106, "farah", 82, "B", "delhi");
select*from student;
select distinct city from student;
select name from student where marks>80;
select name, city from student where marks>80;
select * from student where marks>80;
select *from student where marks>80 and city="mumbai";
select* from student where marks between 80 and 90;
select *from student where city in("mumbai", "chandigarh", "pune");
select*from student limit 3;
select*from student where marks>20 limit 3;
select*from student order by city asc;
select*from student order by marks desc;
select max(marks) from student;
select avg(marks) from student;
select count(name) from student;
select city, count(rollno) from student group by city;

select grade, count(name)
from student
group by grade
order by grade;

select city, count(rollno)
from student
group by city
having max(marks)>80;


select city
from student
where grade = "A"
group by city
having max(marks) >=93
order by max(marks) desc;

use college1;
update student
set grade = "O"
where grade = "A";

set sql_safe_updates =0;
select* from student;

update student
set marks = 82
where rollno = 105;
select* from student;


update student
set grade = "B"
where marks between 80 and 90;
select * from student;

update student
set marks = 12
where rollno = 105;

delete from student
where marks< 33;

select* from student;

create table dep(
id int primary key,
name varchar(50)
);

select* from dep;

create table teacher(
id int primary key,
name varchar(50),
dep_id int not null,
foreign key (dep_id) references dep (id)
on update cascade
on delete cascade
);
select* from teacher;
drop table teacher;
show tables;

Alter table student
add column age int not null default 19;

select *from student;

Alter table student
modify  age varchar(2);

Alter table student 
change column   stu_age age int;

Alter table student
drop column age;

Alter table stu
rename to student;

show databases;

use college;
show tables;
create table Student(
student_id int primary key,
name varchar(50)
);

insert into Student(student_id, name)
values
(101, "adam"),
(102,"bob"),
(103, "casey");

create table Course(
Student_id int primary key,
course varchar(50)
);

insert into Course(Student_id, course)
values
(102, "english"),
(105, "maths"),
(103,"science"),
(107, "computer science");

select *
from Student
Inner join Course
on Student.student_id = Course.student_id;

select*
from Student
left join Course
on Student.student_id = Course.student_id;

select*
from Student
right join Course
on Student.student_id = Course.student_id;

select*
from Student as s
left join Course as c
on s.student_id = c.student_id
Union
select*
from Student as s
right join Course as c
on s.student_id = c.student_id;

select*
from Student as s
left join Course as c
on s.student_id = c.student_id
where c.student_id is null;

select*
from Student as s
right join Course as c
on s.student_id = c.student_id
where s.student_id is null;

create table employee(
id int primary key,
name varchar(50),
manager_id int 
);

insert into employee(id, name, manager_id)
values
(101, "adam", 103),
(102, "bob", 104),
(103, "casey", null),
(104, "donald", 103);

select*from employee;

select *
from employee as a
join employee as b
on a.id = b.manager_id;

select a.name as manager_name, b.name
from employee as a
join employee as b
on a.id = b.manager_id;

select name from Student
Union 
select name from employee;

select name from Student
Union all
select name from employee;

show databases;
use college;
show tables;
select*from student;
use college1;

select name, marks
from student
where marks> (select avg(marks) from student);

select*from student;

create view view1 as
select name , marks from student;

select*from view1;

select user from mysql.user;

create user 'code'@'localhost' identified by 'code@123';
show grants for 'code'@'localhost';
grant all privileges on * . * to 'code'@'localhost';
revoke all privileges on *.* from 'code'@'localhost';

grant all privileges on college.student  to 'code'@'localhost';
revoke all privileges on college .* from 'code'@'localhost';

set password for code@localhost = password('Shubham?2001');

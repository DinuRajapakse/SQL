use employees;
SELECT 
    *
FROM
    employees;
#you can insert rows without specifyinh the columns as long
insert into employees
values (999903, '1997-09-14','Johnathan','Creek','M','1999-01-01');

SELECT 
    *
FROM
    EMPLOYEES
ORDER BY emp_no DESC
LIMIT 10;

SELECT 
    *
FROM
    titles
LIMIT 10;

insert into titles
(emp_no, title, from_date)
values(999903, 'Senior Engineer', '1997-10-01');

SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC
LIMIT 10;

SELECT 
    *
FROM
    dept_emp
LIMIT 10;

insert into dept_emp
values(999903, 'd005','1997-10-01','9999-01-01');

SELECT 
    *
FROM
    dept_emp
ORDER BY emp_no desc
LIMIT 10;

#another way to insert data into a table. 

SELECT 
    *
FROM
    departments;

# we want to import all of the data from departments table
#to a new table called departments_dup


CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

drop table departments_dup;

CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);


select * from departments_dup;

#inserting all data from departments to departments_dup
insert into departments_dup (dept_no, dept_name)
select * from departments;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;
#you can see the data has been added

insert into departments
values('d010', 'Business Analysis');

select * from departments order by dept_no desc;

#TCL's commit and resolve

use employees;
#update statement
SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;
#lets update emp_no 999901 record
UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_Date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999901;
#Do not need to update all columns. Only the ones you want. 
# If you gave a non-existent emp_no, the query would still
#run but nothing would have happened. 
SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;

use employees;

select * from departments_dup order by dept_no;

commit;

UPDATE departments_dup 
SET 
    dept_no = 'd011',
    dept_name = 'Quality Control';
select * from departments_dup;
#the above will change all records to the one SET.
#How do we go back if this happens. 

#
#Apply the rollback command. It will take to the last commit that
#has been run

rollback;

SELECT 
    *
FROM
    departments_dup;

commit;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no asc;

commit;

select * from departments;
UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_no = 'd010';

select * from departments;

# delete statement **************************

use employees;
commit;

SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;

DELETE FROM employees 
WHERE
    emp_no = 999903;

SELECT 
    *
FROM
    titles
    order by emp_no desc;
#note that we deleted 999903 only from the employees table but not
#from the titles table. But it has been deleted form the titles table as well. 
#This is because of the cascade delete being on, meaning all records of the child table 
#will also be deleted. 

rollback;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;
#after rollback emp_no 999903 is back on both titels and employees table. 
 use employees;

select* from departments;

#drop vs truncate vs delete***********************

	#truncating is the same as deleting without a where clause
    #but the struncture will remain the same and also auto_increment will
    #be reset. Meaning when you start re filling the table, the records will
#start from 1. 
    #When you drop a table, it will be gone FOREVER.
    
    #Delete deleted row by row. Truncate doesn't. Therefore truncate is
    #faster than delete. 
    
    #Also, delete wont reset the auto inrement. After deleting the table
    #the next record you will add will start from where the old record stopped
#interms of indexing.

DELETE FROM departments 
WHERE
    dept_no = 'd010';

use employees;
#joins: builds relationships between tables. 
#joins shows a result set containing fields derived from two or more tables. 
#step 1: find a common column. As long as you have this the columns
#can be connected

SELECT 
    *
FROM
    departments_dup;
 
 alter table departments_dup
 change column dept_name dept_name varchar(40) null;
 
 alter table departments_dup
 change column dept_no dept_no char(4) null;
 
 insert into departments_dup (dept_name)
 values('Public Relations');
 
 SELECT 
    *
FROM
    departments_dup;

DELETE FROM departments_dup 
WHERE
    dept_no = 'd002';
 
 SELECT 
    *
FROM
    departments_dup;

 SELECT 
    *
FROM
    departments;

drop table departments_dup;

CREATE TABLE departments_dup (
    dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);

insert into departments_dup (dept_no, dept_name)
select * from departments;

select * from departments_dup;

insert into departments_dup (dept_name)
values('Public Relations');

DELETE FROM departments_dup 
WHERE
    dept_no = 'd002';

insert into departments_dup (dept_no)
values('d010'),('d011');

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

drop table if exists dept_manager_dup;

CREATE TABLE dept_manager_dup (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);

insert into dept_manager_dup(emp_no, from_date)
values
(999904, '2017-01-01'),
(999905, '2017-01-01'),
(999906, '2017-01-01'),
(999907, '2017-01-01');

select * from dept_manager_dup;

DELETE FROM dept_manager_dup 
WHERE
    dept_no = 'd001';

insert into departments_dup(dept_name)
values ('Public Relations');

DELETE FROM departments_dup 
WHERE
    dept_no = 'd002';

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

#inner join

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

insert into dept_manager_dup
select * from dept_manager;

SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

SELECT 
    *
FROM
    dept_manager_dup;
    

SELECT 
    *
FROM
    departments_dup;
    
-- Extract a list containing information about all managers’ employee number,
-- first and last name, department number, and hire date. 

SELECT 
    m.emp_no, m.dept_no, e.first_name, e.last_name, e.hire_date
FROM
    dept_manager_dup m
        INNER JOIN
    employees e ON m.emp_no = e.emp_no;
#the code below will do the same thing. 
SELECT 
    e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
    employees e
        JOIN #inner join and join are the same thing. 
    dept_manager dm ON e.emp_no = dm.emp_no;
    
#duplicate records
-- use group by to handle this

use employees;

#left join

-- delete from dept_manager_dup
-- where emp_no = '110228
SELECT 
    COUNT(emp_no)
FROM
    dept_manager_dup
WHERE
    emp_no = '110228'
GROUP BY emp_no;

SELECT 
    *
FROM
    dept_manager_dup;
 
 
 #Exercise
	-- Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees
	-- whose last name is Markovitch (This is all of the left table).
    -- See if the output contains a manager with that name(this is the common area between the 
    -- left and the right. The far right section is not included.  
SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager d ON e.emp_no = d.emp_no
WHERE
    e.last_name = 'Markovitch'
ORDER BY d.dept_no desc, e.emp_no;

#the code below will give the same results

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    dm.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.last_name = 'Markovitch'
ORDER BY dm.dept_no DESC , e.emp_no;

#right joins
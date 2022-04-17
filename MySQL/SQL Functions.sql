#count()

use employees;
SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

SELECT 
    count(from_date)
FROM
    salaries;

#find how many contracts signed in different dates. 
select count(distinct from_date)
from salaries;

#using count to include null values
SELECT 
    COUNT(*)
FROM
    salaries;

#how many departements are there in the employees databese?
SELECT 
    COUNT(distinct dept_no)
FROM
    dept_emp;

#sum()************************************
SELECT 
    SUM(salary)
FROM
    salaries;

# What is the total amount of money spent on salaries for all contracts
#starting after the 1st of January 1997?  
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';

#max() and min()
SELECT 
    min(salary)
FROM
    salaries;

#Which is the lowest employee number in the database?
SELECT 
    MIN(emp_no)
FROM
    employees;
    
#Which is the highest employee number in the database?
SELECT 
    max(emp_no)
FROM
    employees;

#avg() avereages all non-null numeric values. 

SELECT 
    AVG(salary)
FROM
    salaries;

#What is the average annual salary paid to employees who started
#after the 1st of January 1997?
select avg(salary) from salaries where from_date > '1997-01-01';

#round()*********************************
select round(avg(salary),2) from salaries;
#the 2 is how many decimal places you want. 

#Round the average amount of money spent on salaries for all contracts
#that started after the 1st of January 1997 to a precision of cents?
SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';

#ifnull() and coalesce()****************************

select * from departments_dup;

#duplicate the departments table
#change the dept_name to null
#add two new dept_no rows
#use ifnull to fill the 2 new null dept_names 

insert departments_dup (dept_no, dept_name)
select * from departments;


alter table departments_dup
modify dept_name varchar(40) null;

insert departments_dup (dept_no)
values('d010'),('d011');

select * from departments_dup;

SELECT 
    dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name
FROM
    departments_dup;

#coalesce***********************
#its like ifnull with more than 2 parameters. 
SELECT 
    dept_no,
    coalesce(dept_name,
            'Department name is not provided') AS dept_name
FROM
    departments_dup;

# inserting a 3rd column to departments_dup table. 

alter table departments_dup
add column department varchar(40) null;

alter table departments_dup
drop column department;

alter table departments_dup
add column dept_manager varchar(40) null;
#coalesce with 3 arguments.

select * from departments_dup;
SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
    departments_dup;

select dept_no, dept_name,
coalesce('department manager name') as fake_col
from departments_dup;

select * from departments_dup;

alter table departments_dup
drop column dept_manager;

select * from departments_dup;

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS 'dept_info'
    #create a new col called dept_info
    #all of its values will be dept_no values.
    #for all null values in the dept_no column, use dept_name
#values. 
FROM
    departments_dup
ORDER BY dept_no DESC;

SELECT 
    dept_no,
    dept_name,
    ifnull(dept_no, 'N/A') AS 'dept_no',
    ifnull(dept_name, 'Department name not provided') AS 'dept_name',
    coalesce(dept_no, dept_name) as dept_info
    
#values. 
FROM
    departments_dup
ORDER BY dept_no DESC;

#practice again
select * from departments_dup; 

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS 'dept_info'
FROM
    departments_dup;

SELECT 
    dept_no,
    dept_name,
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name, 'Department not provided') dept_no,
    COALESCE(dept_no, dept_name) AS 'dept_info'
FROM
    departments_dup;
    

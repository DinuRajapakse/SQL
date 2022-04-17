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
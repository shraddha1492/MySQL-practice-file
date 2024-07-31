use employees;

##-- select statement--##
SELECT 
    *
FROM
    employees;
    
    
SELECT 
    dept_no
FROM
    departments;
    
##--where clause--##

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
    
SELECT 
    *
FROM
    employees
WHERE
    gender = 'm';
    
##--AND OPERATOR--##

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'kellie' AND gender = 'f';
    
    
SELECT 
    first_name, gender
FROM
    employees
WHERE
    first_name = 'elvis' AND gender = 'm';   
    
    
    
##--OR OPERATOR--##

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'kellie'
        OR first_name = 'aruna';   
        
 ##--AND OR operator together--##
 
 SELECT 
    *
FROM
    employees
WHERE
    gender = 'f'
        AND (first_name = 'kellie' OR first_name = 'aruna');
        
##--IN /NOT IN OPERATOR --##

select * from employees
where
		first_name in ('Denis', 'Elvis');
        
        
 SELECT 
    *
FROM
    employees
WHERE
    FIRST_name = 'aruna' IN (gender = 'f' , gender = 'm');
        
        
        
 SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');
        
##--LIKE?NOT LIKE OPERATOR--##        
 ##question-- Working with the “employees” table, use the LIKE operator to select the data about all individuals, whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters##
        
  SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('mark%');
        
        
##q- Retrieve a list with all employees who have been hired in the year 2000.##

SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');
        
        
##Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”.  ##     
        
   SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');
        
##Extract all individuals from the ‘employees’ table whose first name contains “Jack”.
##Once you have done that, extract another list containing the names of employees that do not contain “Jack”.        
 
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%jack%');
    
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%jack%');
 
 
##Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.

##Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.

##Select the names of all departments with numbers between ‘d003’ and ‘d006’. 
 
 SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000; 
 
 
SELECT 
    *
FROM
    salaries
where
	emp_no not between 10004 and 10012;
 
 
 SELECT 
    *
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';
    
    
 ##-- null/not null--##
 ## Select the names of all departments whose department number value is not null.
 
 SELECT 
    *
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
##-- comparison operator--##    
##Retrieve a list with data about all female employees who were hired in the year 2000 or after.    
    
 SELECT 
    *
FROM
    employees
WHERE
    gender = 'f'
        AND hire_date >= '2000-01-01';
    
    
##  Extract a list with all employees’ salaries higher than $150,000 per annum.    

SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;
    
    
    
##--SELECT DISTINCT__##
## Obtain a list with all different “hire dates” from the “employees” table,
##Expand this list and click on “Limit to 1000 rows”. This way you will set the limit of output rows displayed back to the default of 1000.    

select distinct 
	hire_date
from employees;


##-- AGGREGARE FUNCTION--##
##How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?
##How many managers do we have in the “employees” database?


SELECT
	COUNT(*)
FROM
	salaries
    WHERE
salary >= 100000;


select count(*)

from dept_manager;
	
##--ORDER BY--##
##Select all data from the “employees” table, ordering it by “hire date” in descending order.


SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;	


##---ALIAS AS--##
##Write a query that obtains two columns,
##The first column must contain annual salaries higher than 80,000 dollars. 
##The second column, renamed to “emps_with_same_salary”, must show the number of employees contracted to that salary. 
##Lastly, sort the output by the first column.

select  * from salaries;

SELECT 
    COUNT(emp_no) AS 'emp_with_same_salary', salary
FROM
    salaries
WHERE
    salary > '80000'
GROUP BY salary
ORDER BY salary;

##--HAVING--##
##Select all employees whose average salary is higher than $120,000 per annum.

SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

##Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
#Hint: To solve this exercise, use the “dept_emp” table.

select emp_no from dept_emp
where 
from_date > '2000-01-01'
group by emp_no
having count(from_date)>1
order by emp_no;

## LIMIT ##
##Select the first 100 rows from the ‘dept_emp’ table. 

select * from dept_emp
limit 100;


##---INSERT STATEMENTS--##
##elect ten records from the “titles” table to get a better idea about its content.
#Then, in the same table, insert information about employee number 999903. State that he/she is a “Senior Engineer”, who has started working in this position on October 1st, 1997.
#At the end, sort the records from the “titles” table in descending order to check if you have successfully inserted the new record.

#Hint: To solve this exercise, you’ll need to insert data in only 3 columns!

select * from titles
limit 10;


insert into titles (emp_no,title,from_date) values(999903,'senior engineer','1997-10-01');

select * from titles
order by emp_no desc
limit 10;


insert into employees(emp_no,birth_date,first_name,last_name,hire_date) values(999903,'1987-05-05','john','nicole','2011-01-02');


#Insert information about the individual with employee number 999903 into the “dept_emp” table. He/She is working for department number 5, 
#and has started work on  October 1st, 1997; her/his contract is for an indefinite period of time.

#Hint: Use the date ‘9999-01-01’ to designate the contract is for an indefinite period.

insert into dept_emp (emp_no,dept_no,from_date,to_date) values (999903,5,'1997-10-01','9999-01-01');


##---insert into SELECT--##

select * from departments;

create table departments_dupe(dept_no char(4) , dept_name varchar(255));

insert into departments_dupe (dept_no , dept_name ) 
select * from departments;

select * from departments_dupe
order by dept_no;

##Create a new department called “Business Analysis”. Register it under number ‘d010’. Hint: To solve this exercise, use the “departments” table.

select * from departments;

insert into departments(dept_no,dept_name)
values('d010','business analysis');

## COMMIT AND ROLLBACK--##

select * from departments_dupe;

commit;

update departments_dupe
set dept_no='d012',
	dept_name ='business analysis';
    
rollback;

commit;

##Change the “Business Analysis” department name to “Data Analysis”. Hint: To solve this exercise, use the “departments” table.

select * from departments;

update departments
set
dept_name='data analysis'
where dept_name='business analysis'
;


##---DELETE STATEMENT---##
##Remove the department number 10 record from the “departments” table.

select * from departments;

DELETE FROM departments 
WHERE
    dept_no = 'd010';



##--AGGREGATE FUNCTION--##
##How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.

SELECT 
    COUNT(distinct dept_no) as dept_count
FROM
    dept_emp;




##--SUM FUNCTION--##

SELECT 
    SUM(salary) AS total_salary
FROM
    salaries;


##What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?

SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';


##--MAX()  min() --##

##which is highest salary from salaries table

SELECT 
    MAX(salary)
FROM
    salaries;
    
##min salary from salaries table
SELECT 
    MIN(salary)
FROM
    salaries;

##. Which is the lowest employee number in the database? and Which is the highest employee number in the database?

SELECT 
    MIN(emp_no)
FROM
    employees;


SELECT 
    Max(emp_no)
FROM
    employees;
    
##-- AVERAGE--##    
    
##which is the avg annual salary of company's employee received     
    
    select avg(salary) from salaries;
    
##What is the average annual salary paid to employees who started after the 1st of January 1997?
    
  select avg(salary) from salaries
  where
	from_date > '1997-01-01';
    
  
  
  ##-- ROUND FUNCTION --##  
##Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents.
    
    
select round(avg(salary))
from salaries
where
	from_date > '1997-01-01';
    
select round(avg(salary)) as avg_salary
from salaries
where
	from_date > '1997-01-01';    
    
    
  ##-- COALESCE() --##  
    
  ##  Select the department number and name from the ‘departments_dup’ table and add a third column where you name the department number (‘dept_no’) as ‘dept_info’. 
  ##If ‘dept_no’ does not have a value, use ‘dept_name’.
    
    SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_name, dept_no) AS dept_info
FROM
    departments_dupe;
    
  ##Modify the code obtained from the previous exercise in the following way. Apply the IFNULL() function to the values from the first and second column,
  ##so that ‘N/A’ is displayed whenever a department number has no value, and ‘Department name not provided’ is shown if there is no value for ‘dept_name’.  
    
    
    SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dupe
ORDER BY dept_no ASC;


##-- JOINS --##

##DROP COLUMN to remove the ‘dept_manager’ column from the ‘departments_dup’ table.Then, use CHANGE COLUMN to change the ‘dept_no’ and ‘dept_name’ columns to NULL.

create table dept_dup (dept_no CHAR(4) NULL,dept_name VARCHAR(40) NULL);

insert into dept_dup(dept_no,dept_name) 
select * from departments;


select * from dept_dup;

insert into dept_dup(dept_name) values ('public relation');


delete from dept_dup
where dept_no = 'd002'; 

INSERT INTO dept_dup(dept_no) VALUES ('d010'), ('d011');

####--------------

CREATE TABLE dept_manager_dup (emp_no int(11) NOT NULL,dept_no char(4) NULL,from_date date NOT NULL,to_date date NULL);

 
INSERT INTO dept_manager_dup
select * from dept_manager;

 
INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES  (999904, '2017-01-01'),(999905, '2017-01-01'),(999906, '2017-01-01'),(999907, '2017-01-01');

 DELETE FROM dept_manager_dup
WHERE
	dept_no = 'd001';                              




 ##--  INNER JOIN  --##
##Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 

select * from employees;

SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, dm.dept_no
FROM
    employees e
        INNER JOIN
    dept_manager dm ON e.emp_no = dm.emp_no;
    
    
####----
select * from dept_manager_dup;                            
select * from dept_manager;

select m.dept_no,m.emp_no,d.dept_no 
from dept_manager_dup d
join dept_manager m on d.dept_no = m.dept_no;


##-- Duplicate records--##

    
insert into  dept_manager_dup values ('110228','d003','1992-03-21','1999-01-01');
    
insert into  departments_dupe values ('d009','customer service');
    
 ##how to handle duplicate values
 
 SELECT 
    m.emp_no, m.dept_no, d.dept_name
FROM
    dept_manager_dup m
        JOIN
    departments_dupe d ON m.dept_no = d.dept_no
GROUP BY m.emp_no , m.dept_no , d.dept_name
ORDER BY dept_no;
 
 
delete from  dept_manager_dup -- delete duplicate records
where dept_no='110228';
    
 delete from  departments_dupe  -- delete duplicate records
where dept_no ='d009';
    
## add back initial record
insert into   dept_manager_dup  values ('110228','d003','1992-03-21','9999-01-01') ;

insert into departments_dupe values ('d009','customer service');

##-- LEFT JOIN --##

SELECT 
    m.emp_no, m.dept_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dupe d ON m.dept_no = d.dept_no
GROUP BY m.emp_no , m.dept_no , d.dept_name
ORDER BY m.dept_no;


###oin the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. See if the output contains a manager with that name.  
#Hint: Create an output containing information corresponding to the following fields: ‘emp_no’, ‘first_name’, ‘last_name’, ‘dept_no’, ‘from_date’. Order by 'dept_no' descending, and then by 'emp_no'.

SELECT 
    e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager m ON e.emp_no = m.emp_no
WHERE
    e.last_name = 'markovitch'
ORDER BY m.dept_no DESC , e.emp_no;

##Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. Use the old type of join syntax to obtain the result.

SELECT 
    d.dept_no, e.emp_no, e.first_name, e.last_name, e.hire_date
FROM
    employees e
        JOIN
    dept_manager d ON e.emp_no = d.emp_no
ORDER BY emp_no;

##employees whose salary is > 1450000

SELECT 
    e.emp_no, e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    salary > 145000
ORDER BY emp_no
;

##Select the first and last name, the hire date, and the job title of all employees whose first name is “Margareta” and have the last name “Markovitch”.

SELECT 
    e.emp_no, e.first_name, e.last_name, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    first_name = 'margareta'
        AND last_name = 'markovitch';


##-- CROSS JOIN --##

##Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.

SELECT 
    d.*, dm.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm ON d.dept_no = dm.dept_no
WHERE
    d.dept_no = 'd009';

##Return a list with the first 10 employees with all the departments they can be assigned to.
##Hint: Don’t use LIMIT; use a WHERE clause.

SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no , d.dept_name;

## using aggregate function with join
## find average salary of male and female in company

SELECT 
    e.gender, AVG(s.salary) AS avg_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY gender;


##--join more than two tables --##

##Select all managers’ first and last name, hire date, job title, start date, and department name.
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
ORDER BY e.emp_no;


#################
set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');



## find out the average amount of salary paid to each department
## as there is no direct relation between department and salary we have to join departments to dept_manager and then salaries
SELECT 
    d.dept_name, AVG(s.salary)
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name;

##find out the average amount of salary paid to each department having salary greater than 60000

SELECT 
    d.dept_name, AVG(s.salary) as average_salary
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
having average_salary > 60000
order by dept_name
;


## How many male and how many female managers do we have in the ‘employees’ database?

select e.gender,count(dm.emp_no) as manager_count
from employees e 
join dept_manager dm on e.emp_no = dm.emp_no 
group by gender;


##-- SUBQUERIES WITH IN NESTED INSIDE WHERE --##

## select first name,last name from employees tablefor the same employee number that can be found in 'department manager' table

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);


##Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.

SELECT 
    *
FROM
    dept_manager dm
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');

##-- SUBQUERIES WITH EXISTS NOT EXISTS NESTED INSIDE WHERE --##
##Select the entire information for all employees whose job title is “Assistant Engineer”. Hint: To solve this exercise, use the 'employees' table.

SELECT 
    *
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            e.emp_no = t.emp_no
                AND title = 'assistant engineer');



##-- SUBQUERIES NESTED IN SELECT and form--##

## assign employee number 110022 as a manager to all employee from 10001 to 10020 and employee number 110039 as a manager to all employees from 10021 to 10040 
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MIN(dept_no) AS dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_id
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A
    
union 
SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MIN(dept_no) AS dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_id
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    limit 20) AS B
;


##--SQL Subqueries nested in SELECT and FROM --##
##Starting your code with “DROP TABLE”, create a table called “emp_manager” 
##(emp_no – integer of 11, not null; dept_no – CHAR of 4, null; manager_no – integer of 11, not null). 

create table Emp_manager(emp_no int(11) not null , dept_no char(4) null ,manager_no int(11) not null);

##Fill emp_manager with data about employees, the number of the department they are working in, and their managers.

##Your query skeleton must be:
#Insert INTO emp_manager SELECT U.*
#FROM (A)
#UNION (B) UNION (C) UNION (D) AS U;
#A and B should be the same subsets used in the last lecture (SQL Subqueries Nested in SELECT and FROM). In other words, assign employee number 110022 as a manager to all employees from 10001 to 10020 (this must be subset A), and employee number 110039 as a manager to all employees from 10021 to 10040 (this must be subset B).
#Use the structure of subset A to create subset C, where you must assign employee number 110039 as a manager to employee 110022.
#Following the same logic, create subset D. Here you must do the opposite - assign employee 110022 as a manager to employee 110039.
#Your output must contain 42 rows.

INSERT INTO emp_manager
SELECT 
    u.*
FROM(
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MIN(dept_no) AS dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_id
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A
    
union 
SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MIN(dept_no) AS dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_id
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    limit 20) AS B

union
SELECT 
    C.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MIN(dept_no) AS dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_id
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS C

union

SELECT 
    D.*
FROM
    (SELECT 
        e.emp_no AS employee_id,
            MIN(dept_no) AS dept_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_id
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS D) as u;
    
  
  ##--  VIEW --##
    
  ##Create a view that will extract the average salary of all managers registered in the database. Round this value to the nearest cent.  
    
    create or replace  view v_avg_salary as  SELECT

        ROUND(AVG(salary), 2)

    FROM

        salaries s

            JOIN

        dept_manager m ON s.emp_no = m.emp_no;
    


#Retrieve the average contract salary values of employees 10002, 10005, and 10007, rounded to the nearest cent. Ensure that this query only includes contracts that started between the years 1991 and 1996, inclusive. Name the resulting column avg_salary.
#Next, insert this query into a view. To do that, following best practices, drop the view named v_manager_avg_salary if it currently exists in the databse. Finally, create a view named v_manager_avg_salary containing the SELECT statement you just created.
    
    
   SELECT 
    AVG(ROUND(SALARY, 2)) AS AVG_SALARY
FROM
    SALARIES S
        JOIN
    EMPLOYEES E ON E.emp_no = S.emp_no
WHERE
    E.EMP_NO IN (10002 , 10005, 10007)
        AND from_date BETWEEN '1991-01-01' AND '1996-12-31';
        
        

  CREATE VIEW v_manager_avg_salary AS
    SELECT 
        AVG(ROUND(SALARY, 2)) AS AVG_SALARY
    FROM
        SALARIES S
            JOIN
        EMPLOYEES E ON E.emp_no = S.emp_no
    WHERE
        E.EMP_NO IN (10002 , 10005, 10007)
            AND from_date BETWEEN '1991-01-01' AND '1996-12-31';
    
    
    
  ##------  STORED PROCEDURES  --------##
  
  ## Create store proc which return the first 1000 rows from employees table
  
  delimiter //
  create procedure select_employees()
  
  begin
		
        select * from employees
        limit 1000;
  
  end //
  
  delimiter ;
  
  ##Create a procedure that will provide the average salary of all employees. Then, call the procedure.
  drop procedure if exists proc_avg_salary;
  
  
 delimiter //
 
 create procedure proc_avg_salary()
 begin
		
        select avg(salary) from salaries;
 
 end //
  
  delimiter ;
  
  call proc_avg_salary();
  
  
 ##Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number. 
  
  ## created directly using create store procedure
  
  
##----  Create a variable, called ‘v_emp_no’, where you will store the output of the procedure you created in the last exercise.
#Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ as a first and last name respectively.
#Finally, select the obtained output.------##  
  
  
SET @v_emp_no = 0;

CALL emp_info('Aruna', 'Journel', @v_emp_no);

SELECT @v_emp_no;  
  
  
##---- INDEXES------##

SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';
  
  
  
create index i_hire_date on employees(hire_date);  


## drop index
alter table employees  
drop index i_hire_date;  
  
  
##Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.
 #Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.
  
  
  select * from salaries
  where salary > 89000;
  
 create index i_salary on salaries(salary) ;
  
 ##---- CASE STATEMENTS -----## 
 ##obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990.
 ##Create a fourth column in the query, indicating whether this employee is also a manager, according to the data provided in the dept_manager table, or a regular employee.  ##
  
  select e.emp_no,
	e.first_name,
	e.last_name,

    CASE

        WHEN dm.emp_no IS NOT NULL THEN 'Manager'

        ELSE 'Employee'

    END AS is_manager

FROM

    employees e

        LEFT JOIN

    dept_manager dm ON dm.emp_no = e.emp_no

WHERE

    e.emp_no > 109990 ;
  
  
 ##Extract a dataset containing the following information about the managers: employee number, first name, and last name
 ##Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, 
 ##and another one saying whether this salary raise was higher than $30,000 or NOT. 
  
  SELECT

    dm.emp_no,  

    e.first_name,  

    e.last_name,  

    MAX(s.salary) - MIN(s.salary) AS salary_difference,  

    CASE  

        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more then $30,000'  

        ELSE 'Salary was NOT raised by more then $30,000'  

    END AS salary_raise  

FROM  

    dept_manager dm  

        JOIN  

    employees e ON e.emp_no = dm.emp_no  

        JOIN  

    salaries s ON s.emp_no = dm.emp_no  

GROUP BY s.emp_no;  

   

SELECT  

    dm.emp_no,  

    e.first_name,  

    e.last_name,  

    MAX(s.salary) - MIN(s.salary) AS salary_difference,  

    IF(MAX(s.salary) - MIN(s.salary) > 30000, 'Salary was raised by more then $30,000', 'Salary was NOT raised by more then $30,000') AS salary_increase  

FROM  

    dept_manager dm  

        JOIN  

    employees e ON e.emp_no = dm.emp_no  

        JOIN  

    salaries s ON s.emp_no = dm.emp_no  

GROUP BY s.emp_no;

##----- WINDOW FUNCTION -----##

##Write a query that upon execution, assigns a row number to all managers we have information for in the "employees" database (regardless of their department).
#Let the numbering disregard the department the managers have worked in. Also, let it start from the value of 1. Assign that value to the manager with the lowest employee number.


select emp_no,dept_no,
	row_number() over(order by emp_no ) as row_num 
    from dept_manager;



##Write a query that upon execution, assigns a sequential number for each employee number registered in the "employees" table.
##Partition the data by the employee's first name and order it by their last name in ascending order (for each partition).

select emp_no,first_name,last_name,
row_number() over(partition by first_name order by last_name) as row_num
from employees;

  
##Obtain a result set containing the salary values each manager has signed a contract for. To obtain the data, refer to the "employees" database.
#Use window functions to add the following two columns to the final output:
#- a column containing the row number of each row from the obtained dataset, starting from 1.
#- a column containing the sequential row numbers associated to the rows for each manager, where their highest salary has been given a number equal to the number of rows in the given partition, and their lowest - the number 1.
#Finally, while presenting the output, make sure that the data has been ordered by the values in the first of the row number columns, and then by the salary values for each partition in ascending order.  
    
 select
  dm.emp_no,s.salary,
  row_number() over() as row_num1,
  row_number() over(partition by dm.emp_no order by s.salary asc) as row_num2
from dept_manager dm
join 
salaries s on dm.emp_no =s.emp_no 
order by row_num1,emp_no,salary asc;
    
##----WINDOW FUNCTION SYNTAX-----##    
    
##Write a query that provides row numbers for all workers from the "employees" table, 
#partitioning the data by their first names and ordering each partition by their employee number in ascending order.
##NB! While writing the desired query, do *not* use an ORDER BY clause in the relevant SELECT statement. 
#At the same time, do use a WINDOW clause to provide the required window specification.
    
 
 select emp_no,first_name,
 row_number() over w as row_num
 from employees
 window w as (partition by first_name order by emp_no asc);
 
 
 
 
 
 ##-----  PARTITION BY VS GROUP BY CLAUSE-----##
 
 
 ##Find out the lowest salary value each employee has ever signed a contract for. 
 #3To obtain the desired output, use a subquery containing a window function, as well as a window specification introduced with the help of the WINDOW keyword.
##Also, to obtain the desired result set, refer only to data from the “salaries” table.
 
 SELECT a.emp_no,

       MIN(salary) AS min_salary FROM (

SELECT

emp_no, salary, ROW_NUMBER() OVER w AS row_num

FROM

salaries

WINDOW w AS (PARTITION BY emp_no ORDER BY salary)) a

GROUP BY emp_no;
 
 
##ind out the lowest salary value each employee has ever signed a contract for. 
##Once again, to obtain the desired output, use a subquery containing a window function. This time, however, introduce the window specification in the field list of the given subquery.
##To obtain the desired result set, refer only to data from the “salaries” table.    

SELECT a.emp_no,

       MIN(salary) AS min_salary FROM (

SELECT

emp_no, salary, ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary) AS row_num

FROM

salaries) a

GROUP BY emp_no;

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
    

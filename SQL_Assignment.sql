use hr;


# Display all information in the tables EMP and DEPT.

select * from employees;
select * from departments;

# Display only the hire date and employee name for each employee.

select first_name,last_name,hire_date 
from employees;

# Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title 

select concat(first_name, " ", last_name, " , " , job_id) as "Employee and Title" 
from employees;

# Display the hire date, name and department number for all clerks.

select hire_date,first_name,department_id 
from employees
where job_id rlike "CLERK";

# Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT

select concat_ws(",", employee_id, first_name, last_name, email, phone_number, hire_date, job_id, commission_pct, manager_id, department_id) as "THE OUTPUT" 
from employees;

# Display the names and salaries of all employees with a salary greater than 2000.

select first_name, salary 
from employees 
where salary > 2000;

# Display the names and dates of employees with the column headers "Name" and "Start Date"

select first_name as 'Name', hire_date as 'Start Date' 
from employees;

# Display the names and hire dates of all employees in the order they were hired.

select first_name,hire_date 
from employees 
order by hire_date asc;

# Display the names and salaries of all employees in reverse salary order.

select first_name,salary 
from employees 
order by salary desc;

# Display 'ename" and "deptno" who are all earned commission and display salary in reverse order. 

select first_name,last_name,department_id,salary,commission_pct 
from employees 
where commission_pct != 'null' 
order by salary desc;

# Display the last name and job title of all employees who do not have a manager.

select last_name,job_title 
from employees join jobs on employees.job_id = jobs.job_id 
where job_title != 'manager';

# Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000

select last_name,job_id,salary 
from employees 
where job_id in ('SA_REP','ST_CLERK') and salary not in (2500,3500,5000);

# Display the maximum, minimum and average salary and commission earned.

SELECT MAX(salary), MIN(salary), AVG(salary), MAX(commission_pct), MIN(commission_pct), AVG(commission_pct)
FROM employees;

# Display the department number, total salary payout and total commission payout for each department.

select department_id,sum(salary) as 'total salary', sum(commission_pct) as 'total commission'
from employees
group by department_id;

# Display the department number and number of employees in each department.

select department_id,count(employee_id) as 'No of employees' 
from employees 
group by department_id;

# Display the department number and total salary of employees in each department.

select department_id,sum(salary) as 'total salary of employees' 
from employees 
group by department_id;

# Display the employee's name who doesn't earn a commission. Order the result set without using the column name.

select first_name 
from employees 
where commission_pct is null;

# Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately

select first_name, department_id, if(commission_pct is null, 'no commission', commission_pct) as "Appropriately" 
from employees;

# Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns appropriately

select first_name, salary, if(commission_pct is null, "No Commission", (commission_pct*2)) as "Appropriately" 
from employees;

# Display the employee's name, department id who have the first name same as another employee in the same department

select first_name,department_id, count(first_name) 
from employees 
group by first_name,department_id 
having count(first_name) > 1;

# Display the sum of salaries of the employees working under each Manager.

select sum(salary), manager_id 
from employees 
group by manager_id;

# Select the Managers name, the count of employees working under and the department ID of the manager. 

select m.first_name as "manager_name", count(e.employee_id) as "Count of employees", m.department_id 
from employees as e join employees as m on e.manager_id = m.employee_id
group by e.manager_id;

# Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a!

select first_name,last_name, department_id,salary
from employees join jobs on employees.job_id = jobs.job_id
where job_title rlike 'manager' and last_name like '_a%';

# Display the average of sum of the salaries and group the result with the department id. Order the result with the department id.

select department_id, avg(salary)
from employees
group by department_id
order by department_id asc;

# Select the maximum salary of each department along with the department id

select department_id, max(salary)
from employees
group by department_id;

# Display the commission, if not null display 10% of salary, if null display a default value 1.

select salary, if(commission_pct != null, salary/10 , 1) as 'commission' 
from employees;

# Write a query that displays the employee's last names only from the string's 2-5th position with the first letter capitalized and all other letters lowercase, Give each column an appropriate label. 

select last_name, concat(upper(substring(last_name,2,1)), lower(substring(last_name,3,3))) 
from employees;

# Write a query that displays the employee's first name and last name along with a " in between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the month on which the employee has joined.

select concat(first_name,'-',last_name,'-',monthname(hire_date)) 
from employees;

# Write a query to display the employee's last name and if half of the salary is greater than ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 1500 each. Provide each column an appropriate label. 

select last_name,salary, if((salary/2)>10000,(salary*10)/100, 1500 + salary + (salary*11.5)/100) as 'bonus_salary' 
from employees;

# Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id, salary and the manager name all in Upper case, if the Manager name consists of 'z' replace it with '$! 

select e.employee_id,e.department_id,e.salary, 
concat(substring(e.employee_id,1,2),'00',substring(e.employee_id,3),'E') as new_emp_id, upper(replace(m.first_name,'z','$')) as manager_name
from employees as e join employees as m on e.manager_id= m.employee_id;
    
    
# Write a query that displays the employee's last names with the first letter capitalized and all other letters lowercase, and the length of the names, for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' last names 

select last_name, length(concat(last_name)) as lenth
from employees
where last_name like 'j%' or last_name like 'a%' or last_name like 'm%'
order by last_name;

# Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $. Label the column SALARY 

select last_name, lpad(salary,15,'$') as salary 
from employees;

# Display the employee's name if it is a palindrome 

select first_name
from employees
where reverse(first_name) = first_name;

# Display First names of all employees with initcaps. 

select upper(first_name),lower(first_name), initcap(first_name) 
from employees;

# From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column. 

select substring_index(substring_index(street_address, ' ', 2),' ',-1), street_address
from locations;


# Display the names and job titles of all employees with the same job as Trenna. 

select first_name, job_title
from employees join jobs on employees.job_id = jobs.job_id
where job_title = (select job_title from jobs join employees on employees.job_id=jobs.job_id where first_name = "Trenna");

# Display the names and department name of all employees working in the same city as Trenna. 

select e.first_name, d.department_name, l.city
from employees as e join departments as d on e.department_id = d.department_id join locations as l on l.location_id = d.location_id
where l.city = (select l.city from locations as l join departments as d on l.location_id = d.location_id join employees as e on e.department_id = d.department_id where e.first_name = "Trenna" );

# Display the name of the employee whose salary is the lowest. 

select first_name, salary 
from employees
where salary = (select min(salary) from employees);

# Display the names of all employees except the lowest paid.

select first_name, salary 
from employees
where salary != (select min(salary) from employees);


# Write a query to display the last name, department number, department name for all employees. 

select e.last_name, d.department_id, d.department_name
from employees as e join departments as d on e.department_id = d.department_id;

# Create a unique list of all jobs that are in department 4. Include the location of the department in the output. 


# Write a query to display the employee last name,department name,location id and city of all employees who earn commission. 

select e.last_name, d.department_name, l.location_id, l.city
from employees as e join departments as d on e.department_id = d.department_id join locations as l on l.location_id=d.location_id
where e.commission_pct != 'null';

# Display the employee last name and department name of all employees who have an 'a' in their last name 

select last_name,department_name
from employees as e join departments as d on e.department_id = d.department_id
where last_name like '%a%';

# Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA. 

select e.last_name, j.job_title, d.department_id, d.department_name, l.city
from employees as e join departments as d on d.department_id = e.department_id join jobs as j on j.job_id = e.job_id join locations as l on l.location_id = d.location_id
where l.city = 'Roma'; 

# Display the employee last name and employee number along with their manager's last name and manager number. 

select e.last_name, e.employee_id, m.last_name as manager_last_name, m.manager_id
from employees as e join employees as m on e.manager_id = m.employee_id;

# Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager). 

select e.last_name, e.employee_id, m.last_name as manager_last_name, m.manager_id
from employees as e left join employees as m on e.manager_id = m.employee_id;

# Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee. 

select last_name, department_id
from employees 
order by department_id;

# Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) 

select e.first_name, j.job_title, d.department_name, e.salary, 
case when e.salary >= 20000 then "A" when e.salary >= 10000 then "B" else "C" end as grade 
from employees as e join jobs as j on e.job_id = j.job_id join departments as d on d.department_id = e.department_id;

# Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. Label the columns as Employee name, emp_hire_date,manager name,man_hire_date

select e.first_name, e.hire_date as "e_hire_date", m.first_name as manager_name, m.hire_date as "m_hire_date"
from employees as e join employees as m on e.manager_id = m.employee_id
where datediff(e.hire_date, m.hire_date) < 0;


# Write a query to display the last name and hire date of any employee in the same department as SALES. 

select last_name, hire_date, department_name
from employees as e join departments as d on e.department_id = d.department_id
where department_name = 'sales';

# Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary. 

select last_name, employee_id, salary
from employees
where salary >= (select avg(salary) from employees)
order by salary;

# Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a' u 

select employee_id, last_name, department_id
from employees
where department_id 
in (select department_id 
	from employees
	where last_name like "%u%");


# Display the last name, department number, and job ID of all employees whose department location is ATLANTA. 

select e.last_name, d.department_id,j.job_id, d.department_name, l.city
from employees as e join departments as d on d.department_id = e.department_id join jobs as j on j.job_id = e.job_id join locations as l on l.location_id = d.location_id
where l.city = 'ATLANTA'; 

select e.last_name, d.department_id, e.job_id, d.department_name, l.city
from employees as e join departments as d on e.department_id = d.department_id join locations as l on l.location_id = d.location_id
where city = 'Tokyo';


# Display the department number, last name, and job ID for every employee in the OPERATIONS department. 

select e.department_id, e.last_name, e.job_id, d.department_name
from employees as e join departments as d
where d.department_name = 'operations';

# Modify the above query to display the employee numbers, last names, and salaries of all employees who earn more than the average salary and who work in a department with any employee with a 'u'in their name. 

select employee_id, last_name, department_id, salary
from employees
where department_id 
in (select department_id 
	from employees
	where last_name like "%u%")
and salary > (select avg(salary) from employees);


# Display the names of all employees whose job title is the same as anyone in the sales dept. 

select e.first_name, j.job_title, d.department_name
from employees as e join jobs as j on e.job_id = j.job_id join departments as d	on e.department_id = d.department_id
where d.department_name = "sales";


# Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries. 

select last_name, salary
from employees
order by salary desc
limit 3;

# Display the names of all employees with their salary and commission earned. Employees with a null commission should have O in the commission column

select first_name, salary, if(commission_pct is null , 0 , commission_pct) as cummission_Pct
from employees;

# Display the Managers (name) with top three salaries along with their salaries and department information.

select distinct m.first_name as manager_name,m.salary, m.department_id, d.department_name
from employees as e join employees as m on e.manager_id = m.employee_id join departments as d on d.department_id = m.department_id
order by salary desc
limit 3; 


USE adventureworks;


# Write a query to display employee numbers and employee name (first name, last name) of all the sales employees who received an amount of 2000 in bonus. 

SELECT employeeID, CONCAT(firstname, " ", lastname) AS Fullname, s.bonus
FROM employee AS e JOIN contact AS c ON e.contactid = c.contactid JOIN salesperson AS s ON c.modifieddate = s.ModifiedDate
WHERE s.bonus = 2000;



# Write a query that displays all the products along with the Sales OrderID even if an order has never been placed for that product.  
SELECT product.productid, name, salesorderid
FROM product LEFT JOIN salesorderdetail ON product.productID = salesorderdetail.productId;
    

# Find the subcategories that have at least two different prices less than $15. 
SELECT p.name, s.UnitPrice
FROM productsubcategory AS p JOIN product as pp ON p.ProductSubcategoryID = pp.ProductSubcategoryID JOIN salesorderdetail as s ON pp.productid = s.productid
WHERE s.UnitPrice < 15;


# Write a query to display employees and their manager details. Fetch employee id, employee first name, and manager id, manager name

SELECT e.employeeid, c.FirstName, m.employeeid AS managerid, cc.FirstName AS managername
FROM employee AS e JOIN employee AS m ON e.managerid = m.employeeid JOIN contact AS c ON c.contactid = e.contactid JOIN contact AS cc ON cc.contactid = m.contactid;
    
# Display the employee id and employee name of employees who do not have manager. 

SELECT e.employeeid , c.firstname 
FROM employee AS e JOIN contact AS c ON e.contactid = c.contactid
WHERE e.managerid IS NULL;
    

# Display the names of all products of a particular subcategory 15 and the names of their vendors

SELECT p.name AS "Product_Name", p.ProductSubcategoryID, v.name AS "Vendor_Name"
FROM vendor AS v JOIN productvendor AS pv ON v.vendorid = pv.vendorid JOIN product AS p ON p.productid = pv.productid JOIN productsubcategory AS c ON c.ProductSubcategoryID = p.ProductSubcategoryID
WHERE p.ProductSubcategoryID = 15;


# Find the products that have more than one vendor

SELECT p.name, COUNT(v.vendorid) AS "Vendor_count"
FROM vendor AS v JOIN productvendor AS pv ON v.vendorid = pv.vendorid JOIN product AS p ON p.productid = pv.productid JOIN productsubcategory AS c ON c.ProductSubcategoryID = p.ProductSubcategoryID
GROUP BY p.name
HAVING Vendor_count > 1;


# Display product number, description and sales of each product in the year 2001. 

SELECT p.name, p.ProductNumber, d.description, YEAR(o.modifieddate) 
FROM salesorderdetail AS o JOIN product AS p ON o.ProductID = p.ProductID JOIN productmodelproductdescriptionculture AS pd ON p.ProductModelID = pd.ProductModelID JOIN productdescription AS d ON d.ProductDescriptionID = pd.ProductDescriptionID
WHERE YEAR(o.modifieddate) = 2001;


USE dates;


# Find the date difference between the hire date and resignation_date for all the employees. Display in no. of days, months and year(1 year 3 months 5 days).

SELECT 
	CONCAT(FLOOR(DATEDIFF(resignation_date, hire_date)/365)," Year ",
		   FLOOR(DATEDIFF(resignation_date, hire_date)%365/30), " Month ",
           FLOOR(DATEDIFF(resignation_date, hire_date)%365%30), " Day") AS "Date"
FROM 
	empdates; -- IN THIS METHOD WE HAVE SMALL BUG IN DAYS
    
 
# Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd,yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900)

SELECT 
	DATE_FORMAT(hire_date, "%d / %m / %Y") AS hire_date,
    IF(resignation_date IS NULL, "DEC, 01th 1900", DATE_FORMAT(resignation_date, "%b  %D,  %Y ")) AS "Resignation_Date"    
FROM 
	empdates;
    
    
# Calcuate experience of the employee till date in Years and months(example 1 year and 3 months)

SELECT 
	CONCAT(FLOOR(DATEDIFF(IF(resignation_date IS NULL, CURDATE(), resignation_date), hire_date)/365)," Year ",
		   FLOOR(DATEDIFF(IF(resignation_date IS NULL, CURDATE(), resignation_date), hire_date)%365/30), " Month ",
           FLOOR(DATEDIFF(IF(resignation_date IS NULL, CURDATE(), resignation_date), hire_date)%365%30), " Day") AS experience
FROM 
	empdates;
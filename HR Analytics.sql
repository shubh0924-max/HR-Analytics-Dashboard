CREATE TABLE HR(
Employee_ID INT Primary key,
Age INT,
Gender VARCHAR(20)NOT NULL,
Marital_Status VARCHAR(20)NOT NULL,
Department VARCHAR(20)NOT NULL,
Job_Role VARCHAR(20)NOT NULL,
Job_Level NUMERIC(10),
Monthly_Income NUMERIC(10),
Hourly_Rate INT,
Years_at_Company INT,
Years_in_Current_Role INT,
Years_Since_Last_Promotion INT,
Work_Life_Balance NUMERIC(10),
Job_Satisfaction NUMERIC(10),
Performance_Rating NUMERIC(10),
Training_Hours_Last_Year NUMERIC(10),
Overtime VARCHAR(20),
Project_Count NUMERIC(10),
Average_Hours_Worked_Per_Week NUMERIC(10),
Absenteeism NUMERIC(10),
Work_Environment_Satisfaction INT,
Relationship_with_Manager INT,
Job_Involvement INT,
Distance_From_Home NUMERIC(10),
Number_of_Companies_Worked NUMERIC(10),
Attrition VARCHAR(4),
Age_Group  VARCHAR (20),
Income_Band VARCHAR(20),
Experience_Level VARCHAR(20),
Distance_Category VARCHAR(20),  
Working_Hours_Category VARCHAR(20)
);


SELECT * FROM HR ;

SELECT COUNT(*) AS total_employee
FROM HR ;


SELECT 
    Department,
    COUNT(*) AS employee_count
FROM HR
GROUP BY Department
ORDER BY employee_count DESC;


SELECT 
    Attrition,
    COUNT(*) AS employee_count
FROM HR
GROUP BY Attrition;

SELECT
    Department,
    Attrition,
    COUNT(*) AS employee_count
FROM HR
GROUP BY Department, Attrition
ORDER BY Department, Attrition;


SELECT
    Department,
    ROUND(AVG(Monthly_Income), 2) AS average_monthly_income
FROM HR
GROUP BY Department
ORDER BY average_monthly_income DESC;


SELECT
    Overtime,
    Attrition,
    COUNT(*) AS employee_count
FROM HR
GROUP BY Overtime, Attrition
ORDER BY Overtime, Attrition;


SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM HR
GROUP BY Department
ORDER BY attrition_rate DESC;


SELECT
    Job_Role,
    ROUND(AVG(Monthly_Income), 2) AS average_monthly_income
FROM HR
GROUP BY Job_Role
ORDER BY average_monthly_income DESC;


SELECT
    Job_Role,
    Attrition,
    COUNT(*) AS employee_count
FROM HR
GROUP BY Job_Role, Attrition
ORDER BY Job_Role, Attrition;


SELECT
    Job_Satisfaction,
    Attrition,
    COUNT(*) AS employee_count
FROM HR
GROUP BY Job_Satisfaction, Attrition
ORDER BY Job_Satisfaction, Attrition;


SELECT
    Overtime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS attrition_rate
FROM HR
GROUP BY Overtime
ORDER BY attrition_rate DESC;


SELECT
    Attrition,
    COUNT(*) AS employee_count,
    ROUND(AVG(Monthly_Income), 2) AS average_monthly_income
FROM HR
GROUP BY Attrition
ORDER BY average_monthly_income DESC;


SELECT
    Department,
    ROUND(AVG(Job_Satisfaction), 2) AS average_job_satisfaction
FROM HR
GROUP BY Department
ORDER BY average_job_satisfaction DESC;

SELECT
    Age_Group,
    Attrition,
    COUNT(*) AS employee_count
FROM HR
GROUP BY Age_Group, Attrition
ORDER BY Age_Group, Attrition;


SELECT
    Department,
    ROUND(AVG(Years_at_Company), 2) AS average_years_at_company
FROM HR
GROUP BY Department
ORDER BY average_years_at_company DESC;


-- Find highly satisfied employees.

SELECT
    Employee_ID,
    Department,
    Job_Role,
    Job_Satisfaction,
    Attrition
FROM HR
WHERE Job_Satisfaction = 4;


-- Count highly satisfied employees.

SELECT COUNT(*) AS employee_count
FROM HR
WHERE Job_Satisfaction = 4;


-- Find employees with low Job Satisfaction.

SELECT
    Employee_ID,
    Department,
    Job_Role,
    Job_Satisfaction,
    Attrition
FROM HR
WHERE Job_Satisfaction <= 2;


-- count employees with low Job Satisfaction.

SELECT COUNT(*) AS employee_count 
FROM HR
WHERE Job_Satisfaction <=2;


-- Find employees with high monthly income.

SELECT
    Employee_ID,
    Department,
    Job_Role,
    Monthly_Income,
    Attrition
FROM HR
WHERE Monthly_Income > 10000;

-- Total number of employees with more than 10000 salary

SELECT COUNT (*) AS employee_count 
FROM HR 
WHERE Monthly_Income >= 10000;


-- Find employees with low monthly income

SELECT 
	Employee_ID,
	Department,
	Job_Role,
	Monthly_Income,
	Attrition
FROM HR 
WHERE Monthly_Income <=10000;

-- Find employees who have worked overtime and left.

SELECT
    Employee_ID,
    Department,
    Job_Role,
    Overtime,
    Attrition
FROM HR
WHERE Overtime = 'Yes'
  AND Attrition = 'Yes';

-- Find employees who have worked overtime and stay.

SELECT
    Employee_ID,
    Department,
    Job_Role,
    Overtime,
    Attrition
FROM HR
WHERE Overtime = 'Yes'
  AND Attrition = 'No';


-- Find employees who left despite having no overtime.

SELECT
    Employee_ID,
    Department,
    Job_Role,
    Overtime,
    Attrition
FROM HR
WHERE Overtime = 'No'
  AND Attrition = 'Yes';


-- Find employees with low job satisfaction who left.

SELECT
    Employee_ID,
    Department,
    Job_Role,
    Job_Satisfaction,
    Attrition
FROM HR
WHERE Job_Satisfaction <= 2
  AND Attrition = 'Yes';


-- Find employees with long tenure.

SELECT 
	Employee_ID,
	Department,
	Job_Role,
	Attrition,
	Years_at_Company
FROM HR 
WHERE Years_at_Company > 10;


-- Employee with 10 years in company and left 

SELECT 
	Employee_ID,
	Department,
	Job_Role,
	Attrition,
	Years_at_Company
FROM HR 
WHERE Years_at_Company > 10
AND Attrition = 'Yes';


-- Employee with 10 years in company and stay. 

SELECT 
	Employee_ID,
	Department,
	Job_Role,
	Attrition,
	Years_at_Company
FROM HR 
WHERE Years_at_Company > 10
AND Attrition = 'No';

-- Find employees who stayed despite low satisfaction.

SELECT
    Employee_ID,
    Department,
    Job_Role,
    Job_Satisfaction,
    Attrition
FROM HR
WHERE Job_Satisfaction <= 2
  AND Attrition = 'No';


-- Find employees with high income who left.

SELECT
    Employee_ID,
    Department,
    Job_Role,
    Monthly_Income,
    Attrition
FROM HR
WHERE Monthly_Income > 10000
  AND Attrition = 'Yes';


-- Find employees with low income who left.

SELECT
    Employee_ID,
    Department,
    Job_Role,
    Monthly_Income,
    Attrition
FROM HR
WHERE Monthly_Income < 10000
  AND Attrition = 'Yes';


-- Find employees aged between 25 and 35.

SELECT 
	Employee_ID,
	Department,
	Job_Role,
	Age
FROM HR 
WHERE Age BETWEEN 25 AND 35;


--Employees aged above 40 with attrition

SELECT 
	Employee_ID,
	Age,
	Department,
	Job_Role,
	Attrition
FROM HR 
WHERE Age > 40 
 AND Attrition = 'Yes';


--Employees from IT, HR, and Finance departments

SELECT * FROM HR 
	WHERE Department = 'IT'
	OR Department = 'HR'
	OR Department = 'Finance';



--Employees with Income between 5,000 and 10,000


SELECT 
	Employee_ID,
	Monthly_Income,
	Department,
	Job_Role
FROM HR 
  WHERE Monthly_Income  BETWEEN 5000 AND 10000;


 SELECT * FROM HR ;


--Count employees by gender

SELECT Gender, COUNT (*) AS total
FROM HR 
 GROUP BY Gender;


--Count employees by Job_Role.

SELECT Job_Role,COUNT(*) AS Total
FROM HR 
 GROUP BY Job_Role;


--Attrition count by job role.

SELECT  Job_Role , Attrition , COUNT (*) AS total
  FROM HR 
  GROUP BY Job_Role , Attrition
  ORDER BY Job_Role ;


--Average age by department

SELECT 
Department,
ROUND(AVG(Age),2)AS average_age
FROM HR 
GROUP BY Department
ORDER BY average_age DESC;


-- Find the highest monthly income 

SELECT
MAX(Monthly_income)as Highest_salary
FROM HR;


-- Find the highest-paid employee.


SELECT 
Employee_ID,
Department,
Job_Role,
Monthly_Income
FROM HR 
ORDER BY Monthly_Income DESC
LIMIT 1 ;


-- Find the highest-paid employee.

SELECT 
Employee_ID,
Department,
Job_Role,
Monthly_Income
FROM HR 
ORDER BY Monthly_Income ASC
LIMIT 1 ;


-- Find the 5 highest-paid employee.


SELECT 
Employee_ID,
Department,
Job_Role,
Monthly_Income
FROM HR 
ORDER BY Monthly_Income DESC
LIMIT 5 ;


-- Find employees with the highest number of projects.


SELECT 
	Employee_ID,
	Department,
	Job_Role,
	Project_Count
FROM HR 
ORDER BY Project_Count DESC
LIMIT 5 ;


-- Find average projects by department.


SELECT 
Department,
ROUND(AVG(Project_Count),2)as average_project
FROM HR 
GROUP BY Department 
ORDER BY average_project DESC;


-- Find employees with the highest performance rating.

SELECT
    Employee_ID,
    Department,
    Job_Role,
    Performance_Rating,
    Attrition
FROM HR
WHERE Performance_Rating = 4;


-- Find low-performing employees who left.

SELECT
    Employee_ID,
    Department,
    Job_Role,
    Performance_Rating,
    Attrition
FROM HR
WHERE Performance_Rating <= 2
  AND Attrition = 'Yes';



-- Count employees by gender.

SELECT
    Gender,
    COUNT(*) AS employee_count
FROM HR
GROUP BY Gender
ORDER BY employee_count DESC;


-- Count employees by job role.

SELECT
    Job_Role,
    COUNT(*) AS employee_count
FROM HR
GROUP BY Job_Role
ORDER BY employee_count DESC;


-- Find average income by job role.

SELECT
    Job_Role,
    ROUND(AVG(Monthly_Income), 2) AS average_income
FROM HR
GROUP BY Job_Role
ORDER BY average_income DESC;


-- Find attrition count by job role.

SELECT
    Job_Role,
    COUNT(*) AS attrition_count
FROM HR
WHERE Attrition = 'Yes'
GROUP BY Job_Role
ORDER BY attrition_count DESC;



-- Find departments with more than 100 employees.

SELECT
    Department,
    COUNT(*) AS employee_count
FROM HR
GROUP BY Department
HAVING COUNT(*) > 100
ORDER BY employee_count DESC;


-- Find job roles with more than 50 employees.

SELECT
    Job_Role,
    COUNT(*) AS employee_count
FROM HR
GROUP BY Job_Role
HAVING COUNT(*) > 50
ORDER BY employee_count DESC;


-- Check total employees and employees who left.

SELECT
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE Attrition = 'Yes') AS employees_left
FROM HR;


-- Check average monthly income.

SELECT
    ROUND(AVG(Monthly_Income), 2) AS average_income
FROM HR;


-- Check average age.

SELECT
    ROUND(AVG(Age), 2) AS average_age
FROM HR;


-- Check average years at company.

SELECT
    ROUND(AVG(Years_at_Company), 2) AS average_tenure
FROM HR;


-- Check employee count by department.

SELECT
    Department,
    COUNT(*) AS employee_count
FROM HR
GROUP BY Department
ORDER BY employee_count DESC;


-- Check employees by age group.

-- Check employees by age group.

SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        WHEN Age BETWEEN 56 AND 65 THEN '56-65'
    END AS age_group,
    COUNT(*) AS employee_count
FROM HR
GROUP BY
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        WHEN Age BETWEEN 56 AND 65 THEN '56-65'
    END
ORDER BY employee_count DESC;


-- Find attrition by department.

SELECT
    Department,
    COUNT(*) FILTER (WHERE Attrition = 'Yes') AS employees_left
FROM HR
GROUP BY Department
ORDER BY employees_left DESC;


-- Find attrition rate by department.

SELECT
    Department,
    ROUND(
        COUNT(*) FILTER (WHERE Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM HR
GROUP BY Department
ORDER BY attrition_rate DESC;


-- Find attrition rate by overtime.

SELECT
    Overtime,
    ROUND(
        COUNT(*) FILTER (WHERE Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM HR
GROUP BY Overtime
ORDER BY attrition_rate DESC;


-- Find attrition rate by job role.

SELECT
    Job_Role,
    ROUND(
        COUNT(*) FILTER (WHERE Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM HR
GROUP BY Job_Role
ORDER BY attrition_rate DESC;


-- Find attrition rate by marital status.

SELECT
    Marital_Status,
    ROUND(
        COUNT(*) FILTER (WHERE Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM HR
GROUP BY Marital_Status
ORDER BY attrition_rate DESC;


-- Find attrition rate by performance rating.

SELECT
    Performance_Rating,
    ROUND(
        COUNT(*) FILTER (WHERE Attrition = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM HR
GROUP BY Performance_Rating
ORDER BY Performance_Rating;
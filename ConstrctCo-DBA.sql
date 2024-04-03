--#Write the SQL code required to list the employee number, last name, first name, and middle initial
--of all employees whose last names start with Smith. In other words, 
--the rows for both Smith and Smithfield should be included in the listing. 
--Sort the results by employee number. Assume case sensitivity. Display the attributes shown in the results presented in Figure P7.1.
from employee
where upper(emp_lname) like 'SMITH%'
order by 1;

--Using the EMPLOYEE, JOB, and PROJECT tables in the Ch07_ConstructCo database,
--write the SQL code that will join the JOB, EMPLOYEE, and PROJECT tables
--using common attributes. Display the attributes shown in the results presented in Figure P7.2, sorted by project value.
select proj_name, proj_value,proj_balance, emp_lname, emp_fname, emp_initial,e.job_code, job_descritpion, job_chg_hour
from job j join employee e on j.code_code=e.job_code
join project p on e.emp_num=p.emp_num
order by 2;

--#Write the SQL code that will produce the same information that was shown in Problem 2,
--but sorted by the employee’s last name. The results of running that query are shown in Figure P7.3.
select proj_name, proj_value,proj_balance, emp_lname, emp_fname, emp_initial,e.job_code, job_descritpion, job_chg_hour
from job j join employee e on j.code_code=e.job_code
join project p on e.emp_num=p.emp_num
order by 4;

--#Write the SQL code that will list only the distinct project numbers in the ASSIGNMENT table, 
--sorted by project number. The results of running that query are shown in Figure P7.4.
select distinct proj_num
from assignment
order by ;

--#Write the SQL code to validate the ASSIGN_CHARGE values in the ASSIGNMENT table. 
--Your query should retrieve the assignment number, employee number, project number,
--the stored assignment charge (ASSIGN_CHARGE), and the calculated assignment charge (CALC_ASSIGN_CHARGE, calculated 
--by multiplying ASSIGN_CHG_HR by ASSIGN_HOURS and rounded to two decimal places). 
--Sort the results by the assignment number. The results of running that query are shown in Figure P7.5.
select assign_num, emp_num, prj_num, assign_charge, round(assign_chg_hr*assign_hours,2) as calc_assign_charge
from assignment
order by 1;

--#Using the data in the ASSIGNMENT table, write the SQL code that will yield the total number of hours 
--worked for each employee and the total charges stemming from those hours worked, sorted by employee number.
-- The results of running that query are shown in Figure P7.6.
select a.emp_num,emp_lname, round(sum(assign_hours),1) as sumOfAssign_hours,round(sum(assign_charge),2) as sumOfAssign_charge
from assignment a join employee e on a.emp_num=e.emp_num
group by 1,2
order 1;

--#Write a query to produce the total number of hours and charges for each of the projects represented
--in the ASSIGNMENT table, sorted by project number. The output is shown in Figure P7.7.
select a.emp_num, emp_lname, (round(sum(assign_hours),1) as sumOfAssign_hours,round(sum(assign_charge),2) as sumOfAssign_charge
from assignment a join employee e on a.emp_num=e.emp_num
group by 1,2
order by 1;

--#Write the SQL code to generate the total hours worked and the total charges made by all employees.
-- The results are shown in Figure P7.8.
select round(sum(assign_hours),1) as sumOfAssign_hours, round(sum(assign_charge),2) as sumOfAssign_charge
from assignment;

--#Write a query to count the number of invoices.
select count(*)
from invoice;

--Write a query to count the number of customers with a balance of more than $500.
select count(*)
from customer
where cus_balance>500;

--Generate a listing of all purchases made by the customers, using the output shown in Figure P7.11 as your guide.
--Sort the results by customer code, invoice number, and product description.
select i.cus_code, i.inv_number, i.inv_date, p.p_descript, i.line_units, i.line_price
from invoice i join line i on i.inv_number=i.inv_number
join product p on p.p_code=i.p_code
order by 1,2,4;

--#Using the output shown in Figure P7.12 as your guide, generate a list of customer purchases,
--including the subtotals for each of the invoice line numbers.The subtotal is a derived attribute calculated 
--by multiplying LINE_UNITS by LINE_PRICE. Sort the output by customer code, invoice number,and product description. 
--Be certain to use the column aliases as shown in the figure.
select i.cus_code, i.inv_number, p.p_descript,l.line_units as 'units bought',l.line_price as 'unit price',
round(l.line_units*l.line_price,2) as subtotal 
from invoice join line l on i.inv_number=l.inv_number
join product p on p.p_code=l.p_code
oder by 1,2,3;


--#Write a query to display the customer code, balance, and total purchases for each customer. 
--Total purchase is calculated by summing the line subtotals (as calculated in Problem 12) for each customer.
--Sort the results by customer code, and use aliases as shown in Figure P7.13.
select c.cus_code,c.cus_balance,(round(sum(l.line_units*l.line_price),2) as 'total purchases'
from invoice i join lin l on i.inv_number=l.inv_number
join customer c on c.cus_code=i.cus_code
group by 1,2
order by 1;

--#Modify the query in Problem 13 to include the number of individual product purchases made by each customer. 
--(In other words, if the customer’s invoice is based on three products, one per LINE_NUMBER, 
--you count three product purchases.Note that in the original invoice data, customer 10011 generated three invoices, 
--which contained a total of six lines, each representing a product purchase.) Your output values must match
-- those shown in Figure P7.14, sorted by customer code.
select c.cus_code, c.cus_balance, round(sum(l.line_units*l.line_price),2) as 'total purchases', count(*) as 'number of purchases'
from invoice i join line l on i.inv_number=l.inv_number
join customer c on c.cus_code=i.cus_code
group by 1,2
order 1;

--#Use a query to compute the total of all purchases, the number of purchases,and the average purchase
--amount made by each customer. Your output values must match those shown in Figure P7.15. Sort the results by customer code.
select c.cus_code, cus_balance, round(sum(l.line_units*l.line_price),2) as 'total purchases', count(*) as 'number of purchases',
round(avg(l.line_units*l.line_price),2) as 'average purchase amount'
from invoice i join line l on i.inv_number 
join customer c on c.cus_code=i.cus_code
group by 1,2
order by 1;

--Create a query to produce the total purchase per invoice, generating the results shown in Figure P7.16, sorted by 
--invoice number. The invoice total is the sum of the product purchases in the LINE that corresponds to the INVOICE.
select inv_number, round(sum(line_units*line_price),2) as 'invoice total'
from line
group by 1
order by 1;

--#Use a query to show the invoices and invoice totals in Figure P7.17.
-- Sort the results by customer code and then by invoice number.
select i.cus_code. l.inv_num, round(sum(l.line_units*l.line_price),2)as 'invoice total'
from line l join invoice i on l.inv_number=l.inv_nunber
group by 1,2
order by 1,2;

--Write a query to produce the number of invoices and the total purchase amounts by customer,using the output shown 
--in Figure P7.18 as your guide. Note the results are sorted by customer code. (Compare this summary to the results shown in Problem 17.)
select i.cus_code,count(distinct l.inv_number)as 'number of invoice', round(sum(l.line_units*l.line_price),2) as 'total customer purchases'
from line l join invoice i on l.inv_number=l.number
group by 1
order by 1;

--#Write a query to generate the total number of invoices, the invoice total for all of the invoices, the smallest of the
-- customer purchase amounts, the largest of the customer purchase amounts,and the average of all the customer purchase
-- amounts. Your output must match Figure P7.19.
select sum(number_invoices) as 'total invoice', round(sum(total_purchase),2) as 'total sales', min(total_purchases) as 
'minimum customer purchases', max(total_purchase)as'largest customer purchas', round(avg(total_purchases),2) as 'average
cusomer purchase'
from
(select i.cus_code as cus_code, count(distinct i.inv_number)as number_invoices, round(sum(l.line_units*l.line_price),
2) as total_purchases
from line l join invoice i on i.inv_number=i.inv_number
group by 1)a;

--#List the balances of customers who have made purchases during the current invoice cycle—that is, 
--for the customers who appear in the INVOICE table. Sort the results by customer code, as shown in Figure P7.20.
select distinct i.cus_code, c.cus_balance
from customer c inner join invoice i on c.cus_code=i.cus_code
order by 1;

--#Provide a summary of customer balance characteristics for customers who made purchases. 
--Include the minimum balance, maximum balance, and average balance, as shown in Figure P7.21.
select min(cus_balance) as 'minimum balance', max(cus_balance) as 'maximum balance', round(avg(cus_balance),2) as 'average balance'
from customer c inner join invoice i on cus_code=i.cus_code;

--#Create a query to find the balance characteristics for all customers, including the total of the outstanding balances.
--The results of this query are shown in Figure P7.22.
select sum(cus_balance) as 'total balance', min(cus_balance) as 'min balance', max(cus_balance) as 'maximum balance',
round(avg(cus_balance),2) as 'average balance'
from cusomers;

--Find the listing of customers who did not make purchases during the invoicing period. Sort the results by customer code.
--Your output must match the output shown in Figure P7.23.
select cus_code, cus_balance
from customer
where cus_code NOT IN(select cus_code
from inovice)
order by 1;

--#Find the customer balance summary for all customers who have not made purchases during the current invoicing period
--The results are shown in Figure P7.24.
select sum(cus_balance) as 'total balance', min(cus_balance) as 'minimum balance', max(cus_balance) as'maximum balance',
round(avg(cus_balance),2) as 'average balance'
from customer
where cus_code NOT IN (select cus_code
from invoice);

--Create a query that summarizes the value of products currently in inventory. 
--#Note that the value of each product is a result of multiplying the units currently in inventory by the unit price. 
--Sort the results in descending order by subtotal, as shown in Figure P7.25.
select p_descript, p_qoh, p_price,(p_qoh*p_price)as 'subtotal'
from product
order by 4 desc;

--#Find the total value of the product inventory. The results are shown in Figure P7.26.
select sum(p_qoh*p_price) as 'total value of inventory'
from product;
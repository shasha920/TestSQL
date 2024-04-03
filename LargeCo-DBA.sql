--#Write a query to display the eight departments in the LGDEPARTMENT table sorted by department name.
select *
from lgdepartment 
order by dept_name;

--#Write a query to display the SKU (stock keeping unit), description, type, base, category,
--and price for all products that have a PROD_BASE of Water and a PROD_CATEGORY of Sealer (Figure P7.28).
select prod_sku, prod_descript, prod_type, prod_base, prod_category, prod_price
from lgproduct
where prod_base='water' and prod_category='sealer';

--#Write a query to display the first name, last name, and email address of employees hired from May 1, 2011,
--to December 31, 2012. Sort the output by last name and then by first name (partial results shown in Figure P7.29).
select emp_fname, emp_lname, emp_email
from lgemployee
where emp_hiredate between'2005-01-01' and '2014-12-31'
order by 2,1;

--Write a query to display the first name, last name, phone number, title, and department number of employees who work in
--department 300 or have the title “CLERK I.” Sort the output by last name and then by first name (partial results shown in Figure P7.30).
select emp_fname, emp_lname,emp_phone, emp_title, dept_num
from lgemployee
where dept_num=300 or emp_title='clerk I'
order by 2,1;

--#Write a query to display the employee number, last name, first name, salary “from” date, salary end date, 
--#and salary amount for employees 83731, 83745, and 84039. Sort the output by employee number and salary “from” date (Figure P7.31).
select emp_num, emp_lname, emp_fname, sal_from, sal_end, sal_amount
from lgemployee emp join lgsalary_history sal on emp.emp_num=sal.emp_num
where emp.emp_num in (83731, 83745,  84039)
order by emp.emp_num, sal_from;

--#Write a query to display the first name, last name, street, city, state, and zip code of any customer who purchased a
--Foresters Best brand top coat between July 15, 2021, and July 31, 2021. If a customer purchased more than one such
--product,#display the customer’s information only once in the output. Sort the output by state, last name, and then first name (Figure P7.32).
select distinct cust_fname, cust_lanme, cust_street, cust_city, cust_state, cust_zip
from lgcustomer c join lginvoice i
on c.cust_code=i.cust_code
join lgline l 
on i.inv_num=l.inv_num
join lgprodcut p 
on p.prod_sku=l.prod_sku
join lgbrand b
on p.brand_id=b.brand_id
where i.inv_date between '2021-07-15' and '2021-07-31'
and b.brand_name ='foresters best'
and p.prod_category='top coat'
order by cust_state, cust_lname,cust_fname;

--#Write a query to display the employee number, last name, email address, title, 
--and department name of each employee whose job title ends in the word “ASSOCIATE.” Sort the output by department name, 
--employee title, and employee number (Partial result shown in Figure P7.33).
select emp_num, emp_lname, emp_email, emp_title, dept_name
from lgempoyee e join lgdepartment d
on e.dept_num=d.dept_num
where emp_title like '%ASSOCIATE'
order by 5,4,1;

--#Write a query to display a brand name and the number of products of that brand that are in the database. 
--Sort the output by the brand name (Figure P7.34).
select b.brand_name, count(p.prod_sku) as numproducts
from lgbrand b inner join lgproduct p
on b.brand_id=p.brand_id
group by 1
order by 1;

--#Write a query to display the number of products in each category that have a water base,
--sorted by category (Figure P7.35).
select prod_category, count(*)as numproducts
from lgproduct
where prod_base='water'
group by 1
order by 1;

--Write a query to display the number of products within each base and type combination,
--sorted by base and then by type (Figure P7.36).
select prod_base,prod_type, count(*) as numproducts
from lgproduct
group by 1,2
order by 1,2;

--#Write a query to display the total inventory—that is, the sum of all products 
--on hand for each brand ID. Sort the output by brand ID in descending order (Figure P7.37).
select brand_id,sum(prod_qoh)as totalInventory
from lgproduct
group by 1
order by 1 desc;

--#Write a query to display the brand ID, brand name, and average price of products of each brand. 
--Sort the output by brand name.Results are shown with the average price rounded to two decimal places (Figure P7.38).
select brand_id, brand_name, round(avg(prod_price),2) as avgprice
from lgproduct p join lgbrand b
on b.brand_id=b.brand_id
group by 1,2
order by 2;

--=#Write a query to display the department number and most recent employee hire date for each department.
--#Sort the output by department number (Figure P7.39).
select dept_nme, max(emp_hiredate)as mostrecent
from lgemployee
group by 1
order by 1;

--#Write a query to display the employee number, first name, last name, and largest salary amount for each employee 
--in department 200. Sort the output by largest salary in descending order, and then by employee number (Partial results shown in Figure P7.40).
select emp_num, emp_fname, emp_lname, max(sal_amount) as largestsalary
from lgemployee e join lgsalary_history s
on e.emp_num=s.emp_num
where dept_num=200
group by 1,2,3
order by 4 desc, 1;

--Write a query to display the customer code, first name, last name, and sum of all invoice totals for customers 
--with cumulative invoice totals greater than $1,500. 
--Sort the output by the sum of invoice totals in descending order (Partial results shown in Figure P7.41).
select c.cust_code, cust_fname, cust_lname, sum(inv_total) as totalinvoices
from lgcustomer c join lginvoice i
on c.cust_code=i.cust_code
group by 1,2,3
having sum(inv_total)>1500
order by 4 desc,1;

--#Write a query to display the department number, department name,department phone number, employee number,
--and last name of each department manager. Sort the output by department name (Figure P7.42).
select d.dept_num, dept_name, dept_phone, d.emp_num, emp_lname
from lgemployee e inner join lgdepartment d
on e.emp_num=d.emp_num
order by 2;

--#Write a query to display the vendor ID, vendor name, brand name, and number of products of each brand supplied by each 
--vendor.Sort the output by vendor name and then by brand name (Partial results shown in Figure P7.43).
select v.vend_id, vend_name,brand_name, count(p.prod_sku)as numproducts
from lgbrand b join lgproduct p 
on b.brand_id=p.brand_id
join lgsupplies s
on p.prod_sku=s.prod_sku
join lgvendor v on s.vend_id=v.vend_id
group by v.vend_id, vend_name, brand_name
order by 2,3;

--#Write a query to display the employee number, last name, first name, and sum of invoice totals for all employees who 
--completed an invoice. Sort the output by employee last name and then by first name (Partial results shown in Figure P7.44).
select emp_num, emp_lname, emp_fname, sum(inv_total) as totalInvoice
from lginvoice i join lgemployee e
on e.emp_num=i.emp_id
group by 1,2,3
order by 2,3;


--#Write a query to display the largest average product price of any brand (Figure P7.45).
select max(price) as 'largest average'
from 
(select brand_id, round(avg(prod_price),2) as price
from lgproduct
group by brand_id)a;

--#Write a query to display the brand ID, brand name, brand type, 
--and average price of products for the brand that has the largest average product price (Figure P7.46).
select p.brand_id, brand_name, brand_type, round(avg(p.prod_price),2)as avePrice
from lgproduct p join lgbrand b 
on b.brand_id=p.brand_id
group by 1,2,3
having round(avg(p.prod_price),2)=
(select max(price) as 'largest average'
from 
(select brand_id, round(avg(prod_price),2)as price
from lgproduct
group by brand_id)a);

--#Write a query to display the manager name, department name, department phone number, employee name,
--customer name, invoice date, #and invoice total for the department manager of the employee who made a sale to a 
--customer whose last name is Hagan on May 18, 2021 (Figure P7.47).
select c1.emp_fname, c1.emp_lname, dept_name, dept_phone, e.emp_fname, e.emp_lname, cust_fname, cust_lname, inv_date, 
inv_total
from lgcustomer c join lginvoice i
on c.cust_code=i.cust_code
join lgemployee e 
on i.employee_id=e.emp_num
join lgdepartment d
on d.dept_num=e.dept_num
join lgemployee c1
on c1.emp_num=d.emp_num
where i.inv_date='2021-5-18' and cust_lname='HAGAN';


--#Write a query to display the current salary for each employee in department 300. Assume that only current employees
--are kept in the system,and therefore the most current salary for each employee is the entry in the salary history 
--with a NULL end date. 
select e.emp_num, emp_lname, emp_fname, sal_amount
from lgemployee e join lgsalaray_history h
on e.emp_num=h.emp_num
where sal_end is null and dept_num=300
order by 4 desc;

--#Write a query to display the starting salary for each employee. The starting salary would be the entry in the salary
--history with the oldest salary start date for each employee. Sort the output by employee number (Figure P7.49).
select e.emp_num,emp_lname, emp_fname, sal_amount
from lgemployee e join lgsalaray_history h
on e.emp_num=h.emp_num
where sal_from=
(select min(sal_from)
from lgsalary_history
where emp_num=e.emp_num)
order by 1;

--#Write a query to display the invoice number, line numbers, product SKUs, product descriptions, 
--and brand ID for sales of sealer and top coat products of the same brand on the same invoice. 
--#Sort the results by invoice number in ascending order, first line number in ascending order, 
--#and then by second line number in descending order (Figure P7.50).
select a1.inv_num, a1.line_num, b1.prod_sku, b1.prod_descript, a2.line_num, b2.prod_sku, b2.prod_descript, b1.brand_id
from
(lgline a1 join lgproduct b1
on a1.prod_sku=b1.prod_sku)
join 
(lgline a2 join lgproduct b2
on b2.prod_sku=a2.prod_sku)
on a1.inv_num=a2.inv_num
where b1.prod_category='sealer' and b2.product_category='top coat' and b1.brand_id=b2.brand_id
order by 1,2,a2.line_num desc;


--#The Binder Prime Company wants to recognize the employee who sold the most of its products during a specified period.
--#Write a query to display the employee number, employee first name, employee last name, email address, 
--#and total units sold for the employee who sold the most Binder Prime brand products between November 1, 2021, 
--#and December 5, 2021. If there is a tie for most units sold, sort the output by employee last name (Figure P7.51).
select e.emp_num, emp_fname, emp_lname, emp_email. total
from lgemployee e join
(select employee_id, sum(line_qty) as total
from lginvoice i
join lgline l
on l.inv_num=i.inv_num
join lgproduct p
on p.prod_sku=l.prod_sku
join lgbrand b
on b.brand_id=p.brand_id
where b.brand_name ='BINDER PRIME'
and inv_date between '2021-11-01' and '2021-12-05'
group by 1)a
on e.emp_num=employee_id
where total=
(select max(total)
from(select employee_id,
sum(line_qty) as total
from lginvoice i 
join lgline l
on l.inv_num=i.inv_num
join lgproduct p
on p.prod_sku=l.prod_sku
join lgbrand b
on b.brand_id=p.brand_id
where b.brand_name='BINDER PRIME'
and inv_date between '2021-11-01' and '2021-12-05'
group by employee_id)b)
order by 3;

--#Write a query to display the customer code, first name, and last name of all customers who have had at least one
--invoice completed by employee 83649 and at least one invoice completed by employee 83677. Sort the output by customer last name
select c.cust_code, c.cust_fname,c.cust_lname
from lgcustomer c join lginvoice i on c.cust_code=i.cust_code
where employee_id=83649 and c.cust_code in 
(select cust_code
from lginvoice
where employee_id=83677)
order by cust_lname, cust_fname;

--#LargeCo is planning a new promotion in Alabama (AL) and wants to know about the largest purchases made by customers
--in that state.#Write a query to display the customer code, customer first name, last name, full address, invoice date, 
--#and invoice total of the largest purchase made by each customer in Alabama. Be certain to include any customers in
--Alabama #who have never made a purchase; their invoice dates should be NULL and the invoice totals should display as
--0.Sort the results by customer last name and then first name (Partial result are shown in Figure P7.53).
select c.cust_code,c.cust_fname, c.cust_lname,c.cust_street, c.cust_city, c.cust_state, c.cust_zip, i.inv_date,
i.inv_total as 'largest invoice'
from lgcustomer c join lginvoice i on i.cust_code=c.cust_code
where c.cust_state='AL'
and i.inv_total=
(select max(inv_total)
from lginvoice a 
where a.cust_code=c.cust_code)
union
select cust_code, cust_fname, cust_lname, cust_street, cust_city, cust_state, cust_zip,NULL,0
from lgcustomer
where cust_state='AL'
and cust_code NOT IN (select cust_code from lginvoice)
order by cust_lname, cust_fname;

--#One of the purchasing managers is interested in the impact of product prices on the sale of products of each brand. 
--#Write a query to display the brand name, brand type, average price of products of each brand, and total units sold of
--products of each brand. #Even if a product has been sold more than once, its price should only be included once in the 
--calculation of the average price.#However, you must be careful because multiple products of the same brand can have the
--same price, and each of those products must be included in the calculation of the brand’s average price. 
select brand_name, brand_type, round(avgprice,2) as 'average price', unitSold as 'units sold'
from lgbrand b
join
(select brand_id, avg(prod_price)as avgprice
from lgproduct
group by brand_id)a
on b.brand_id=a.brand_id
join 
(select brand_id,sum(line_qty) as unitSold
from lgproduct p jin lgline l on p.prod_sku=l.prod_sku
group by brand_id)c on c.brand_id=b.brand_id
order by brand_name;

--#The purchasing manager is still concerned about the impact of price on sales. Write a query to display the brand name,
--brand type, product SKU, product description, and price of any products that are not a premium brand,
--#but that cost more than the most expensive premium brand products (Figure P7.55).
select brand_name, brand_type, prod_sku, prod_descript, prod_price
from lgproduct p join lgbrand b on b.brand_id=p.brand_id
where brand_type !='PREMIUM' and prod_price>
(select max(prod_price)
from lgproduct a join lgbrand c on a.brand_id=c.brand_id
where brand_type='PREMIUM');







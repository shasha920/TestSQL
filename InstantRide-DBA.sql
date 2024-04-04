--#Drivers are essential for InstantRide, and the Driver Relationship team is responsible for their integration and 
--success.all the driver detail in the system for creating a new dashboard.You need to SELECT all available data for
--the drivers and return back to the team.
select * 
from drivers;

--#The Driver Relationship team also requests the joining dates of the drivers to create a timeline. 
--In the table, you only need to return the joining date of the drivers. 
--You need to only return the DRIVER_START_DATE column inside a SELECT statement for the DRIVERS table.
select driver_start_date
from drivers;

--#The Driver Relationship team would like the DRIVER_ID and DRIVER_RATING of drivers currently
--having a rating higher than 4 in descending order.
select driver_id, driver_rating
from drivers
order by 2 desc;

select driver_id, driver_rating
from drivers
where driver_rating >4;

--#The InstantRide User Satisfaction team is a core team for InstantRide, and they focus on increasing the customer 
--satisfaction. They want to learn the travel time for each ride in the system. You need to return the USER_ID, 
--and the TRAVEL_TIME column which is calculated using the TIMEDIFF function on the TRAVEL_END_TIME and the TRAVEL_START_TIME.
--there have one function
--datediff(minute,...,...)on SQL server to replace MySQL timediff()
select user_id,  DATEDIFF(minute, travel_start_time, travel_end_time) AS travel_time
from travels;

--#User Satisfaction team wants to send monthly summaries for each user. They need the following details with the user ID:
--#The last day of the month when the users traveled most recently
--#One week after the last day of the month when the users traveled most recently
--#You need to return a three-column output with USER_ID, LAST_TRAVEL_MONTH and NOTIFICATION.
--#LAST_TRAVEL_MONTH should be calculated using the MAX of the LAST_DAY of the TRAVEL_END_TIME field. 
--#Similarly, NOTIFICATION should be calculated with DATE_ADD function to add one week.
--there have two function
--eomonth() in SQL server to replace last_day()in MySQL
--dateadd() in SQL server to replace date_add()in MySQL
select user_id, max(eomonth(travle_end_time))as last_travel_month, max(dateadd(week,1,eomonth(travel_end_time)))
as notification
from travels
group by 1;

--#The Marketing team of InstantRide wants to know that how many discounts have been offered for each ride. 
--#You need to calculate this information for each travel where a discount is applied and return two columns:
--#TRAVEL_ID and DISCOUNT_AMOUNT. In addition, you need to return the calculation as a money value using the ROUND function to 2 decimals.
select travel_id, round(travel_price*travel_discount,2) as discount_amount
from travels
where travle_discount is not null;

--The InstantRide received some traffic violation tickets from the government. 
--#The Legal team of InstantRide requires the travel information of the respective drivers along with corresponding Driving License IDs to proceed further.
--#In addition, the team wants to include the drivers without travel information in the system yet for the completion of driver list. Therefore, 
--#you need to return DRIVER_FIRST_NAME, DRIVER_LAST_NAME, DRIVER_DRIVING_LICENSE_ID, TRAVEL_START_TIME, 
--#TRAVEL_END_TIME information from the DRIVERS and TRAVELS data connected by LEFT JOIN.
select d.driver_first_name, d.driver_last_name, d.driver_driving_license_id, t.travel_start_time,t.travle_end_time
from drivers d left join travels t on d.driver_id=t.driver_id;

--#The InstantRide Management team considers setting up a Lost & Found inventory. In order to start the setup, 
--#the team requires the detail of users with their travel start and end times. 
--#The team wants to track potential list of users who may have forgotten their items on the cars.
--Therefore, you need to return USER_FIRST_NAME, USER_LAST_NAME, TRAVEL_START_TIME, TRAVEL_END_TIME information from the
--USERS and TRAVELS tables connected inside a JOIN statement by the USING function and USER_ID field.
select user_first_name, user_last_name,travel_start_time, travle_end_time
from users u join travles t using(user_id);

--#The InstantRide Finance team wants to collect the price and discount information with the driver names for each travel
--in the system.You need to return the TRAVEL_ID, DRIVER_FIRST_NAME, DRIVER_LAST_NAME, TRAVEL_PRICE, and TRAVEL_DISCOUNT 
--information #from the TRAVELS and DRIVERS tables combined over DRIVER_ID field with the ON keyword.
select t.travle_id, d.driver_first_name, d.driver_last_name, t.travel_price, t.travel_discount
from travles t join drivers d on d.driver_id =t.driver_id;



--#The InstantRide Driver Relationship team wants to create groups for drivers according to their ratings such as 3+ or
--4+. For instance, a driver with the rating 3.8 will be 3+; whereas a driver with the rating 4.2 will be 4+.You need to
--return a two column output with DRIVER_ID and DRIVER_RATING which has first FLOOR applied and then CONCAT with + 
--sign for all drivers with a rating greater than 0.
--there have two functions
--floor()
--concat()
select driver_id, concat(floor(driver_rating),'+') as driver_rating
from drivers
where driver_rating>0;

--#The InstantRide User Satisfaction team are looking forward to creating discounts for the users. 
--#However, the team suspects that there could be duplicate users in the system with different emails. 
--Check for the users with their names and surnames for potential duplicates. Therefore, #you need to JOIN the
--USERS table with USERS table and compare for equality of USER_FIRST_NAME and USER_LAST_NAME and inequality in
--USER_ID fields.
--there is for test self join
select *
from users a join users b on a.user_first_name=b.user_first_name and a.user_last_name=b.user_last_name and
a.user_id!=b.user_id;


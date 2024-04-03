--# The Channel development team requires all data available about the channels for their new dashboard team. 
--#Run the following query to get the all channel information
SELECT *
FROM channel;

--#Channel Development team requires the following information for their weekly-channel presentation:
--#list of all channel names,
--#channel names ordered by commission in starting with the highest commission rate,
--#channel names which have commission rates higher than 10%
select channelName
from channel;

select channelName, channelCommission
from channel
order by channelCommission desc;

select channelName, channelCommission
from channel
where channelCommission>0.1;

--# team requires the actual prices for the stays in the system. 
--#Calculate the actual price using the price and discount amount from the corresponding tables. 
--#Run the following query to get the actual price data
select stayid, stayprice * (1-staydiscount) as 'actual price'
from stay;

--# team indicates that the retrieved data is not suitable for making payments as currency. 
--#You need to round up the actual prices to have only 2 decimals
select stayid, round(stayprice*(1-staydiscount),2) as 'actual price'
from stay;

--#The InstantStay Owner Relationships team wants to send thank you notes to the owners
--#joined in the last year and still in the InstantStay system. Collect all owners joined in the last year 
--#and did not leave the system yet
--there have two important function
--date_add() which means add the specified interval to a date value
--curdate() which means current date, interval-1 year which means minus 1 year, you can use month or day
select *
from owner
where (ownerJoinDate>=date_add(curdate(),interval-1 year)) and ownerenddate is null;

--#The InstantStay Owner Relationships team wants to send reminders to the owners that left the system. 
--#Collect the email address of the owners, notification date as one week later of their leave 
--#and last day of the month for financial closure
--there have one important function
--last_day() which means last day of month
select owneremail, date_add(ownerendate, interval 1 week)as notificationdate, last_day(ownerenddate) as fiancialclsure
from owner
where ownerenddate is NOT NULL;

--#The local authorities require all the guest information, 
--#such as their first and last name and their stay start and end dates, 
--#without checking the existence of reservation data
select guestfirstname, guestlastname,s.staystartdate, s.stayenddate
from guest g left join stay s on s.guestid=g.guestid;

--#The InstantStay Legal team requires all house owners first and 
--#last names along with their house ids and addresses. 
--#Collect the information from HOUSE and OWNER tables and return in a consolidated way
select ownerfirstname, ownerlastname,houseid,houseaddress, housecity, housezipcode,housestate
from house join owner using(ownerid);

--#The InstantStay Finance team wants to collect all Stay IDs with the price, 
--#discount and channel commission rate
select stayid, stayprice, staydiscount, channelcommision
from stay s join channel c on s.channelid=c.channelid;

--#In a case wherein guests are canceling the reservations or altering their stay days, the respective reimbursements 
--and cancellations payments are reflected with negative prices in the reservation tables.The InstantStay Finance team
--requires the list of Stay IDs, GuestIDs, and the positive dollar amount rounded up to the nearest whole number
--there have two function
--one is ceil() means smallest interger greater than particular number, conversely, floor() means largest interger
--less than particular number
--abs() return positive value
select stayid, guestid, ceil(abs(stayprice)) as stayprice
from stay
wherestayprice<0

--#During the guest user analysis, developers realized 
--#there could be duplicate users in the system. Check for the guests with the same name 
--but different GuestIDs to check whether they are duplicate or not
select * 
from guest g join guest h on g.guestfirstname=h.guestfirstname 
and g.guestlastname=h.guestlastname
and g.guestid!=h.guestid;

--#The InstantStay Finance team require all the available information about 
--the reservations where the commission rate of the channel is higher than 10%
select *
from stay
where channelid in(select channelid
from channel
where channelcommision>0.1)

--#The InstantStay Finance team requires average price per stay rounded to two decimal places for all the houses in the 
--system.#However, ensure that you do not include the cancelled stays with negative payment information
select houseid, round(avg(stayprice*(1-staydisctount),2) as payment
from stay
where stayprice>0
group by houseid;

--#The InstantStay Marketing team wants to learn the apartment that have more than average number of stays. 
--Use the following script
select houseid, count(stayid)as stays
from stay
group by houseid
having count(stayid)>(select avg(s.stays)
from(select count(stayid) as stays
from stay
group by houseid)as s);

--#The Marketing team wants to get all the houses in the system which are larger than the average in size.
--#For the calculation, you will compare against the AVG of HouseSquareMeter for all the houses in InstantStay.
select *
from house
where housesquremeter>=(select avg(housesquremeter)
from house);

--#The Marketing team wants to get the name and email information for all the guests which have been registered
--#into the system so far though not stayed in any property yet. 
--#The team is planning to use the collected information to fill the email templates with first name, 
--#last name and email fields and then send the reminder emails
select g.guestfirstname, g.guestlastname, g.guestemail
from guest g
where g.guestid !=all(select distinct s.guestid
from stay s);

--#The InstantStay Legal team wants to send new General Data Protection Regulation (GDPR) emails 
--#who are registered in the system. Collect email information for all owners and guests
select owneremail
from owner
union 
select guestemail
from guest;

--#The InstantStay House Development team works on the houses and the coverage of InstantStay over the world. 
--#They require a detailed analysis on the count of houses in the InstantStay. 
--#To start with, they require the count of houses based in each state in a descending order
select housestate, count(houseid)
from house
group by housestate
order by count(houseid) desc;


--#In addition, House Development team wants the same information 
--(as mentioned in the Task 1) along with the city, state level details
select housestate, housecity, count(houseid)
from house
group by housestate, housecity
order by count(houseid) desc;

--#The House Development team considers that having a limited availability of houses in a state could be risky and less
--beneficial for the business. #For Example, The InstantStay will be unable to process the reservation requests if the 
--request count is higher than #count of registered houses in the state currently available to rent out. Therefore to 
--take further steps to work on such issues, the team requires to know all the states having less than 2 properties registered in the system
select count(houseid), housestate
from house
group by housestate
having count(houseid)<2
order by count(houseid) desc;

--#The House Development team also requires to calculate the total number of rooms available in each state
select housestate, sum(housenumberofrooms)as totalavailabitlity
from house
group by housestate;


--#In addition, the House Development team wants to know the largest and average house in terms of number
--of rooms for each state
--there have two function
--max()maximum, min() minumum
--avg() mean
select housestate, max(housenumberofrooms)as largesthouse, avg(housenumberofrooms)as averagehouse
from house
group by housestate;

--#The InstantStay Marketing team is planning to create some maps to show the coverage of InstantStay 
--throughout the country. #Therefore, they need some specific information such as distinct ZIP codes of all houses and
--distinct list of cities in two separate tables
select distinct housezipcode
from house;

select distinct housecity
from house;

--#In addition,the InstantStay Marketing team wants to create a word cloud from the cities of the houses. 
--#They want to learn the number of characters in the longest city
--there have one function
--length() character's length, for example longest number of characters--max(length())
select max(length(housecity))
from house;

--#The InstantStay Owner Relationships team focus on the success of InstantStay by creating strong connection to the 
--owners. #They want to send celebration mails to the owners on their joining date in the system.
--#They need the combined details which includes name and surname of the owners with their email addresses. 
--#In addition, they are planning to make this as practice for every year. 
--#The team requires the day and month of owners joining date to send emails on exact dates every year
--there have two functions
--concat()combine two sentence, two columns
--month(),day(), year()
select concat(ownerefirstname,concat(' ', ownerlastname))as name, owneremail, month(ownerjoindate)as month, 
day(ownerjoindate) as day
from owner;

--#The team wants to create a specialized carpets to the houses with the initials of owners. 
--#They wanted to get the uppercase first letter of firstname and surname of the owners
--there have two functions
--upper() uppercase, conversely, lower()
--substring(string,start, length), length include empty
select upper(substring(ownerfirstname,1,1)) as initial_1, upper(substring(ownerlastname,1,1))asinitial_2
from owner;
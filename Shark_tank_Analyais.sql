use Project1
select * from shark_tank

--- Brand who has applied
---Ans 98
select count(distinct(brand)) as unique_brand from Shark_tank


---Ques Brand who actually got funding
--- Ans 57

select cast(count(*) as float) as total_count,cast(sum(a.converted_non_converted) as float) as Recevied_Funding
from
(select [Amount invested lakhs] , case when [Amount invested lakhs]>0 then 1 else 0 end
 as converted_non_converted from Shark_tank) a

---Ques what is the sucess percent
---Ans 58.1632

select cast(sum(a.converted_non_converted)/cast(count(*) as float) as float) *100 as Success_Percent
from
(select [Amount invested lakhs] , case when [Amount invested lakhs]>0 then 1 else 0 end
 as converted_non_converted from Shark_tank) a

 --- Ques what are total number of male participant
 --- Ans 139

 select * from Shark_tank

 select sum(Male) as Total_male from Shark_tank

 --- Ques what are total number of female participant
 --- Ans 59

 select sum(female) as total_female from Shark_tank

 --- Calculate the gender ratio 
 --- Ans 42%

 select sum(female)/Sum(male)*100 as gender_ratio from shark_tank

 --- ques total amount invested in the show
 ---Ans 3422
 select * from Shark_tank

 select sum([amount invested lakhs]) as total_amount_invested from shark_tank

 --- ques what is the average equity taken by the shark
 select avg(a.[equity taken %]) from 
(
 select * from shark_tank
 where [Equity Taken %]>0) a

 --- ques what is the highest deal done in the show

 select *from Shark_tank

select max([amount invested lakhs]) as max_amount_invested from shark_tank

--- Ques highest equity taken by the sharks

select max([equity taken %]) as Max_Equity_taken from shark_tank

-- ques find out the number of pitches where there is atleast one women in them
select sum(a.total_pitches) from(
select female,case when female>0 then 1 else 0 end as total_pitches from shark_tank )a

--- ques pitches converted which are having atleast one women in them
select * from Shark_tank

select sum(b.total_count) from(
select case when a.female>0 then 1 else 0 end as total_count,a.* from (
select * from shark_tank
where deal<>'No Deal')a )b

--- Ques what is the most age group where max entpreure came from

select [avg age],sum([Team members]) as total_count from Shark_tank
group by [avg age]
order by total_count desc

--- Partner deal

select partners, count(partners) from Shark_tank
group by partners
order by count(partners) desc


/* create a matrix with following details

        Amount_invested   Avg_Equity_taken  Total_episodes total_Deals
Ashneer 
Anupam
Aman
Peyush
Ghazal
Vineeta
Namita

*/

select * from Shark_tank
--lets take in how many episodes Ashneer was present -- Ans 79
-- total number of deal in which he has invested
select 'Ashneer' as shark,count([Ashneer Amount Invested]) from Shark_tank
where [Ashneer Amount Invested] is not null

select 'Ashneer' as shark,count([Ashneer Amount Invested]) from Shark_tank
where [Ashneer Amount Invested] is not null and  [Ashneer Amount Invested]<>0

--- lets calculated total amount invested,

select 'Ashneer' as Shark,sum(a.[Ashneer Amount Invested]) as total_amount_invested,avg(a.[Equity taken %]) as average_Equity_taken
from (
select * from shark_tank
where [Ashneer Amount Invested]!=0 and [Ashneer Amount Invested] is not null)a




select b.shark,b.total_deals_present,c.total_deals from
(
select 'Ashneer' as shark,count([Ashneer Amount Invested]) as total_deals_present from Shark_tank
where [Ashneer Amount Invested] is not null)b       ---- Ashneer was present

inner join 
(
select 'Ashneer' as shark,count([Ashneer Amount Invested]) as total_deals from Shark_tank
where [Ashneer Amount Invested] is not null and  [Ashneer Amount Invested]<>0 )c    --Deals he did

on b.shark =c.shark




--- now lets combine it for the  all together   for all shark 

select m.shark,m.total_deals_present,m.total_deals,n.total_amount_invested,n.average_Equity_taken
from(

(select b.shark,b.total_deals_present,c.total_deals from

(select 'Ashneer' as shark,count([Ashneer Amount Invested]) as total_deals_present from Shark_tank
where [Ashneer Amount Invested] is not null)b       ---- Ashneer was present

inner join 
(
select 'Ashneer' as shark,count([Ashneer Amount Invested]) as total_deals from Shark_tank
where [Ashneer Amount Invested] is not null and  [Ashneer Amount Invested]<>0 )c    --Deals he did

on b.shark =c.shark)m

inner join
(

select 'Ashneer' as Shark,sum(a.[Ashneer Amount Invested]) as total_amount_invested,avg(a.[Equity taken %]) as average_Equity_taken
from (
select * from shark_tank
where [Ashneer Amount Invested]!=0 and [Ashneer Amount Invested] is not null)a)
n

on m.shark=n.shark) 

Union


 
 --- for namita
 select m.shark,m.total_deals_present,m.total_deals,n.total_amount_invested,n.average_Equity_taken
from
(

(select b.shark,b.total_deals_present,c.total_deals from

(select 'Namita' as shark,count([Namita Amount Invested]) as total_deals_present from Shark_tank
where [Namita Amount Invested] is not null)b       ---- Ashneer was present

inner join 
(
select 'Namita' as shark,count([Namita Amount Invested]) as total_deals from Shark_tank
where [Namita Amount Invested] is not null and  [Namita Amount Invested]<>0 )c    --Deals he did

on b.shark =c.shark)m

inner join
(

select 'Namita' as Shark,sum(a.[Namita Amount Invested]) as total_amount_invested,avg(a.[Equity taken %]) as average_Equity_taken
from (
select * from shark_tank
where [Namita Amount Invested]!=0 and [Namita Amount Invested] is not null)a)
n

on m.shark=n.shark)


 
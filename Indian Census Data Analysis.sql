
-- view the data from both table

select *from dataset2;
select *from dataset1;

-- number of rows in our dataset

select count(*) from dataset1;
select count(*) from dataset2;

-- dataset for a particular state
-- i looked for Bihar and Jharkhand

select *from dataset1 where state in('Bihar','Jharkhand');

-- population of India

select sum(population) as Population from dataset2;

-- avg growth

select avg(growth) avg_growth from dataset1;

-- avarage growth rate of population group by state

select State, round(avg(growth),2) avg_growth_percent from dataset1 group by State order by avg_growth_percent asc;

-- avg sex ratio

select state, round(avg(sex_ratio),2) as avg_sex_ratio from dataset1 group by state order by avg_sex_ratio desc;

-- avarage literacy ratio

select state, round(avg(literacy),2) as avg_literacy from dataset1 group by state
having round(avg(literacy),2)>75 order by avg_literacy desc;

-- Top 5 states having highest literacy rates

select state, round(avg(literacy),2) as avg_literacy from dataset1 group by state
 order by avg_literacy desc limit 5;
 
 -- Bottom 5 states having lowest literacy rates
 
 select state, round(avg(literacy),2) as avg_literacy from dataset1 group by state
 order by avg_literacy asc limit 5;
 
 -- TEMPORARY TABLE
 -- Top 3 states with highest and lowest litracy rates
 
 drop table if exists topstates;
 create temporary table topstates(
 state varchar(255),
 avg_literacy float); 
 
 -- insert data into temporary table using select subquery
 
 insert into topstates (state, avg_literacy)
 select state, round(avg(literacy),2) as avg_literacy from dataset1 group by state
 order by avg_literacy desc;
 
 select *from topstates order by avg_literacy desc limit 5;
 
 drop table if exists bottomstates;
 create temporary table bottomstates(
 state varchar(255),
 avg_literacy float
 );
 
insert into bottomstates (
 select state, round(avg(literacy),2) as avg_literacy from dataset1 group by state
 order by avg_literacy desc
 );
 select *from bottomstates order by avg_literacy limit 5;
 
 
 
 
 select *from (select *from topstates order by topstate desc limit 5) as top_states
 UNION 
 select *from (select *from bottomstates order by bottomstate asc limit 5) as bottom_states;


select distinct state from dataset1 where state like 'a%' or state like '%d' order by state;






/*
select * from nit.Da_classes

Select * from nit.Day_Type

Select distinct Day_Type from  nit.Da_classes

*/

-- Evaluate or Review the Classes held in October 2024. 
select distinct DATE_FORMAT(DA.Date,'%M-%y') as Calender_Month,Count(*) over() as Total_Days,
	DT.Day_Type_Description as Day_Types,COUNT(*) OVER (PARTITION BY DA.Day_Type) AS Breakup_Count
 from nit.da_classes DA
inner join nit.Day_Type DT on DA.Day_Type = DT.Day_Type
where DA.Date between '2024-10-01' and '2024-10-31'
order by BreakUp_Count;


-- Evaluate or Review the Classes held in November 2024. 
select distinct DATE_FORMAT(DA.Date,'%M - %y') as Calender_Month,Count(*) over() as Total_Days,
	DT.Day_Type_Description as Day_Types,COUNT(*) OVER (PARTITION BY DA.Day_Type) AS BreakUp_Count
 from nit.da_classes DA
inner join nit.Day_Type DT on DA.Day_Type = DT.Day_Type
where DA.Date between '2024-11-01' and '2024-11-30'
order by BreakUp_Count;

-- Evaluate or Review the Classes held in December 2024. 
select distinct  DATE_FORMAT(DA.Date,'%M - %y') as Calender_Month,Count(*) over() as Total_Days,
	DT.Day_Type_Description as Day_Types,COUNT(*) OVER (PARTITION BY DA.Day_Type) AS Breakup_Count
 from nit.da_classes DA
inner join nit.Day_Type DT on DA.Day_Type = DT.Day_Type
where DA.Date between '2024-12-01' and '2024-12-31'
order by BreakUp_Count;

-- Evaluate or Review the Classes held in January 2025. 
select distinct DATE_FORMAT(DA.Date,'%M-%y') as Calender_Month,Count(*) over() as Total_Days,
	DT.Day_Type_Description as Day_Types,COUNT(*) OVER (PARTITION BY DA.Day_Type) AS Breakup_Count
 from nit.da_classes DA
inner join nit.Day_Type DT on DA.Day_Type = DT.Day_Type
where DA.Date between '2025-01-01' and '2025-01-31'
order by BreakUp_Count;

-- Evaluate or Review the Classes held in Feb 2025. 
select distinct DATE_FORMAT(DA.Date,'%M-%y') as Calender_Month,Count(*) over() as Total_Days,
	DT.Day_Type_Description as Day_Types,COUNT(*) OVER (PARTITION BY DA.Day_Type) AS Breakup_Count
 from nit.da_classes DA
inner join nit.Day_Type DT on DA.Day_Type = DT.Day_Type
where DA.Date between '2025-02-01' and '2025-02-28'
order by BreakUp_Count;

-- Review/Evaluate the Classes from Oct 16 2024 to 11 Feb 2025
select distinct Count(*) over() as Total_Class_Duration,
	DATE_FORMAT(DA.Date,'%M-%y') as Calender_Month,
	COUNT(*) OVER (PARTITION BY DATE_FORMAT(DA.Date,'%M-%y')) AS Days,
	DT.Day_Type_Description as Day_Types,COUNT(*) OVER (PARTITION BY DATE_FORMAT(DA.Date,'%M-%y'),DA.Day_Type) AS Breakup_Count
 from nit.da_classes DA
inner join nit.Day_Type DT on DA.Day_Type = DT.Day_Type
order by STR_TO_DATE(CONCAT('01-', Calender_Month), '%d-%M-%y'),BreakUp_Count;

-- Summarize the classes Based on No Days and Day Types
select distinct Total_Days as Tot_Class_Duration,Day_Type,Day_Type_Count,
	round((Day_Type_Count/Total_Days)*100,2) as Day_Type_Percentage
 from
(
	select Count(*) over() as Total_Days,
		 DT.Day_Type_Description as Day_Type,
		 COUNT(*) OVER (PARTITION BY DA.Day_Type) AS Day_Type_Count
 from nit.da_classes DA
inner join nit.Day_Type DT on DA.Day_Type = DT.Day_Type
) as TblResult
order by Day_Type_Count desc;

-- Count the Days Allocated to Each Day of the Week
select distinct count(*) over() as Tot_Class_Duration,Day, Count(*) over (Partition by DA.Day) as Day_Count
from Nit.Da_Classes DA
order by FIELD(Day, 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'); 

/*
To make the query more flexible, 

I created a stored procedure that allows us to retrieve class details based on parameters such as 
1. "From Date," 
2. "To Date," 
3. or any specific day type (e.g., W, PH, SL, WO, CT)

By Creating a SP it will enable us to pass different values for these parameters and retrieve the relevant data accordingly.

For example, if we want to view the Sick Leave details for the entire period, we can use the stored procedure to filter the data accordingly.
	CALL GetClassDetailsByParams('','','SL');

For example, if we want to view the Class details from 01-Jan-2025 wards, we can use the stored procedure to filter the data accordingly.
	CALL GetClassDetailsByParams('2025-01-01','2025-01-31','');

*/

DELIMITER //
CREATE PROCEDURE GetClassDetailsByParams
(
	IN From_Date varchar(10),
    IN To_Date varchar(10),
    In Day_Type varchar(2)
)
BEGIN
	Select row_number() over(order by Date) as Sno, Count(*) over() as Total_Days, DATE_FORMAT(DA.Date,'%d-%b-%y') as Date,
		DATE_FORMAT(DA.Date,'%a') as Day,DT.Day_Type_Description as Day_Types
	from nit.da_classes DA
	inner join nit.Day_Type DT on DA.Day_Type = DT.Day_Type
	WHERE
	Da.Date >= case From_Date  WHEN '' then Da.Date else From_Date end
	and Da.Date <= case To_Date  WHEN '' then Da.Date else To_Date end
	and Da.Day_Type = case Day_Type  WHEN '' then Da.Day_Type else Day_Type end;
END
//
DELIMITER ;

-- Get the Breakup Percentage of Classes Held and No Classes

select Count(*) over() as Total_Days,
		 DT.Day_Type_Description as Day_Type,
		 COUNT(*) OVER (PARTITION BY DA.Day_Type) AS Day_Type_Count
 from nit.da_classes DA
inner join nit.Day_Type DT on DA.Day_Type = DT.Day_Type;

-- Get the Breakup Percentage of Classes Held and No Classes using Subquery
Select row_number() over() as Sno,Total_Days,Day_Type,round(Day_Type_Count/Total_Days * 100,2) as Day_Type_Percentage
From
(
	Select distinct Count(*) over() as Total_Days,Day_Type,COUNT(*) OVER (PARTITION BY TblResult.Day_Type) AS Day_Type_Count
	from
	(
		select Day_Id, Case Day_Type when 'W' then 'Classes' when 'CT' then 'Classes' else 'No Classes' End as Day_Type 
		from nit.da_classes
	) as TblResult
)as TblFinal




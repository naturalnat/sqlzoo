--6. List the Company name and the number of calls for those companies with more than 18 calls. 

SELECT Customer.Company_name, COUNT (*) AS cc; 
FROM Customer 
JOIN Caller 
ON Customer.Company_ref = Caller.Company_ref
JOIN Issue
ON Caller.Caller_id = Issue.Caller_id
GROUP BY Customer.Company_name 
HAVING COUNT (*) > 18; --having always comes after group by 

--7. Find the callers who have never made a call. Show first name and last name
SELECT Caller.first_name, Caller.last_name 
FROM Caller
LEFT JOIN Issue --left join b/c we want null values in issue table 
ON Caller.Caller_id = Issue.Caller_id 
WHERE Issue.Caller_id IS NULL; 

--8. For each customer show: Company name, contact name, number of calls where the number of calls is fewer than 5 

with b as (
    	SELECT	*
		FROM Caller
),


a as (
        SELECT
			Customer.Company_name,
			Customer.Contact_id,
			COUNT(*) AS nc
		FROM
			Customer
			JOIN
				Caller
				ON (Customer.Company_ref = Caller.Company_ref)
			JOIN
				Issue
				ON (Caller.Caller_id = Issue.Caller_id)
		GROUP BY
			Customer.Company_name,
			Customer.Contact_id
		HAVING
			COUNT(*) < 5
)




SELECT
	a.Company_name,
	b.first_name,
	b.last_name,
	a.nc
    from b join a ON (a.Contact_id = b.Caller_id);

--9. For each shift show the number of staff assigned. 
--Beware that some roles may be NULL and that the same person might have been assigned to multiple roles 
--(The roles are 'Manager', 'Operator', 'Engineer1', 'Engineer2').

with a as (SELECT
			shift_date,
			shift_type,
			Manager AS role
		FROM
			Shift
		UNION ALL
		SELECT
			shift_date,
			shift_type,
			Operator AS role
		FROM
			Shift
		UNION ALL
		SELECT
			shift_date,
			shift_type,
			Engineer1 AS role
		FROM
			Shift
		UNION ALL
		SELECT
			shift_date,
			shift_type,
			Engineer2 AS role
		FROM
			Shift)
SELECT
	a.Shift_date,
	a.Shift_type,
	COUNT(DISTINCT role) AS cw
FROM a
GROUP BY
	a.Shift_date,
	a.Shift_type;

--10. Caller 'Harry' claims that the operator who took his most recent call was abusive and insulting. Find out who took the call (full name) and when.
with a as (select * from Caller WHERE First_name = 'Harry'), 

b as (select i.* from Issue i 
JOIN a ON a.Caller_id = i.Caller_id order by Call_date DESC) 
select Staff.First_name, Staff.Last_name, b.Call_date from Staff JOIN b on Staff.Staff_code = b.Taken_by 
order by call_date desc limit 1


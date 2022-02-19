-- 1.There are three issues that include the words "index" and "Oracle". Find the call_date for each of them

SELECT call_date, call_ref
FROM Issue 
WHERE Detail LIKE '%index%' 
AND detail LIKE '%Oracle%'

--2. Samantha Hall made three calls on 2017-08-14. Show the date and time for each

SELECT 
    Issue.call_date, 
    Caller.first_name, 
    Caller.last_name
FROM Issue 
JOIN Caller ON  Caller.caller_id = Issue.caller_id
WHERE 
    Caller.first_name = 'Samantha'
    AND Caller.last_name = 'Hall'
    AND Issue.call_date LIKE '%2017-08-14%';

--3. There are 500 calls in the system (roughly). Write a query that shows the number that have each status.

SELECT status, count(*) AS Volume 
FROM Issue
GROUP BY status; 

--4. Calls are not normally assigned to a manager but it does happen. How many calls have been assigned to staff who are at Manager Level?
SELECT count (*) AS mlcc
FROM Issue
JOIN Staff ON Issue.Assigned_to = Staff.Staff_code
JOIN Level ON Staff.Level_code = Level.level_code
WHERE Level.Manager = 'Y'

--5. Show the manager for each shift. Your output should include the shift date and type; also the first and last name of the manager.

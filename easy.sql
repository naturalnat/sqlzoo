-- 1.There are three issues that include the words "index" and "Oracle". Find the call_date for each of them

SELECT call_date, call_ref
FROM Issue 
WHERE Detail LIKE '%index%' 
AND detail LIKE '%Oracle%'




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
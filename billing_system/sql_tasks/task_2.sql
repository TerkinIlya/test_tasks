with accounts_with_2_absid as (SELECT
    a.account
FROM
    accounts a
JOIN
    service s ON a.account = s.account
WHERE
    s.serv_status = 'Active'
GROUP by a.account
HAVING count(s.absid) = 2)

select a.account,
	s.absid,
    s.serv_status
FROM
    accounts a
JOIN
    service s ON a.account = s.account
WHERE a.account in (SELECT account from accounts_with_2_absid)
ORDER by 
	a.account;
SELECT
    a.account,
    SUM(CASE WHEN month(convert(datetime, b.add_date, 103)) = 12 THEN b.add_sum ELSE 0 END) AS unpaid_dec_sum,
    SUM(CASE WHEN month(convert(datetime, b.add_date, 103)) = 11 THEN b.add_sum ELSE 0 END) AS unpaid_nov_sum
FROM
    accounts a
JOIN
    service s ON a.account = s.account
JOIN
    b_add_sum b ON s.absid = b.absid
WHERE
    s.serv_status = 'Active' and a.balance < 0
GROUP BY
    a.account;

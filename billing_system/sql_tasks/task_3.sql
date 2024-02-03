SELECT
    a.account,
    a.address_id
FROM
    accounts a
WHERE
    a.address_id IN (
        SELECT address_id
        FROM accounts
        GROUP BY address_id
        HAVING COUNT(account) <= 1
    );
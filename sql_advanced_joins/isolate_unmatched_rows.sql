SELECT *
	FROM accounts a
    FULL JOIN sales_reps s
    ON s.id =  a.sales_rep_id
    WHERE a.sales_rep_id IS NULL OR s.id IS NULL

Expert Tip
If you recall from earlier lessons on joins, 
the join clause is evaluated before the where clause -- filtering in the join clause will eliminate rows before they are joined, while filtering in the WHERE clause will leave those rows in and produce some nulls.



SELECT orders.id,
       orders.occurred_at  AS order_date,
       events.*
FROM   orders
LEFT JOIN web_events events
       ON events.account_id = orders.account_id
      AND events.occurred_at = orders.occurred_at
WHERE  DATE_TRUNC('month', orders.occurred_at)=
       (SELECT DATE_TRUNC('month', MIN(orders.occurred_at)) FROM orders)
ORDER BY orders.occurred_at, orders.occurred_at


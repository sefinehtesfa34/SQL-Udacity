create view v1
as
select S.id, S.name as Rep_Name, R.name as Region_Name
from sales_reps S
join region R
on S.region_id = R.id
and R.name = 'Northeast';


CREATE VIEW V2
AS
SELECT r.name region, a.name account, 
       o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;

-- You can save the result set of the query as a view (virtual table) with the name 
-- “V2” that can be queried later.

-- Note - You can use any SELECT query in the CREATE VIEW query. 
-- The above two examples show a join query, whereas the next example shows a subquery used in creating a view.


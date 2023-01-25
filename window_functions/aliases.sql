SELECT id,
       account_id,
       DATE_TRUNC('year',occurred_at) AS year,
       DENSE_RANK() OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS dense_rank,
       total_amt_usd,
       SUM(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS sum_total_amt_usd,
       COUNT(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS count_total_amt_usd,
       AVG(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS avg_total_amt_usd,
       MIN(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS min_total_amt_usd,
       MAX(total_amt_usd) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('year',occurred_at)) AS max_total_amt_usd
FROM orders
-- Changed to a cleaned way using alias
SELECT account_id,
      DATE_TRUNC('YEAR', occurred_at) AS year,
      DENSE_RANK() OVER main_window AS dense_rank,
      total_amt_usd,
      SUM(total_amt_usd) OVER main_window AS sum_total,
      COUNT(total_amt_usd) OVER main_window AS counts,
      AVG(total_amt_usd) OVER main_window AS avg_total,
      MIN(total_amt_usd) OVER main_window AS min_total,
      MAX (total_amt_usd) OVER main_window AS max_total
      FROM orders
      WINDOW main_window AS
      (PARTITION BY account_id ORDER BY DATE_TRUNC('YEAR', occurred_at))

-- Торговые точки, отвалившиеся в этом месяце. Этот запрос похож на предыдущие, за исключением чуть сменённого условия CASE.
SELECT client_id, ret as month_out FROM (SELECT client_id, MONTH(date_order) as month, CASE WHEN ((LEAD(client_id) over (order by client_id) <> client_id) OR ((LEAD(client_id) over (order by client_id) = client_id) AND (LEAD(MONTH(date_order)) over (order by client_id) <> MONTH(date_order)+1))) THEN MONTH(date_order)+1 ELSE 0 END as ret FROM
(SELECT client_id, CAST(CONVERT(Datetime, purchase_date, 120) AS DATE) as date_order FROM dbo.Orders) as t) as t2
WHERE ret <> 0 and ret<9 

-- Запрос выводит только те тогровые точки, которые сделали заказ как в этом, так и в прошлом месяце
SELECT DISTINCT t2.client_id FROM (SELECT client_id, MONTH(date_order) as month, CASE WHEN (LAG(MONTH(date_order)) over (order by client_id) = MONTH(date_order) - 1) AND (LAG(client_id) over (order by client_id) = client_id) THEN 1 ELSE 0 END as ret FROM
(SELECT client_id, CAST(CONVERT(Datetime, purchase_date, 120) AS DATE) as date_order FROM dbo.Orders) as t) as t2
WHERE ret = 1
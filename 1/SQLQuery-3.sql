--Запрос выводит торговые точки, которые когда-то что-то заказывали и вновь вернулись, не включая предыдущий месяц
SELECT t2.client_id FROM (SELECT client_id, MONTH(date_order) as month, CASE WHEN 
(LAG(MONTH(date_order)) over (order by client_id) <> MONTH(date_order) - 1) AND 
(LAG(MONTH(date_order)) over (order by client_id) <> MONTH(date_order)) AND 
(LAG(client_id) over (order by client_id) = client_id) THEN 1 ELSE 0 END as ret FROM
(SELECT client_id, CAST(CONVERT(Datetime, purchase_date, 120) AS DATE) as date_order FROM dbo.Orders) as t) as t2
WHERE ret = 1
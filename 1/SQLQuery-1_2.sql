-- Запрос выводит количество новых клиентов в соответсвии с месяцем. В таблице имеется 115 уникальных клиента, 100 из которых впервые пришли в пятом месяце, а 15 в 6 месяце
SELECT count(client_id) as num_new_client, month FROM (SELECT client_id, MIN(MONTH(date_order)) month FROM (SELECT client_id, CAST(CONVERT(Datetime, purchase_date, 120) AS DATE) as date_order FROM dbo.Orders) as t 
GROUP BY client_id) t2
GROUP BY month
-- Запрос выводит соответствие нового клиента, который ещё не встречался ранее, и месяца в котором этот клиент впервые появился
SELECT client_id, MIN(MONTH(date_order)) month FROM (SELECT client_id, CAST(CONVERT(Datetime, purchase_date, 120) AS DATE) as date_order FROM dbo.Orders) as t 
GROUP BY client_id
order by month

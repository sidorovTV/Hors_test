-- ������ ������� ������������ ������ �������, ������� ��� �� ���������� �����, � ������ � ������� ���� ������ ������� ��������
SELECT client_id, MIN(MONTH(date_order)) month FROM (SELECT client_id, CAST(CONVERT(Datetime, purchase_date, 120) AS DATE) as date_order FROM dbo.Orders) as t 
GROUP BY client_id
order by month

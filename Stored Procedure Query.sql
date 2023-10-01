CREATE or ALTER PROCEDURE summary_order_status
(@StatusID int) AS
BEGIN
	SELECT
		fso.OrderID,
		dc.CustomerName,
		dp.ProductName,
		fso.Quantity,
		dso.StatusOrder
	FROM FactSalesOrder fso
	INNER JOIN DimCustomer dc on fso.CustomerID = dc.CustomerID
	INNER JOIN DimProduct dp on fso.ProductID = dp.ProductID
	INNER JOIN DimStatusOrder dso on fso.StatusID = dso.StatusID
	WHERE fso.StatusID = @StatusID
END

EXEC summary_order_status @StatusID = 1
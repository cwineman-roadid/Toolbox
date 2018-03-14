

SELECT TOP 100 *
FROM Orders.Orders o
JOIN Orders.Shipment s ON o.ID = s.OrderID
JOIN Orders.Item i ON s.ID = i.ShipmentID
JOIN Orders.TagCustomization tc ON i.TagCustomizationID = tc.ID
ORDER BY S.ActualShipDate DESC

EXEC dbo.OrderInfo 15660024



SELECT v.Notes, * FROM InventoryV2.Item i
JOIN InventoryV2.Version v ON i.ID = v.InventoryItemID
JOIN InventoryV2.Lot l ON v.ID = l.InventoryVersionID
WHERE i.Name = 'Fulfillment Business Card'
AND v.Notes = 'Strings Attached Card'




SELECT TOP 1000 i.TransactionDate
FROM InventoryV2.Inventory i
JOIN
(
	SELECT v.ID AS versionID, l.ID AS lotID 
	FROM InventoryV2.Item i
	JOIN InventoryV2.Version v ON i.ID = v.InventoryItemID
	JOIN InventoryV2.Lot l ON v.ID = l.InventoryVersionID
	WHERE i.Name = 'Fulfillment Business Card'
	AND v.Notes = 'Strings Attached Card'
) AS SA ON (i.InventoryVersionID = SA.versionID AND i.InventoryLotID = sa.lotID )
ORDER BY i.TransactionDate





SELECT DISTINCT v.ID AS versionID, l.ID AS lotID
FROM InventoryV2.Item i
JOIN InventoryV2.Version v ON i.ID = v.InventoryItemID
JOIN InventoryV2.Lot l ON v.ID = l.InventoryVersionID
WHERE i.Name LIKE '%tell%'



SELECT DISTINCT COUNT(i.ShipmentID)
FROM InventoryV2.Inventory i
JOIN
(
	SELECT DISTINCT v.ID AS versionID, l.ID AS lotID
	FROM InventoryV2.Item i
	JOIN InventoryV2.Version v ON i.ID = v.InventoryItemID
	JOIN InventoryV2.Lot l ON v.ID = l.InventoryVersionID
	WHERE i.Name LIKE '%tell%'
) AS TAF ON (i.InventoryVersionID = TAF.versionID AND i.InventoryLotID = TAF.lotID )
AND I.TransactionDate > '9/7/2016'
AND I.TransactionDate < '2018-01-01'

--	1878908 total
--	1722436  < '9/7/2016'

--	156472 > '9/7/2016'

--	started 2018-03-07 08:07:34.450

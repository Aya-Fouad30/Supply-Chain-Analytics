--Customer
SELECT * FROM Bronze.Customers;
--=============NULLS==============

SELECT 
SUM(CASE WHEN customer_id is NULL  THEN 1 ELSE 0 END ) AS blank_id ,
SUM(CASE WHEN Customer_Fname is NULL OR Customer_Fname ='' THEN 1 ELSE 0 END ) AS blank_first_name ,
SUM(CASE WHEN Customer_Lname is NULL OR Customer_Lname='' THEN 1 ELSE 0 END ) AS blank_last_name ,
SUM(CASE WHEN Customer_State is NULL OR Customer_State='' THEN 1 ELSE 0 END ) AS blank_street ,
SUM(CASE WHEN Customer_City is NULL OR Customer_City='' THEN 1 ELSE 0 END ) AS blank_city ,
SUM(CASE WHEN Customer_Country is NULL OR Customer_Country='' THEN 1 ELSE 0 END ) AS blank_state ,
SUM(CASE WHEN Customer_Zipcode is NULL  THEN 1 ELSE 0 END ) AS blank_zip ,
SUM(CASE WHEN Latitude is NULL THEN 1 ELSE 0 END ) AS blank_lat,
SUM(CASE WHEN Longitude is NULL THEN 1 ELSE 0 END ) AS blank_long ,
SUM(CASE WHEN Customer_Segment is NULL OR Customer_Segment='' THEN 1 ELSE 0 END ) AS blank_Segment ,
SUM(CASE WHEN Customer_Street is NULL OR Customer_Street='' THEN 1 ELSE 0 END ) AS blank_Street,
SUM(CASE WHEN Customer_Password is NULL OR Customer_Password='' THEN 1 ELSE 0 END ) AS blank_Password ,
SUM(CASE WHEN Customer_Email is NULL OR Customer_Email='' THEN 1 ELSE 0 END ) AS blank_Email ,
SUM(CASE WHEN Customer_Birth_Date is NULL THEN 1 ELSE 0 END ) AS blank__Birth_Date
FROM Bronze.Customers;

--=============INCONSISTENT CATEGORICAL TYPES==============
SELECT DISTINCT Customer_Segment,COUNT(*) AS Customer_Segment
FROM Bronze.Customers 
GROUP BY (Customer_Segment);

SELECT Customer_Country,COUNT(*) AS Customer_Country
FROM Bronze.Customers 
GROUP BY Customer_Country
HAVING COUNT(*)>1;

--=============DUPLICATED IDs==============
SELECT Customer_Id,COUNT(*) AS id_count
FROM Bronze.Customers 
GROUP BY Customer_Id
HAVING COUNT(*)>1;

--=============ROWS NUM==============

SELECT COUNT(*) AS CustomersNum FROM Bronze.Customers;



--Orders
SELECT * FROM Bronze.Orders;
--=============NULLS==============

SELECT 
SUM(CASE WHEN Order_Id is NULL  THEN 1 ELSE 0 END ) AS blank_id ,
SUM(CASE WHEN Order_Item_Id is NULL  THEN 1 ELSE 0 END ) AS blank_Item_Id ,
SUM(CASE WHEN Customer_Id is NULL  THEN 1 ELSE 0 END ) AS blank_id ,
SUM(CASE WHEN Product_Card_Id is NULL  THEN 1 ELSE 0 END ) AS blank_Product_Card_Id ,
SUM(CASE WHEN [Type] is NULL OR [Type] ='' THEN 1 ELSE 0 END ) AS blank_Type ,
SUM(CASE WHEN Days_for_shipping_real is NULL  THEN 1 ELSE 0 END ) AS blank_shipping ,
SUM(CASE WHEN Days_for_shipment_scheduled is NULL  THEN 1 ELSE 0 END ) AS blank_scheduled ,
SUM(CASE WHEN Benefit_per_order is NULL  THEN 1 ELSE 0 END ) AS blank_Benefit_per_order ,
SUM(CASE WHEN Delivery_Status is NULL OR Delivery_Status='' THEN 1 ELSE 0 END ) AS blank_Delivery_Status ,
SUM(CASE WHEN Late_delivery_risk is NULL OR Late_delivery_risk='' THEN 1 ELSE 0 END ) AS blank_Late_delivery_risk ,
SUM(CASE WHEN Market is NULL OR Market='' THEN 1 ELSE 0 END ) AS blank_Market ,
SUM(CASE WHEN Order_Region is NULL OR Order_Region='' THEN 1 ELSE 0 END ) AS blank_Order_Region ,
SUM(CASE WHEN Order_State is NULL OR Order_State='' THEN 1 ELSE 0 END ) AS blank_state ,
SUM(CASE WHEN Order_Status is NULL OR Order_Status='' THEN 1 ELSE 0 END ) AS blank_Order_Status,
SUM(CASE WHEN Order_Zipcode is NULL OR Order_Zipcode='' THEN 1 ELSE 0 END ) AS blank_Order_Zipcode,
SUM(CASE WHEN order_date_DateOrders is NULL THEN 1 ELSE 0 END ) AS blank_DateOrders,
SUM(CASE WHEN shipping_date_DateOrders is NULL THEN 1 ELSE 0 END ) AS blank_shipping_date_DateOrders,
SUM(CASE WHEN Order_Item_Discount is NULL THEN 1 ELSE 0 END ) AS blank_Order_Item_Discount,
SUM(CASE WHEN Order_Item_Profit_Ratio is NULL THEN 1 ELSE 0 END ) AS blank_Order_Item_Profit_Ratio,
SUM(CASE WHEN Order_Item_Quantity is NULL THEN 1 ELSE 0 END ) AS blank_Order_Item_Quantity,
SUM(CASE WHEN Order_Item_Total is NULL THEN 1 ELSE 0 END ) AS blank_Order_Item_Total,
SUM(CASE WHEN salesman_id is NULL THEN 1 ELSE 0 END ) AS blank_salesman_id
FROM Bronze.Orders;

--=============INCONSISTENT CATEGORICAL TYPES==============
SELECT [Type],COUNT(*) AS [Type]
FROM Bronze.Orders 
GROUP BY ([Type]);

SELECT Delivery_Status,COUNT(*) AS Delivery_Status
FROM Bronze.Orders 
GROUP BY Delivery_Status
HAVING COUNT(*)>1;

SELECT Market,COUNT(*) AS Market
FROM Bronze.Orders 
GROUP BY (Market);

SELECT Order_Region,COUNT(*) AS Order_Region
FROM Bronze.Orders 
GROUP BY Order_Region
HAVING COUNT(*)>1;

SELECT Order_State,COUNT(*) AS Order_State
FROM Bronze.Orders
GROUP BY (Order_State);

SELECT Order_Status,COUNT(*) AS Order_Status
FROM Bronze.Orders 
GROUP BY Order_Status
HAVING COUNT(*)>1;

SELECT Shipping_Mode,COUNT(*) AS Shipping_Mode
FROM Bronze.Orders 
GROUP BY (Shipping_Mode);

SELECT *
FROM Bronze.Orders AS o
LEFT JOIN Bronze.Customers AS c
ON o.Customer_Id = c.Customer_Id
WHERE c.Customer_Id IS NULL;

SELECT *
FROM Bronze.Orders AS o
LEFT JOIN Bronze.Products AS p
ON o.Product_Card_Id = p.Product_Card_Id
WHERE  p.Product_Card_Id IS NULL;


SELECT *
FROM Bronze.Orders AS o
LEFT JOIN Bronze.Salesman AS s
ON o.salesman_id = s.Salesman_Id
WHERE s.Salesman_Id IS NULL;

--=============DUPLICATED IDs==============
SELECT Order_Item_Id,COUNT(*) AS id_count
FROM Bronze.Orders
GROUP BY Order_Item_Id
HAVING COUNT(*)>1;


--Products
SELECT * FROM Bronze.Products;
--=============NULLS==============

SELECT 
SUM(CASE WHEN Product_Card_Id is NULL  THEN 1 ELSE 0 END ) AS blank_id ,
SUM(CASE WHEN Product_Name is NULL OR Product_Name ='' THEN 1 ELSE 0 END ) AS blank_Product_Name ,
SUM(CASE WHEN Product_Price is NULL  THEN 1 ELSE 0 END ) AS blank_Product_Price ,
SUM(CASE WHEN Product_Status is NULL THEN 1 ELSE 0 END ) AS blank_Product_Status,
SUM(CASE WHEN Category_Id is NULL THEN 1 ELSE 0 END ) AS blank_Category_Id ,
SUM(CASE WHEN Product_Description is NULL OR Product_Description='' THEN 1 ELSE 0 END ) AS blank_description ,
SUM(CASE WHEN Category_Name is NULL OR Category_Name='' THEN 1 ELSE 0 END ) AS blank_Category_Name,
SUM(CASE WHEN Department_Id is NULL OR Department_Id='' THEN 1 ELSE 0 END ) AS blank_Department_Id ,
SUM(CASE WHEN Department_Name is NULL OR Department_Name='' THEN 1 ELSE 0 END ) AS blank_Department_Name
FROM Bronze.Products;

--=============INCONSISTENT CATEGORICAL TYPES==============


--=============DUPLICATED IDs==============
SELECT Product_Card_Id,COUNT(*) AS id_count
FROM Bronze.Products 
GROUP BY Product_Card_Id
HAVING COUNT(*)>1;




--Salesman
SELECT * FROM Bronze.Salesman;
--=============NULLS==============

SELECT 
SUM(CASE WHEN Salesman_Id is NULL  THEN 1 ELSE 0 END ) AS blank_id ,
SUM(CASE WHEN Salesman_Fname is NULL OR Salesman_Fname ='' THEN 1 ELSE 0 END ) AS blank_Fname ,
SUM(CASE WHEN Salesman_Lname is NULL OR Salesman_Lname='' THEN 1 ELSE 0 END ) AS blank_last_name ,
SUM(CASE WHEN Salesman_Email is NULL OR Salesman_Email='' THEN 1 ELSE 0 END ) AS blank_Email ,
SUM(CASE WHEN Market is NULL OR Market='' THEN 1 ELSE 0 END ) AS blank_Market ,
SUM(CASE WHEN Region is NULL OR Region='' THEN 1 ELSE 0 END ) AS blank_Region ,
SUM(CASE WHEN Hire_Date is NULL  THEN 1 ELSE 0 END ) AS blank_Hire_Date ,
SUM(CASE WHEN Commission_Rate is NULL THEN 1 ELSE 0 END ) AS blank_Commission_Rate
FROM Bronze.Salesman;

--=============INCONSISTENT CATEGORICAL TYPES==============
SELECT DISTINCT Region,COUNT(*) AS Region
FROM Bronze.Salesman 
GROUP BY (Region);

SELECT Market,COUNT(*) AS Market
FROM Bronze.Salesman 
GROUP BY Market
HAVING COUNT(*)>1;

--=============DUPLICATED IDs==============
SELECT Salesman_Id,COUNT(*) AS id_count
FROM Bronze.Salesman 
GROUP BY Salesman_Id
HAVING COUNT(*)>1;
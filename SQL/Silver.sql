

SELECT Customer_Id,Customer_Fname,Customer_Lname,Customer_Email,Customer_Password,Customer_Segment,Customer_City,
Customer_State,Customer_Street,Customer_Zipcode,Customer_Country,Latitude,Longitude,Customer_Birth_Date,
DATEDIFF(year,Customer_Birth_Date,GETDATE())                              AS age,
CASE
    WHEN DATEDIFF(YEAR,Customer_Birth_Date,GETDATE()) < 18 THEN 'Under 18'
    WHEN DATEDIFF(YEAR,Customer_Birth_Date,GETDATE()) BETWEEN 18 AND 25 THEN '18-25'
    WHEN DATEDIFF(YEAR,Customer_Birth_Date,GETDATE()) BETWEEN 26 AND 35 THEN '26-35'
    WHEN DATEDIFF(YEAR,Customer_Birth_Date,GETDATE()) BETWEEN 36 AND 45 THEN '36-45'
    WHEN DATEDIFF(YEAR,Customer_Birth_Date,GETDATE()) BETWEEN 46 AND 60 THEN '46-60'
    ELSE '60+'
END AS age_groups
INTO Silver.Customers
FROM Bronze.Customers

ALTER TABLE Silver.Customers ALTER COLUMN Customer_Id INT NOT NULL ;
ALTER TABLE Silver.Customers ADD CONSTRAINT PK_Silver_customer PRIMARY KEY(Customer_Id );

SELECT *
FROM Silver.Customers;

-------------------------------------------------------------------

SELECT Order_Id,Order_Item_Id,Customer_Id,Product_Card_Id,LOWER([Type]) AS [Type],Days_for_shipping_real,Days_for_shipment_scheduled,Benefit_per_order,
CASE
WHEN Delivery_Status = 'advance shipping' OR Delivery_Status = 'Advance  shipping' THEN 'Advance shipping'
WHEN Delivery_Status = 'Shipping on time' OR Delivery_Status ='Shipping  on time' THEN 'Shipping on time'
WHEN Delivery_Status = 'Late delivery' OR Delivery_Status = 'Late  delivery' THEN 'Late delivery'
WHEN Delivery_Status = 'Shipping canceled'OR Delivery_Status = 'Shipping  canceled'THEN 'Shipping canceled'
ELSE Delivery_Status
END AS Delivery_Status,
Late_delivery_risk,
CASE
WHEN Market IN ('USCA','US and Canada','US  & Canada','U.S.-Canada','US  and Canada','US & Canada   ') THEN 'US and Canada'
WHEN Market IN ('Pacific  Asia','APAC','Pacific Asia','Asia-Pacific') THEN 'Pacific Asia'
WHEN Market IN ('Africa','AFR') THEN 'Africa'
WHEN Market IN ('Latin  America','Latin America','LATAM') THEN 'Latin America'
WHEN Market = 'EU' THEN 'Europe'
ELSE Market
END AS Market ,
LOWER(REPLACE(TRIM(Order_Region),'  ',' '))AS Order_Region,LOWER(Order_State) AS Order_State,
LOWER(Order_Status) AS Order_Status,Order_Zipcode,order_date_DateOrders,
YEAR(order_date_DateOrders) AS order_year,MONTH(order_date_DateOrders) AS order_month,
shipping_date_DateOrders,
CASE
WHEN Shipping_Mode IN ('Standard','Standard Class','Standard  Class','Std Class','Std  Class') THEN 'Standard Class'
WHEN Shipping_Mode IN ('1st  Class','1st Class','First Class','First  Class') THEN 'First Class'
WHEN Shipping_Mode IN ('Second  Class','2nd Class','2nd  Class','Second Class   ') THEN 'Second Class'
WHEN Shipping_Mode IN ('Same-Day ','Same  Day','Same Day') THEN 'Same Day'

ELSE Shipping_Mode
END AS  Shipping_Mode,
Order_Item_Discount,Order_Item_Profit_Ratio,Order_Item_Profit_Ratio * Order_Item_Total AS Item_Profit,
Order_Item_Quantity,Order_Item_Total,salesman_id
INTO Silver.Orders
FROM Bronze.Orders;

ALTER TABLE Silver.Orders ADD CONSTRAINT PK_Silver_Order_Item_Id PRIMARY KEY(Order_Item_Id);

SELECT *
FROM Silver.Orders;

-----------------------------------------------------------

SELECT Product_Card_Id,Product_Name,Product_Price,Product_Status,Product_Description,
Category_Id,Category_Name,Department_Id,Department_Name
INTO Silver.Products
FROM Bronze.Products;

ALTER TABLE Silver.Products ALTER COLUMN Product_Card_Id INT NOT NULL ;
ALTER TABLE Silver.Products ADD CONSTRAINT PK_Silver_Product_Card_Id PRIMARY KEY(Product_Card_Id);

SELECT *
FROM Silver.Products;

 -------------------------------------------------------------

 SELECT Salesman_Id,Salesman_Fname,Salesman_Lname,Salesman_Email,Market,Region,Hire_Date,
 YEAR(Hire_Date) AS Hire_year,MONTH(Hire_Date) AS Hire_month,
 Commission_Rate
 INTO Silver.Salesman
 FROM Bronze.Salesman;

ALTER TABLE Silver.Salesman ALTER COLUMN Salesman_Id INT NOT NULL ;
ALTER TABLE Silver.Salesman ADD CONSTRAINT PK_Silver_Salesman_Id PRIMARY KEY(Salesman_Id);

SELECT *
FROM Silver.Salesman;
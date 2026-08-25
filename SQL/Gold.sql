--DIMCustomers
SELECT *
INTO Gold.DimCustomers
FROM Silver.Customers;

SELECT * FROM Gold.DimCustomers
ALTER TABLE Gold.DimCustomers ALTER COLUMN Customer_Id INT NOT NULL;
ALTER TABLE Gold.DimCustomers ADD CONSTRAINT PK_Dimcustomer PRIMARY KEY(Customer_Id );

  ----DimProducts

SELECT *
INTO Gold.DimProducts
FROM Silver.Products;

SELECT * FROM Gold.DimProducts;
ALTER TABLE Gold.DimProducts ALTER COLUMN Product_Card_Id INT NOT NULL;
ALTER TABLE Gold.DimProducts ADD CONSTRAINT PK_DimProducts PRIMARY KEY(Product_Card_Id);

  ----1

  SELECT *
INTO Gold.DimSalesman
FROM Silver.Salesman;

SELECT * FROM Gold.DimSalesman;
ALTER TABLE Gold.DimSalesman ALTER COLUMN Salesman_Id INT NOT NULL;
ALTER TABLE Gold.DimSalesman ADD CONSTRAINT PK_DimSalesman PRIMARY KEY(Salesman_Id);


--FactOrders
SELECT Order_Id,Order_Item_Id,TRY_CAST(Customer_Id  AS INT) AS Customer_Id,TRY_CAST(Product_Card_Id  AS INT) AS Product_Card_Id,
CAST(FORMAT(order_date_DateOrders,'yyyyMMdd')AS INT) AS date_key,[Type],
Days_for_shipping_real,Days_for_shipment_scheduled,Benefit_per_order,Delivery_Status,Late_delivery_risk,Market,Order_Region,Order_State,
Order_Status,Order_Zipcode,order_date_DateOrders,order_year,order_month,shipping_date_DateOrders,Shipping_Mode,Order_Item_Discount,
Order_Item_Profit_Ratio,Item_Profit,Order_Item_Quantity,Order_Item_Total,TRY_CAST(salesman_id  AS INT) AS salesman_id
INTO Gold.FactOrders
FROM Silver.Orders

ALTER TABLE Gold.FactOrders ADD CONSTRAINT PK_FactOrders PRIMARY KEY(Order_Item_Id );

--- ForeignKeys

ALTER TABLE Gold.FactOrders 
ADD CONSTRAINT FK_Fact_DimDate FOREIGN KEY (date_key)
REFERENCES Gold.DimDate (Datekey);

ALTER TABLE Gold.FactOrders 
ADD CONSTRAINT FK_DimCustomers FOREIGN KEY (Customer_Id)
REFERENCES Gold.DimCustomers (Customer_Id);

ALTER TABLE Gold.FactOrders
ADD CONSTRAINT FK_DimProducts FOREIGN KEY (Product_Card_Id)
REFERENCES Gold.DimProducts(Product_Card_Id);

ALTER TABLE Gold.FactOrders
ADD CONSTRAINT FK_DimSalesman FOREIGN KEY (salesman_id)
REFERENCES Gold.DimSalesman(Salesman_Id);





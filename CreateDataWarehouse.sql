Create database DataModeling;

Use DataModeling;

CREATE TABLE DimProduct
(
    ProductKey BIGINT PRIMARY KEY NOT NULL,
    ProductID INT NULL,
    Product NVARCHAR(MAX) NULL,
    Category NVARCHAR(MAX) NULL,
    Segment NVARCHAR(MAX) NULL,
    [Unit Cost] FLOAT NULL,
    [Unit Price] FLOAT NULL
);


CREATE TABLE DimGeography
(
    GeographyKey BIGINT PRIMARY KEY NOT NULL,
    ZipCode NVARCHAR(MAX) NULL,
    City NVARCHAR(MAX) NULL,
    State NVARCHAR(MAX) NULL,
    Region NVARCHAR(MAX) NULL,
    District NVARCHAR(MAX) NULL,
    Country NVARCHAR(MAX) NULL
);

CREATE TABLE DimCustomer
(
    CustomerKey BIGINT PRIMARY KEY NOT NULL,
    CustomerID INT NULL,
    ZipCode NVARCHAR(MAX) NULL,
    Email NVARCHAR(MAX) NULL,
    [Last Name] NVARCHAR(MAX) NULL,
    [First Name] NVARCHAR(MAX) NULL,
    GeographyKey BIGINT NULL
);

CREATE TABLE DimDate
(
    DateKey BIGINT PRIMARY KEY NOT NULL,
    CalendarDate DATE NOT NULL,
    CalendarYear INT NOT NULL,
    CalendarMonth NVARCHAR(MAX) NOT NULL,
    MonthOfYear INT NOT NULL,
    CalendarDay NVARCHAR(MAX) NOT NULL,
    DayOfWeek INT NOT NULL,
    DayOfWeekStartMonday INT NOT NULL,
    IsWeekDay NVARCHAR(MAX) NOT NULL,
    DayOfMonth INT NOT NULL,
    IsLastDayOfMonth NVARCHAR(MAX) NOT NULL,
    DayOfYear INT NOT NULL,
    WeekOfYearIso INT NOT NULL,
    QuarterOfYear INT NOT NULL,
    FiscalYearOctToSep INT NOT NULL,
    FiscalMonthOctToSep INT NULL,
    FiscalYearJulToJun INT NOT NULL,
    FiscalMonthJulToJun INT NULL
);

CREATE TABLE FactSales
(
    ProductKey BIGINT NOT NULL,
    DateKey BIGINT NOT NULL,
    CustomerKey BIGINT NOT NULL,
	OrderID BIGINT NOT NULL,
    Units INT NULL,
    [Unit Cost] FLOAT NULL,
    [Unit Price] FLOAT NULL
);

ALTER TABLE DimCustomer
ADD CONSTRAINT FK_DimCustomer_DimGeography FOREIGN KEY (GeographyKey)
REFERENCES DimGeography (GeographyKey);

ALTER TABLE FactSales
ADD CONSTRAINT FK_FactSales_ProductKey FOREIGN KEY (ProductKey)
REFERENCES DimProduct (ProductKey);

ALTER TABLE FactSales
ADD CONSTRAINT FK_FactSales_DateKey FOREIGN KEY (DateKey)
REFERENCES DimDate (DateKey);

ALTER TABLE FactSales
ADD CONSTRAINT FK_FactSales_CustomerKey FOREIGN KEY (CustomerKey)
REFERENCES DimCustomer (CustomerKey);

--ALTER AUTHORIZATION ON DATABASE::DataModeling TO sa


--ALTER TABLE FactSales NOCHECK CONSTRAINT ALL;
--DELETE FROM FactSales;
--ALTER TABLE FactSales WITH CHECK CHECK CONSTRAINT ALL;

--ALTER TABLE DimCustomer NOCHECK CONSTRAINT ALL;
--DELETE FROM DimCustomer;
--ALTER TABLE DimCustomer WITH CHECK CHECK CONSTRAINT ALL;

--ALTER TABLE DimGeography NOCHECK CONSTRAINT ALL;
--DELETE FROM DimGeography;
--ALTER TABLE DimGeography WITH CHECK CHECK CONSTRAINT ALL;

--ALTER TABLE DimProduct NOCHECK CONSTRAINT ALL;
--DELETE FROM DimProduct;
--ALTER TABLE DimProduct WITH CHECK CHECK CONSTRAINT ALL;

--ALTER TABLE DimDate NOCHECK CONSTRAINT ALL;
--DELETE FROM DimDate;
--ALTER TABLE DimDate WITH CHECK CHECK CONSTRAINT ALL;




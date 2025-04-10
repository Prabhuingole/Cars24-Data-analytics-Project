use cars;
show databases;
CREATE TABLE Staging_Refurbished_Cars (
    Manufacturer VARCHAR(255),
    Varient VARCHAR(255),
    Details VARCHAR(255),
    India_Locations VARCHAR(255),
    Model VARCHAR(255),
    Distance_Travelled VARCHAR(255),
    Fuel_Type VARCHAR(255),
    Engine_Capacity VARCHAR(255),
    Transmission VARCHAR(255),
    Price_INR VARCHAR(255)
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Dataset_Used Cars .csv"
INTO TABLE Staging_Refurbished_Cars
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select *from staging_refurbished_cars;

DESCRIBE staging_refurbished_cars;

SELECT * FROM staging_refurbished_cars LIMIT 10;

UPDATE staging_refurbished_cars
SET Price_INR = NULL
WHERE Price_INR NOT REGEXP '^[0-9]+(\.[0-9]+)?$';

SELECT DISTINCT Price_INR
FROM staging_refurbished_cars
ORDER BY Price_INR;

ALTER TABLE staging_refurbished_cars
MODIFY COLUMN Price_INR DECIMAL(10, 2);

SELECT Price_INR
FROM staging_refurbished_cars
WHERE Price_INR NOT REGEXP '^[0-9]+(\.[0-9]+)?$'
   OR CAST(Price_INR AS DECIMAL(10,2)) > 99999999.99;

DELETE FROM staging_refurbished_cars
WHERE Details IS NULL
   OR TRIM(Details) = '';
   
select *from staging_refurbished_cars;

DELETE FROM staging_refurbished_cars
WHERE price = 'call';

   SELECT 
    COUNT(*) AS Total_Rows,
    SUM(CASE WHEN Engine_Capacity = 0 THEN 1 ELSE 0 END) AS Zero_Engine_Capacity
FROM staging_refurbished_cars;

SELECT *
FROM staging_refurbished_cars
WHERE Engine_Capacity = 0;

SELECT Model, Details, Varient, Engine_Capacity
FROM staging_refurbished_cars
WHERE Engine_Capacity > 0
GROUP BY Model, Details, Varient, Engine_Capacity
ORDER BY Model, Details, Varient;


SHOW COLUMNS FROM staging_refurbished_cars;

CREATE TABLE Engine_Capacity_Mapping (
    Model VARCHAR(255),
    Details VARCHAR(255),
    Varient VARCHAR(255),
    Engine_Capacity INT
);


INSERT INTO Engine_Capacity_Mapping (Model, Details, Variant, Engine_Capacity)
VALUES 
('Model1', 'Detail1', 'Varient1', 1500),
('Model2', 'Detail2', 'Varient2', 2000);

UPDATE staging_refurbished_cars AS src
JOIN Engine_Capacity_Mapping AS map
ON src.Model = map.Model
   AND src.Details = map.Details
   AND src.Varient = map.Variant
SET src.Engine_Capacity = map.Engine_Capacity
WHERE src.Engine_Capacity = 0;

SELECT COUNT(*) AS Rows_With_Zero_Engine_Capacity
FROM staging_refurbished_cars
WHERE Engine_Capacity = 0;

Delete From staging_refurbished_cars 
Where Engine_Capacity = 0;

SELECT *
FROM staging_refurbished_cars
WHERE NOT Engine_Capacity REGEXP '^[0-9]+$';

DELETE FROM staging_refurbished_cars
WHERE NOT Engine_Capacity REGEXP '^[0-9]+$';

SELECT 
    Manufacturer, 
    Model, 
    Price_INR, 
    Engine_Capacity, 
    Distance_Travelled, 
    India_Locations
FROM staging_refurbished_cars
LIMIT 20;

SELECT 
    COUNT(*) AS Total_Rows,
    SUM(CASE WHEN Manufacturer IS NULL OR Manufacturer = '' THEN 1 ELSE 0 END) AS Missing_Manufacturer,
    SUM(CASE WHEN Model IS NULL OR Model = '' THEN 1 ELSE 0 END) AS Missing_Model,
    SUM(CASE WHEN Price_INR IS NULL OR Price_INR = '' THEN 1 ELSE 0 END) AS Missing_Price,
    SUM(CASE WHEN Distance_Travelled IS NULL OR Distance_Travelled = '' THEN 1 ELSE 0 END) AS Missing_Distance,
    SUM(CASE WHEN India_Locations IS NULL OR India_Locations = '' THEN 1 ELSE 0 END) AS Missing_Location
FROM staging_refurbished_cars;

SELECT Price_INR
FROM staging_refurbished_cars
WHERE NOT Price_INR REGEXP '^[0-9]+$';

SELECT Distance_Travelled
FROM staging_refurbished_cars
WHERE NOT Distance_Travelled REGEXP '^[0-9]+$';

SELECT Details, Model
FROM staging_refurbished_cars
WHERE Details LIKE '%20%' OR Model LIKE '%20%';


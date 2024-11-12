-- Create a database
CREATE DATABASE DEFORESTATION_TABLE;

-- Use the created database
USE DEFORESTATION_TABLE;

-- Creating Location Table
CREATE TABLE Locations(
    Location_ID INT IDENTITY(1,1) PRIMARY KEY,
    Latitude DECIMAL(9,6) NOT NULL CHECK (Latitude BETWEEN -90 AND 90),
    Longitude DECIMAL(9,6) NOT NULL CHECK (Longitude BETWEEN -180 AND 180),
    Location_Name VARCHAR(100) NOT NULL,
    Region VARCHAR(100) NOT NULL
);

-- Creating Biodiversity_Impacts Table
CREATE TABLE Biodiversity_Impacts (
    Impact_ID INT IDENTITY(1,1) PRIMARY KEY,
    Impact_Description VARCHAR(255) NOT NULL
);


-- Creating Deforestation_Data Table
CREATE TABLE Deforestation_Data (
    Deforestation_ID INT IDENTITY(1,1) PRIMARY KEY,
    Date DATE NOT NULL,
    Location_ID INT NOT NULL,
    Type_of_Vegetation VARCHAR(100) NOT NULL,
    Area_Deforested DECIMAL(10,2) NOT NULL CHECK (Area_Deforested > 0),
    Cause_of_Deforestation VARCHAR(100) NOT NULL,
    Impact_on_Biodiversity VARCHAR(255),
    Source_of_Data VARCHAR(100),
    CONSTRAINT FK_Location FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID)
);


-- Creating Deforestation_Biodiversity Table
CREATE TABLE Deforestation_Biodiversity (
    Deforestation_ID INT NOT NULL,
    Impact_ID INT NOT NULL,
    CONSTRAINT PK_Deforestation_Biodiversity PRIMARY KEY (Deforestation_ID, Impact_ID),
    CONSTRAINT FK_Deforestation FOREIGN KEY (Deforestation_ID) REFERENCES Deforestation_Data(Deforestation_ID),
    CONSTRAINT FK_Impact FOREIGN KEY (Impact_ID) REFERENCES Biodiversity_Impacts(Impact_ID)
);

-- Creating Conservation_Efforts Table
CREATE TABLE Conservation_Efforts (
    Effort_ID INT IDENTITY(1,1) PRIMARY KEY,
    Location_ID INT NOT NULL,
    Description VARCHAR(255) NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE,
    Effectiveness_Rating DECIMAL(3,2) CHECK (Effectiveness_Rating BETWEEN 0 AND 5),
    CONSTRAINT FK_Conservation_Location FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID)
);
   
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/** Sample Data Insertion
Let's populate the tables with some fictitious data to demonstrate how this schema can answer the questions. **/
-- Populate Locations
INSERT INTO Locations (Latitude, Longitude, Location_Name, Region)
VALUES
(6.5244, 3.3792, 'Lagos', 'South West'),
(9.0579, 7.4951, 'Abuja', 'North Central'),
(4.8156, 7.0498, 'Port Harcourt', 'South South'),
(5.8520, 5.6900, 'Ibadan', 'South West'),
(10.3111, 9.8434, 'Kano', 'North West'),
(12.0029, 8.5919, 'Kaduna', 'North West'),
(7.3775, 3.9470, 'Ilorin', 'North Central'),
(6.2068, 6.7110, 'Benin City', 'South South'),
(7.7895, 6.7408, 'Abeokuta', 'South West'),
(5.1166, 7.3667, 'Enugu', 'South East'),
(10.2673, 13.2706, 'Jos', 'North Central'),
(11.8598, 13.1552, 'Maiduguri', 'North East'),
(7.1907, 5.5868, 'Auchi', 'South South'),
(8.4821, 4.5417, 'Warri', 'South South'),
(10.3104, 9.7461, 'Sokoto', 'North West'),
(10.3906, 9.8547, 'Zaria', 'North West'),
(7.8798, 8.0698, 'Calabar', 'South South'),
(9.1131, 7.4241, 'Minna', 'North Central'),
(4.9516, 8.3220, 'Uyo', 'South South'),
(10.5250, 7.4403, 'Gombe', 'North East'),
(6.6150, 3.3497, 'Badagry', 'South West'),
(6.4483, 7.5265, 'Onitsha', 'South East'),
(11.8634, 13.1451, 'Damaturu', 'North East'),
(10.4926, 7.4304, 'Bauchi', 'North East'),
(9.0634, 7.4880, 'Nasarawa', 'North Central'),
(5.8920, 5.6764, 'Ogbomosho', 'South West'),
(5.2018, 7.3427, 'Nsukka', 'South East'),
(8.6985, 7.6858, 'Eket', 'South South'),
(11.9784, 8.4810, 'Zamfara', 'North West'),
(11.5235, 7.3107, 'Katsina', 'North West');

select *
from Locations

-- Populate Biodiversity_Impacts
INSERT INTO Biodiversity_Impacts (Impact_Description)
VALUES
('Loss of habitat for local bird species'),
('Deforestation leading to loss of forest-dependent species'),
('Pollution affecting aquatic biodiversity'),
('Introduction of invasive species'),
('Disruption of migratory patterns'),
('Climate change impacting ecosystem stability'),
('Urbanization encroaching on natural habitats'),
('Introduction of invasive species'),
('Degradation of mangrove ecosystems'),
('Fragmentation of wildlife corridors'),
('Degradation of mangrove ecosystems'),
('Fragmentation of wildlife corridors'),
('Deforestation leading to loss of forest-dependent species'),
('Deforestation leading to loss of forest-dependent species'),
('Climate change impacting ecosystem stability'),
('Disruption of migratory patterns'),
('Climate change impacting ecosystem stability'),
('Deforestation leading to loss of forest-dependent species'),
('Pollution affecting aquatic biodiversity'),
('Introduction of invasive species'),
('Loss of habitat for local bird species'),
('Disruption of migratory patterns'),
('Fragmentation of wildlife corridors'),
('Introduction of invasive species'),
('Deforestation leading to loss of forest-dependent species'),
('Loss of habitat for local bird species'),
('Fragmentation of wildlife corridors'),
('Pollution affecting aquatic biodiversity'),
('Disruption of migratory patterns'),
('Pollution affecting aquatic biodiversity');


-- Populate Deforestation_Data
INSERT INTO Deforestation_Data (Date, Location_ID, Type_of_Vegetation, Area_Deforested, Cause_of_Deforestation, Impact_on_Biodiversity, Source_of_Data)
VALUES
('2023-01-15', 1, 'Tropical Rainforest', 250.00, 'Agricultural Expansion', 'Loss of habitat for local bird species', 'Satellite Imagery'),
('2023-08-30', 2, 'Savannah', 120.75, 'Illegal Logging', 'Deforestation leading to loss of forest-dependent species', 'Field Survey'),
('2023-07-25', 3, 'Mangrove Forest', 400.50, 'Settlement Expansion', 'Pollution affecting aquatic biodiversity', 'Satellite Imagery'),
('2023-05-15', 4, 'Deciduous Forest', 220.80, 'Mining', 'Introduction of invasive species', 'Field Survey'),
('2023-06-20', 5, 'Boreal Forest', 300.00, 'Oil Palm Plantations', 'Disruption of migratory patterns', 'Remote Sensing'),
('2023-09-05', 6, 'Deciduous Forest', 280.30, 'Infrastructure Development', 'Climate change impacting ecosystem stability', 'Remote Sensing'),
('2023-11-15', 7, 'Tropical Rainforest', 190.50, 'Urban Expansion', 'Urbanization encroaching on natural habitats', 'Field Survey'),
('2023-05-15', 8, 'Boreal Forest', 220.80, 'Mining', 'Introduction of invasive species', 'Field Survey'),
('2023-03-05', 9, 'Mangrove Forest', 300.75, 'Urbanization', 'Degradation of mangrove ecosystems', 'Remote Sensing'),
('2023-04-10', 10, 'Tropical Rainforest', 180.25, 'Road Construction', 'Fragmentation of wildlife corridors', 'Satellite Imagery'),
('2023-03-05', 11, 'Mangrove Forest', 300.75, 'Urbanization', 'Degradation of mangrove ecosystems', 'Remote Sensing'),
('2023-04-10', 12, 'Tropical Rainforest', 180.25, 'Road Construction', 'Fragmentation of wildlife corridors', 'Satellite Imagery'),
('2023-08-30', 13, 'Savannah', 120.75, 'Illegal Logging', 'Deforestation leading to loss of forest-dependent species', 'Field Survey'),
('2023-08-30', 14, 'Savannah', 120.75, 'Illegal Logging', 'Deforestation leading to loss of forest-dependent species', 'Field Survey'),
('2023-09-05', 15, 'Deciduous Forest', 280.30, 'Infrastructure Development', 'Climate change impacting ecosystem stability', 'Remote Sensing'),
('2023-06-20', 16, 'Boreal Forest', 300.00, 'Oil Palm Plantations', 'Disruption of migratory patterns', 'Remote Sensing'),
('2023-09-05', 17, 'Deciduous Forest', 280.30, 'Infrastructure Development', 'Climate change impacting ecosystem stability', 'Remote Sensing'),
('2023-08-30', 18, 'Savannah', 120.75, 'Illegal Logging', 'Deforestation leading to loss of forest-dependent species', 'Field Survey'),
('2023-07-25', 19, 'Mangrove Forest', 400.50, 'Settlement Expansion', 'Pollution affecting aquatic biodiversity', 'Satellite Imagery'),
('2023-05-15', 20, 'Deciduous Forest', 220.80, 'Mining', 'Introduction of invasive species', 'Field Survey'),
('2023-01-15', 21, 'Tropical Rainforest', 250.00, 'Agricultural Expansion', 'Loss of habitat for local bird species', 'Satellite Imagery'),
('2023-06-20', 22, 'Boreal Forest', 300.00, 'Oil Palm Plantations', 'Disruption of migratory patterns', 'Remote Sensing'), 
('2023-04-10', 23, 'Tropical Rainforest', 180.25, 'Road Construction', 'Fragmentation of wildlife corridors', 'Satellite Imagery'),
('2023-05-15', 24, 'Boreal Forest', 220.80, 'Mining', 'Introduction of invasive species', 'Field Survey'),
('2023-08-30', 25, 'Savannah', 120.75, 'Illegal Logging', 'Deforestation leading to loss of forest-dependent species', 'Field Survey'),
('2023-01-15', 26, 'Tropical Rainforest', 250.00, 'Agricultural Expansion', 'Loss of habitat for local bird species', 'Satellite Imagery'),
('2023-04-10', 27, 'Deciduous Forest', 180.25, 'Road Construction', 'Fragmentation of wildlife corridors', 'Satellite Imagery'),
('2023-07-25', 28, 'Mangrove Forest', 400.50, 'Settlement Expansion', 'Pollution affecting aquatic biodiversity', 'Satellite Imagery'),
('2023-06-20', 29, 'Boreal Forest', 300.00, 'Oil Palm Plantations', 'Disruption of migratory patterns', 'Remote Sensing'), 
('2023-07-25', 30, 'Savannah', 400.50, 'Settlement Expansion', 'Pollution affecting aquatic biodiversity', 'Satellite Imagery');

-- Populate Deforestation_Biodiversity
INSERT INTO Deforestation_Biodiversity (Deforestation_ID, Impact_ID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30);




-- Populate Conservation_Efforts
INSERT INTO Conservation_Efforts (Location_ID, Description, Start_Date, End_Date, Effectiveness_Rating)
VALUES
(1, 'Habitat restoration for local bird species', '2023-03-01', '2023-09-01', 4.5),
(2, 'Forest protection to prevent species loss', '2023-05-01', '2023-11-01', 4.2),
(3, 'Water pollution monitoring and control', '2023-04-01', '2023-10-01', 4.7),
(4, 'Invasive species eradication program', '2023-06-01', NULL, 4.0),
(5, 'Migration pattern monitoring and preservation', '2023-07-01', '2023-12-01', 4.3),
(6, 'Ecosystem resilience building against climate change', '2023-10-01', NULL, 4.8),
(7, 'Natural habitat preservation planning', '2023-08-01', '2024-02-01', 4.6),
(8, 'Invasive species eradication program', '2023-06-15', NULL, 4.1),
(9, 'Mangrove reforestation and ecosystem restoration', '2023-05-01', '2023-11-01', 4.9),
(10, 'Wildlife corridor restoration initiative', '2023-05-15', '2023-11-15', 4.4),
(11, 'Mangrove ecosystem rehabilitation', '2023-04-01', '2023-10-01', 4.7),
(12, 'Wildlife corridor preservation project', '2023-04-15', '2023-10-15', 4.2),
(13, 'Anti-logging enforcement and forest protection', '2023-09-01', NULL, 4.5),
(14, 'Forest protection to prevent species loss', '2023-09-15', NULL, 4.3),
(15, 'Climate change adaptation measures', '2023-10-01', NULL, 4.8),
(16, 'Migration pattern monitoring and preservation', '2023-07-01', '2023-12-01', 4.6),
(17, 'Climate change adaptation measures', '2023-10-15', NULL, 4.9),
(18, 'Anti-logging enforcement and forest protection', '2023-09-15', NULL, 4.4),
(19, 'Water pollution monitoring and control', '2023-08-01', '2024-02-01', 4.7),
(20, 'Invasive species eradication program', '2023-06-15', NULL, 4.2),
(21, 'Habitat restoration for local bird species', '2023-03-01', '2023-09-01', 4.5),
(22, 'Migration pattern monitoring and preservation', '2023-07-01', '2023-12-01', 4.3),
(23, 'Wildlife corridor preservation project', '2023-04-15', '2023-10-15', 4.2),
(24, 'Invasive species eradication program', '2023-06-15', NULL, 4.0),
(25, 'Anti-logging enforcement and forest protection', '2023-09-01', NULL, 4.5),
(26, 'Habitat restoration for local bird species', '2023-03-01', '2023-09-01', 4.5),
(27, 'Forest protection to prevent species loss', '2023-05-01', '2023-11-01', 4.2),
(28, 'Water pollution monitoring and control', '2023-04-01', '2023-10-01', 4.7),
(29, 'Migration pattern monitoring and preservation', '2023-07-01', '2023-12-01', 4.3),
(30, 'Water pollution monitoring and control', '2023-08-01', '2024-02-01', 4.7);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Example Queries to Answer the Questions
-- 1. Main causes of deforestation in specific regions:
SELECT Region, Cause_of_Deforestation, COUNT(*) AS Occurrences
FROM Deforestation_Data
JOIN Locations ON Deforestation_Data.Location_ID = Locations.Location_ID
GROUP BY Region, Cause_of_Deforestation
ORDER BY Occurrences DESC;


-- 2. Areas with the highest rates of deforestation:
SELECT Location_Name, SUM(Area_Deforested) AS Total_Area_Deforested
FROM Deforestation_Data
JOIN Locations ON Deforestation_Data.Location_ID = Locations.Location_ID
GROUP BY Location_Name
ORDER BY Total_Area_Deforested DESC;


-- 3. Impact of deforestation on biodiversity in different locations:
SELECT Locations.Location_Name, Deforestation_Data.Impact_on_Biodiversity, COUNT(*) AS Impact_Count
FROM Deforestation_Data
JOIN Locations ON Deforestation_Data.Location_ID = Locations.Location_ID
GROUP BY Location_Name, Impact_on_Biodiversity
ORDER BY Impact_Count DESC;

SELECT Locations.Location_Name, Deforestation_Data.Impact_on_Biodiversity
FROM Deforestation_Data
JOIN Locations ON Deforestation_Data.Location_ID = Locations.Location_ID




-- 4. Trends or patterns in deforestation events over time:

SELECT DATEPART(YEAR, Date) AS Year, COUNT(*) AS Deforestation_Count
FROM Deforestation_Data
GROUP BY DATEPART(YEAR, Date)
ORDER BY Year;

-- 5. Sources of data used to track deforestation in Nigeria:
SELECT Source_of_Data, COUNT(*) AS Data_Count
FROM Deforestation_Data
GROUP BY Source_of_Data
ORDER BY Data_Count DESC;


-- 6. Effectiveness of current conservation efforts in mitigating deforestation:
SELECT L.Region, CE.Description, CE.Effectiveness_Rating
FROM Conservation_Efforts CE
JOIN Locations L ON CE.Location_ID = L.Location_ID
ORDER BY CE.Effectiveness_Rating DESC;

-- 7. Regions requiring immediate intervention:
SELECT Region, SUM(Area_Deforested) AS Total_Area_Deforested
FROM Deforestation_Data
JOIN Locations ON Deforestation_Data.Location_ID = Locations.Location_ID
GROUP BY Region
HAVING SUM(Area_Deforested) > (SELECT AVG(Area_Deforested) FROM Deforestation_Data)
ORDER BY Total_Area_Deforested DESC;



/** This enhanced schema and sample data provide a comprehensive structure to store and query deforestation-related data, 
enabling effective analysis and decision-making for conservation efforts in Nigeria.**/

--3

CREATE Table Patients (ID INT IDENTITY (1,1),
					FirstName NVARCHAR(40),
					LastName NVARCHAR(40) NOT NULL,
					SSN NVARCHAR(40) UNIQUE,
					Email AS concat (upper (left (FirstName,1)), lower (left (LastName,3)), '@mail.com'),
					Temp FLOAT (1) CHECK (Temp <=45),
					CreateDate DATETIME )


--4 
INSERT INTO Patients (FirstName, LastName)
VALUES ('Viktoria', 'Yvonnet')


INSERT INTO Patients (FirstName, LastName, SSN, Temp, CreateDate)
VALUES ('Ivan', 'Kostinkov', '34567', '55', '20240801') -- выдает ошибку по ограничению температуры

INSERT INTO Patients (FirstName, LastName, SSN, Temp, CreateDate)
VALUES ('Ivan', 'Kostinkov', '34567', '45', '20240801')

INSERT INTO Patients (FirstName, LastName, SSN, Temp, CreateDate)
VALUES ('Andrey', 'Ivanov', '34567', '36.6', '20240801') --выдает ошибку по уникальности ключа

INSERT INTO Patients (FirstName, LastName, SSN, Temp, CreateDate)
VALUES ('Marina', 'Sorina', '34569', '36.9', '20240806')

SELECT * FROM Patients

--5
ALTER TABLE AdventureWorks2017.dbo.Patients
 ADD TempType as IIF (Temp < 0, '<0°C', '>0°C')


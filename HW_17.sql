create database BarberShop
go
use BarberShop

Create Table Genders
(Id int identity (1,1),
Name nvarchar(20) not null,
CONSTRAINT PK_Genders_Id PRIMARY KEY (Id))

Create Table Positions
(Id int identity (1,1),
Name nvarchar(20) not null,
CONSTRAINT PK_Positions_Id PRIMARY KEY (Id))

Create Table Ratings
(Id int identity (1,1),
Name nvarchar(20) not null,
CONSTRAINT PK_Ratings_Id PRIMARY KEY (Id))

Create Table Barbers
(Id int identity (1,1),
FullName nvarchar(100) not null,
GenderId int NOT NULL REFERENCES Genders(Id),
Phone char(10),
Email nvarchar(100),
BirthDate date,
HireDate date,
PositionId int NOT NULL REFERENCES Positions(Id), 
CONSTRAINT PK_Barbers_Id PRIMARY KEY (Id))

Create Table Clients
(Id int identity (1,1),
FullName nvarchar(100) not null,
Phone char(10),
Email nvarchar(100),
CONSTRAINT PK_Clients_Id PRIMARY KEY (Id))

Create Table Services
(Id int identity (1,1),
Name nvarchar(50) not null,
DurationMinutes int not null,
BasePrice decimal(10,2) not null,
CONSTRAINT PK_Services_Id PRIMARY KEY (Id))

Create Table BarberServices
(BarberId int NOT NULL,
ServiceId int NOT NULL,
Price decimal(10,2) not null,
FOREIGN KEY (BarberId) REFERENCES Barbers(Id),
FOREIGN KEY (ServiceId) REFERENCES Services(Id),
CONSTRAINT PK_BarberServices_Id PRIMARY KEY (BarberId,ServiceId))

Create Table BarberSchedule
(Id int identity (1,1),
BarberId int NOT NULL,
Date date NOT NULL,
StartTime date NOT NULL,
EndTime date NOT NULL,
FOREIGN KEY (BarberId) REFERENCES Barbers(Id),
CONSTRAINT PK_BarberSchedule_Id PRIMARY KEY (Id))

Create Table Appointments
(Id int identity (1,1),
ClientId int NOT NULL,
BarberId int NOT NULL,
Date date NOT NULL,
StartTime date NOT NULL,
TotalPrice decimal(10,2) NOT NULL,
RatingId int NOT NULL,
Feedback nvarchar(max),
FOREIGN KEY (ClientId) REFERENCES Clients(Id),
FOREIGN KEY (BarberId) REFERENCES Barbers(Id),
FOREIGN KEY (RatingId) REFERENCES Ratings(Id),
CONSTRAINT PK_Appointments_Id PRIMARY KEY (Id))

Create Table AppointmentServices
(AppointmentId int NOT NULL,
ServiceId int NOT NULL,
Price decimal(10,2) not null,
FOREIGN KEY (AppointmentId) REFERENCES Appointments(Id),
FOREIGN KEY (ServiceId) REFERENCES Services(Id),
CONSTRAINT PK_AppointmentServices_Id PRIMARY KEY (AppointmentId,ServiceId))

Create Table BarberFeedbacks
(Id int identity (1,1),
ClientId int NOT NULL,
BarberId int NOT NULL,
RatingId int NOT NULL,
Feedback nvarchar(max),
Date date NOT NULL,
FOREIGN KEY (ClientId) REFERENCES Clients(Id),
FOREIGN KEY (BarberId) REFERENCES Barbers(Id),
FOREIGN KEY (RatingId) REFERENCES Ratings(Id),
CONSTRAINT PK_BarberFeedbacks_Id PRIMARY KEY (Id))


INSERT INTO Genders (Name) VALUES (N'Чоловік');
INSERT INTO Genders (Name) VALUES (N'Жінка');
INSERT INTO Positions (Name) VALUES (N'Чиф');
INSERT INTO Positions (Name) VALUES (N'Синьйор');
INSERT INTO Positions (Name) VALUES (N'Джуніор');
INSERT INTO Ratings (Name) VALUES (N'Дуже погано');
INSERT INTO Ratings (Name) VALUES (N'Погано');
INSERT INTO Ratings (Name) VALUES (N'Нормально');
INSERT INTO Ratings (Name) VALUES (N'Добре');
INSERT INTO Ratings (Name) VALUES (N'Чудово');
INSERT INTO Barbers (FullName, GenderId, Phone, Email, BirthDate, HireDate, PositionId) VALUES (N'Іван Іванов', 1, N'0930000001', N'ivan@example.com', N'1990-01-10', N'2015-06-01', 1);
INSERT INTO Barbers (FullName, GenderId, Phone, Email, BirthDate, HireDate, PositionId) VALUES (N'Петро Петренко', 1, N'0930000002', N'petro@example.com', N'1985-03-22', N'2018-03-15', 2);
INSERT INTO Barbers (FullName, GenderId, Phone, Email, BirthDate, HireDate, PositionId) VALUES (N'Олег Коваль', 1, N'0930000003', N'oleh@example.com', N'1992-11-05', N'2020-08-20', 3);
INSERT INTO Barbers (FullName, GenderId, Phone, Email, BirthDate, HireDate, PositionId) VALUES (N'Андрій Шевченко', 1, N'0930000004', N'andriy@example.com', N'1996-07-12', N'2021-01-10', 3);
INSERT INTO Barbers (FullName, GenderId, Phone, Email, BirthDate, HireDate, PositionId) VALUES (N'Марія Сидоренко', 2, N'0930000005', N'maria@example.com', N'1993-12-25', N'2019-09-05', 2);
INSERT INTO Barbers (FullName, GenderId, Phone, Email, BirthDate, HireDate, PositionId) VALUES (N'Олена Василенко', 2, N'0930000006', N'olena@example.com', N'1991-06-30', N'2017-05-18', 2);
INSERT INTO Clients (FullName, Phone, Email) VALUES (N'Клієнт Один', N'0971111111', N'client1@example.com');
INSERT INTO Clients (FullName, Phone, Email) VALUES (N'Клієнт Два', N'0972222222', N'client2@example.com');
INSERT INTO Clients (FullName, Phone, Email) VALUES (N'Клієнт Три', N'0973333333', N'client3@example.com');
INSERT INTO Clients (FullName, Phone, Email) VALUES (N'Клієнт Чотири', N'0974444444', N'client4@example.com');
INSERT INTO Services (Name, DurationMinutes, BasePrice) VALUES (N'Стрижка', 30, 300.0);
INSERT INTO Services (Name, DurationMinutes, BasePrice) VALUES (N'Гоління бороди', 20, 150.0);
INSERT INTO Services (Name, DurationMinutes, BasePrice) VALUES (N'Традиційне гоління бороди', 40, 250.0);
INSERT INTO Services (Name, DurationMinutes, BasePrice) VALUES (N'Дитяча стрижка', 25, 200.0);
INSERT INTO BarberServices (BarberId, ServiceId, Price) VALUES (1.0, 1.0, 310.0);
INSERT INTO BarberServices (BarberId, ServiceId, Price) VALUES (1.0, 2.0, 160.0);
INSERT INTO BarberServices (BarberId, ServiceId, Price) VALUES (2.0, 1.0, 290.0);
INSERT INTO BarberServices (BarberId, ServiceId, Price) VALUES (2.0, 3.0, 260.0);
INSERT INTO BarberServices (BarberId, ServiceId, Price) VALUES (3.0, 4.0, 200.0);
INSERT INTO BarberServices (BarberId, ServiceId, Price) VALUES (4.0, 1.0, 295.0);
INSERT INTO BarberServices (BarberId, ServiceId, Price) VALUES (5.0, 2.0, 150.0);
INSERT INTO BarberServices (BarberId, ServiceId, Price) VALUES (6.0, 1.0, 300.0);
INSERT INTO BarberServices (BarberId, ServiceId, Price) VALUES (6.0, 3.0, 245.0);
INSERT INTO BarberSchedule (BarberId, Date, StartTime, EndTime) VALUES (1, N'2025-07-19', N'2025-07-19 10:00:00', N'2025-07-19 12:00:00');
INSERT INTO BarberSchedule (BarberId, Date, StartTime, EndTime) VALUES (1, N'2025-07-18', N'2025-07-18 10:00:00', N'2025-07-18 12:00:00');
INSERT INTO BarberSchedule (BarberId, Date, StartTime, EndTime) VALUES (1, N'2025-07-17', N'2025-07-17 10:00:00', N'2025-07-17 12:00:00');
INSERT INTO BarberSchedule (BarberId, Date, StartTime, EndTime) VALUES (2, N'2025-07-19', N'2025-07-19 10:00:00', N'2025-07-19 12:00:00');
INSERT INTO BarberSchedule (BarberId, Date, StartTime, EndTime) VALUES (2, N'2025-07-18', N'2025-07-18 10:00:00', N'2025-07-18 12:00:00');
INSERT INTO BarberSchedule (BarberId, Date, StartTime, EndTime) VALUES (2, N'2025-07-17', N'2025-07-17 10:00:00', N'2025-07-17 12:00:00');
INSERT INTO BarberSchedule (BarberId, Date, StartTime, EndTime) VALUES (3, N'2025-07-19', N'2025-07-19 10:00:00', N'2025-07-19 12:00:00');
INSERT INTO BarberSchedule (BarberId, Date, StartTime, EndTime) VALUES (3, N'2025-07-18', N'2025-07-18 10:00:00', N'2025-07-18 12:00:00');
INSERT INTO BarberSchedule (BarberId, Date, StartTime, EndTime) VALUES (3, N'2025-07-17', N'2025-07-17 10:00:00', N'2025-07-17 12:00:00');
INSERT INTO BarberSchedule (BarberId, Date, StartTime, EndTime) VALUES (4, N'2025-07-19', N'2025-07-19 10:00:00', N'2025-07-19 12:00:00');
INSERT INTO BarberSchedule (BarberId, Date, StartTime, EndTime) VALUES (4, N'2025-07-18', N'2025-07-18 10:00:00', N'2025-07-18 12:00:00');
INSERT INTO BarberSchedule (BarberId, Date, StartTime, EndTime) VALUES (4, N'2025-07-17', N'2025-07-17 10:00:00', N'2025-07-17 12:00:00');
INSERT INTO BarberSchedule (BarberId, Date, StartTime, EndTime) VALUES (5, N'2025-07-19', N'2025-07-19 10:00:00', N'2025-07-19 12:00:00');
INSERT INTO BarberSchedule (BarberId, Date, StartTime, EndTime) VALUES (5, N'2025-07-18', N'2025-07-18 10:00:00', N'2025-07-18 12:00:00');
INSERT INTO BarberSchedule (BarberId, Date, StartTime, EndTime) VALUES (5, N'2025-07-17', N'2025-07-17 10:00:00', N'2025-07-17 12:00:00');
INSERT INTO BarberSchedule (BarberId, Date, StartTime, EndTime) VALUES (6, N'2025-07-19', N'2025-07-19 10:00:00', N'2025-07-19 12:00:00');
INSERT INTO BarberSchedule (BarberId, Date, StartTime, EndTime) VALUES (6, N'2025-07-18', N'2025-07-18 10:00:00', N'2025-07-18 12:00:00');
INSERT INTO BarberSchedule (BarberId, Date, StartTime, EndTime) VALUES (6, N'2025-07-17', N'2025-07-17 10:00:00', N'2025-07-17 12:00:00');
INSERT INTO Appointments (ClientId, BarberId, Date, StartTime, TotalPrice, RatingId, Feedback) VALUES (1, 1, N'2025-07-19', N'2025-07-19 10:00:00', 310.0, 5, N'Дуже задоволений');
INSERT INTO Appointments (ClientId, BarberId, Date, StartTime, TotalPrice, RatingId, Feedback) VALUES (2, 2, N'2025-07-19', N'2025-07-19 10:00:00', 260.0, 4, N'Все добре');
INSERT INTO Appointments (ClientId, BarberId, Date, StartTime, TotalPrice, RatingId, Feedback) VALUES (1, 2, N'2025-07-17', N'2025-07-17 10:00:00', 260.0, 4, N'Нормально');
INSERT INTO Appointments (ClientId, BarberId, Date, StartTime, TotalPrice, RatingId, Feedback) VALUES (3, 6, N'2025-07-19', N'2025-07-19 10:00:00', 245.0, 5, N'Круто');
INSERT INTO AppointmentServices (AppointmentId, ServiceId, Price) VALUES (1.0, 1.0, 310.0);
INSERT INTO AppointmentServices (AppointmentId, ServiceId, Price) VALUES (2.0, 3.0, 260.0);
INSERT INTO AppointmentServices (AppointmentId, ServiceId, Price) VALUES (3.0, 3.0, 260.0);
INSERT INTO AppointmentServices (AppointmentId, ServiceId, Price) VALUES (4.0, 3.0, 245.0);
INSERT INTO BarberFeedbacks (ClientId, BarberId, RatingId, Feedback, Date) VALUES (1, 1, 5, N'Найкращий барбер', N'2025-07-19');
INSERT INTO BarberFeedbacks (ClientId, BarberId, RatingId, Feedback, Date) VALUES (2, 2, 4, N'Рекомендую', N'2025-07-19');
INSERT INTO BarberFeedbacks (ClientId, BarberId, RatingId, Feedback, Date) VALUES (3, 6, 5, N'Прекрасна робота', N'2025-07-19');


■ Повернути ПІБ всіх барберів салону. 

CREATE FUNCTION GetAllBarbers()
RETURNS TABLE
AS
RETURN
(
    SELECT FullName FROM Barbers
);

SELECT * FROM GetAllBarbers();

■ Повернути інформацію про всіх синьйор-барберів.

CREATE FUNCTION GetAllSinior()
RETURNS TABLE
AS
RETURN
(
    SELECT BS.FullName 
    FROM Barbers BS LEFT JOIN POSITIONS PS ON BS.POSITIONID = PS.ID 
    WHERE PS.NAME = N'Синьйор'
);

SELECT * FROM GetAllSinior();

■ Повернути інформацію про всіх барберів, які можуть надати послугу традиційного гоління бороди. 

CREATE FUNCTION GetBarbersServicesBeard()
RETURNS TABLE
AS
RETURN
(
    SELECT BS.FullName 
    FROM Barbers BS 
         LEFT JOIN BarberServices BRS ON BS.ID = BRS.BarberId
         Left join Services SR ON BRS.ServiceId = SR.Id
    WHERE SR.NAME = N'Традиційне гоління бороди'
);

SELECT * FROM GetBarbersServicesBeard();

■ Повернути інформацію про всіх барберів, які можуть надати конкретну послугу. Інформація про потрібну послугу надається як параметр.

create procedure GetBarberService
@service NVARCHAR(20)
as
    SELECT BS.FullName 
    FROM Barbers BS 
         LEFT JOIN BarberServices BRS ON BS.ID = BRS.BarberId
         Left join Services SR ON BRS.ServiceId = SR.Id
    WHERE SR.NAME = @service

DECLARE @service NVARCHAR(20)
SET @service = N'Дитяча стрижка'
exec GetBarberService @service

■ Повернути інформацію про всіх барберів, які працюють понад зазначену кількість років. Кількість років передається як параметр. 

create procedure GetBarberCounYear
@CounYear int
as
    SELECT * 
    FROM Barbers BS
    WHERE (YEAR(CAST(GETDATE() AS DATE)) - YEAR(BS.HireDate)) > @CounYear

DECLARE @CounYear int
SET @CounYear = 6
exec GetBarberCounYear @CounYear

■ Повернути кількість синьйор-барберів та кількість джуніор-барберів.

CREATE FUNCTION GetCountBarbersSeniorJunior()
RETURNS TABLE
AS
RETURN
(
    SELECT
        SUM(CASE WHEN p.Name = N'Синьйор' THEN 1 ELSE 0 END) AS SeniorCount,
        SUM(CASE WHEN p.Name = N'Джуніор' THEN 1 ELSE 0 END) AS JuniorCount
    FROM Barbers b
    JOIN Positions p ON b.PositionId = p.Id
);

SELECT * FROM GetCountBarbersSeniorJunior();

■ Повернути інформацію про постійних клієнтів. Критерій постійного клієнта: був у салоні задану кількість разів. Кількість передається як параметр. 

CREATE FUNCTION GetLoyalClients(@minVisits INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        c.Id,
        c.FullName,
        c.Phone,
        c.Email,
        COUNT(a.Id) AS VisitCount
    FROM Clients c
    JOIN Appointments a ON c.Id = a.ClientId
    GROUP BY c.Id, c.FullName, c.Phone, c.Email
    HAVING COUNT(a.Id) >= @minVisits
)

SELECT * FROM GetLoyalClients(2);

■ Заборонити можливість видалення інформації про чиф-барбер, якщо не додано другий чиф-барбер. 
CREATE TRIGGER barbers_delete
ON Barbers
INSTEAD OF DELETE
AS
delete from Barbers where 
(select count(bs.id) 
from barbers bs 
     left join Positions ps on bs.PositionId = ps.id 
where ps.Name = N'Чиф') > 1

delete from Barbers where id = 1

■ Заборонити додавати барберів молодше 21 року

CREATE TRIGGER Barbers_INSERT
ON Barbers
INSTEAD OF INSERT
AS
begin
  INSERT INTO Barbers (FullName, GenderId, Phone, Email, BirthDate, HireDate, PositionId)
  SELECT FullName, GenderId, Phone, Email, BirthDate, HireDate, PositionId
  FROM INSERTED
  where DATEDIFF(YEAR, BirthDate, GETDATE()) >= 21
end 

INSERT INTO Barbers (FullName, GenderId, Phone, Email, BirthDate, HireDate, PositionId) VALUES (N'Іван Іванов', 1, N'0930000001', N'ivan@example.com', N'2020-01-10', N'2015-06-01', 1);



■ Збережена процедура виводить «Hello, world!»; 

CREATE PROCEDURE PrintHello AS
PRINT 'Hello World'

exec PrintHello

■ Збережена процедура повертає інформацію про поточний час; 

CREATE PROCEDURE PrintNowTime AS
PRINT CAST(GETDATE() as time)

exec PrintNowTime

■ Збережена процедура повертає інформацію про поточну дату;

CREATE PROCEDURE PrintNowDate AS
PRINT CAST(GETDATE() as Date)

exec PrintNowDate

■ Збережена процедура приймає три числа і повертає їхню суму; 

CREATE PROCEDURE ReturnSumm
    @a int,
    @b int,
    @c int
AS
return @a+@b+@c

DECLARE @result int
 
EXEC @result = ReturnSumm 1,2,3
PRINT @result

■ Збережена процедура приймає три числа і повертає середньоарифметичне трьох чисел; 

CREATE PROCEDURE ReturnArithmeticMean
    @a decimal(10,2),
    @b decimal(10,2),
    @c decimal(10,2)
AS
return (@a+@b+@c)/3

DECLARE @result decimal(10,2)
 
EXEC @result = ReturnArithmeticMean 1,2,3
PRINT @result

■ Збережена процедура приймає три числа і повертає максимальне значення; 

CREATE PROCEDURE ReturnMax
    @a decimal(10,2),
    @b decimal(10,2),
    @c decimal(10,2), 
    @MaxValue decimal(10,2) output
AS
SET @MaxValue = GREATEST(@A, @B, @C);

DECLARE @result decimal(10,2)
EXEC ReturnMax 1,2,3,@result output
PRINT @result

■ Збережена процедура приймає три числа і повертає мінімальне значення;

CREATE PROCEDURE ReturnMin
    @a decimal(10,2),
    @b decimal(10,2),
    @c decimal(10,2), 
    @MaxValue decimal(10,2) output
AS
SET @MaxValue = LEAST(@A, @B, @C);

DECLARE @result decimal(10,2)
EXEC ReturnMin 1,2,3,@result output
PRINT @result


■ Збережена процедура приймає число та символ. 

В результаті роботи збереженої процедури відображається  лінія довжиною, що дорівнює числу. Лінія побудована із символу, вказаного у другому параметрі. 

Наприклад, якщо було передано 5 та #, ми отримаємо лінію такого виду #####; 

CREATE PROCEDURE ReturnLine
    @a int,
    @ch char,
    @Line nvarchar(100) output
AS
begin
set @Line = ''
WHILE @a > 0
    BEGIN
        SET @Line = @Line + @ch
        SET @a = @a - 1
    END
end

DECLARE @result nvarchar(100)
EXEC ReturnLine 5,'*',@result output
PRINT @result


■ Збережена процедура приймає як параметр число і повертає його факторіал. 

Формула розрахунку факторіалу: n! = 1 * 2 * ... n. Наприклад, 3! = 1 * 2 * 3 = 6; 

create procedure factorial
@number int,
@f int out
as
SET @f = 1;
WHILE @number > 0
    BEGIN
        SET @f = @f * @number
        SET @number = @number - 1
    END;

DECLARE @result int
EXEC factorial 5,@result output
PRINT @result

■ Збережена процедура приймає два числові параметри. Перший параметр – це число. 

Другий параметр – це ступінь. Процедура повертає число, зведене до ступеня. 

Наприклад, якщо параметри дорівнюють 2 і 3, тоді повернеться 2 у третьому ступені, тобто 8.

CREATE PROCEDURE PowerNumber
    @Base FLOAT,         
    @Exponent INT,        
    @Result FLOAT OUTPUT  
AS
BEGIN
    SET @Result = POWER(@Base, @Exponent);
END

DECLARE @Output FLOAT;
EXEC PowerNumber @Base = 2, @Exponent = 3, @Result = @Output OUTPUT;
SELECT @Output AS RaisedToPower;

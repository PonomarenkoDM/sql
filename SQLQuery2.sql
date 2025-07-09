create database Hospital
go
use Hospital

--Відділення (Departments) 

--■ Ідентифікатор (Id). Унікальний ідентифікатор відділення.

--▷ Тип даних — int.

--▷ Автоприріст.

--▷ Не містить null-значення.

--▷ Первинний ключ.


--■ Корпус (Building). Номер корпусу, в якому знаходиться відділення.

--▷ Тип даних — int.

--▷ Не містить null-значення.

--▷ Має бути в діапазоні від 1 до 5.

--■ Фінансування (Financing). Фонд фінансування відділення.

--▷ Тип даних для зберігання грошових значень.

--▷ Не містить null-значення.

--▷ Не може бути менше, ніж 0.

--▷ Значення за замовчуванням — 0.

--■ Назва (Name). Назва відділення.

--▷ Тип даних — nvarchar(100).

--▷ Не містить null-значення.

--▷ Не може бути порожньою.

--▷ Має бути унікальною.

Create table Departments(
Id INT IDENTITY (1, 1),
Building int not null,
Financing decimal not null default 0,
Name nvarchar(100) not null,
CONSTRAINT PK_Department_Id PRIMARY KEY (Id), 
CONSTRAINT CK_Department_Building CHECK(Building > 0 AND Building < 6),
CONSTRAINT CK_Department_Financing CHECK(Financing >= 0),
CONSTRAINT CK_Department_Name CHECK(Name <> ''),
CONSTRAINT UQ_Department_Name UNIQUE (Name))
--Захворювання (Diseases) 

--■ Ідентифікатор (Id). Унікальний ідентифікатор захворювання.

--▷ Тип даних — int.

--▷ Автоприріст.

--▷ Не містить null-значення.

--▷ Первинний ключ.

--■ Назва (Name). Назва захворювання.

--▷ Тип даних — nvarchar(100).

--▷ Не містить null-значення.

--▷ Не може бути порожньою.

--▷ Має бути унікальною.

--■ Ступінь тяжкості (Severity). Ступінь тяжкості захворювання.

--▷ Тип даних — int.

--▷ Не містить null-значення.

--▷ Не може бути менше, ніж 1.

--▷ Значення за замовчуванням — 1.

Create table Diseases(
Id INT IDENTITY (1, 1),
Severity int not null default 1,
Name nvarchar(100) not null,
CONSTRAINT PK_Diseases_Id PRIMARY KEY (Id), 
CONSTRAINT CK_Diseases_Severity CHECK(Severity > 0),
CONSTRAINT CK_Diseases_Name CHECK(Name <> ''),
CONSTRAINT UQ_Diseases_Name UNIQUE (Name))

--Лікарі (Doctors) 

--■ Ідентифікатор (Id). Унікальний ідентифікатор лікаря.

--▷ Тип даних — int.

--▷ Автоприріст.

--▷ Не містить null-значення.

--▷ Первинний ключ.

--■ Ім’я (Name). Ім’я лікаря.

--▷ Тип даних — nvarchar(max).

--▷ Не містить null-значення.

--▷ Не може бути порожнє.

--■ Телефон (Phone). Телефонний номер лікаря.

--▷ Тип даних — char(10).

--▷ Може містити null-значення.

--■ Ставка (Salary). Ставка лікаря.

--▷ Тип даних для зберігання грошових значень.

--▷ Не містить null-значення.

--▷ Не може бути меншою або дорівнювати 0.

--■ Прізвище (Surname). Прізвище лікаря.

--▷ Тип даних — nvarchar(max).

--▷ Не містить null-значення.

--▷ Не може бути порожнє.

Create table Doctors(
Id INT IDENTITY (1, 1),
Name nvarchar(max) not null,
Surname nvarchar(max) not null,
Phone char(10),
Salary decimal(10,2) not null,
CONSTRAINT PK_Doctors_Id PRIMARY KEY (Id), 
CONSTRAINT CK_Doctors_Salary CHECK(Salary > 0),
CONSTRAINT CK_Doctors_Name CHECK(Name <> ''),
CONSTRAINT CK_Doctors_Surname CHECK(Surname <> ''))

--Обстеження (Examinations) 

--■ Ідентифікатор (Id). Унікальний ідентифікатор обстеження.

--▷ Тип даних — int.

--▷ Автоприріст.

--▷ Не містить null-значення.

--▷ Первинний ключ.

--■ День тижня (DayOfWeek). День тижня, коли проводиться обстеження.

--▷ Тип даних — int.

--▷ Не містить null-значення.

--▷ Має бути в діапазоні від 1 до 7.

--■ Час завершення (EndTime). Час завершення обстеження.

--▷ Тип даних для зберігання часу.

--▷ Не містить null-значення.

--▷ Має бути більше, ніж час початку обстеження.

--■ Назва (Name). Назва обстеження.

--▷ Тип даних — nvarchar(100).

--▷ Не містить null-значення.

--▷ Не може бути порожньою.

--▷ Має бути унікальною.

--■ Час початку (StartTime). Час початку обстеження.

--▷ Тип даних для зберігання часу.

--▷ Не містить null-значення.

--▷ Має бути в діапазоні від 8:00 до 18:00.

Create table Examinations(
Id INT IDENTITY (1, 1),
Name nvarchar(100) not null,
DayOfWeek INT not null,
StartTime Time not null,
EndTime Time not null,
CONSTRAINT PK_Examinations_Id PRIMARY KEY (Id),
CONSTRAINT UQ_Examinations_Name UNIQUE (Name),
CONSTRAINT CK_Examinations_Name CHECK(Name <> ''),
CONSTRAINT CK_Examinations_DayOfWeek CHECK(DayOfWeek > 0 and DayOfWeek < 8),
CONSTRAINT CK_Examinations_StartTime CHECK(StartTime >= '8:00' and StartTime <= '18:00'),
CONSTRAINT CK_Examinations_EndTime CHECK(EndTime > StartTime))

--Палати (Wards) 

--■ Ідентифікатор (Id). Унікальний ідентифікатор.

--▷ Тип даних — int.

--▷ Автоприріст.

--▷ Не містить null-значення

--▷ Первинний ключ.

--■ Корпус (Building). Номер корпусу, де знаходиться палата.

--▷ Тип даних — int.

--▷ Не містить null-значення.

--▷ Має бути в діапазоні від 1 до 5.

--■ Поверх (Floor). Номер поверху, на якому знаходиться палата.

--▷ Тип даних — int.

--▷ Не містить null-значення.

--▷ Не може бути менше, ніж 1.

--■ Назва (Name). Назва палати.

--▷ Тип даних — nvarchar(20).

--▷ Не містить null-значення.

--▷ Не може бути порожньою.

--▷ Має бути унікальною.

Create table Wards(
Id INT IDENTITY (1, 1),
Building int not null,
Floor int not null,
Name nvarchar(20) not null,
CONSTRAINT PK_Wards_Id PRIMARY KEY (Id), 
CONSTRAINT CK_Wards_Building CHECK(Building > 0 AND Building < 6),
CONSTRAINT CK_Wards_Floor CHECK(Floor >= 1),
CONSTRAINT UQ_Wards_Name UNIQUE (Name),
CONSTRAINT CK_Wards_Name CHECK(Name <> ''))

-- Заповнення даними

INSERT INTO Departments (Building, Financing, Name) VALUES
(1, 50000, N'Кардіологія'),
(2, 75000, N'Неврологія'),
(3, 62000, N'Хірургія'),
(4, 30000, N'Педіатрія'),
(5, 45000, N'Офтальмологія'),
(1, 55000, N'Гастроентерологія'),
(2, 47000, N'Дерматологія'),
(3, 39000, N'Ендокринологія'),
(4, 52000, N'Інфекційне відділення'),
(5, 61000, N'Урологія'),
(1, 28000, N'Пульмонологія'),
(2, 35000, N'Онкологія'),
(3, 57000, N'Травматологія'),
(4, 49000, N'Реабілітація'),
(5, 41000, N'Гематологія');

INSERT INTO Diseases (Severity, Name) VALUES
(3, N'Гіпертонія'),
(2, N'Мігрень'),
(4, N'Апендицит'),
(1, N'ГРВІ'),
(5, N'Глаукома'),
(3, N'Астма'),
(2, N'Цукровий діабет'),
(4, N'Пневмонія'),
(1, N'Скарлатина'),
(3, N'Сколіоз'),
(5, N'Лейкемія'),
(2, N'Ангіна'),
(4, N'Гепатит B'),
(1, N'Кір'),
(3, N'Нефрит');

INSERT INTO Doctors (Name, Surname, Phone, Salary) VALUES
(N'Іван', N'Петренко', '0671234567', 20000.00),
(N'Олена', N'Шевченко', '0507654321', 22000.00),
(N'Андрій', N'Ковальчук', '0631122334', 21000.00),
(N'Марія', N'Іванова', '0979988776', 19000.00),
(N'Юрій', N'Бондаренко', NULL, 25000.00),
(N'Тетяна', N'Мельник', '0663344556', 23000.00),
(N'Володимир', N'Козак', '0931122112', 20500.00),
(N'Наталія', N'Литвин', '0688899001', 19800.00),
(N'Олександр', N'Гаврилюк', '0996655443', 24000.00),
(N'Світлана', N'Ткаченко', '0963322110', 18000.00),
(N'Сергій', N'Романюк', NULL, 26000.00),
(N'Ірина', N'Демченко', '0505500550', 19500.00),
(N'Віктор', N'Семенюк', '0677755332', 21500.00),
(N'Алла', N'Юрченко', '0734567890', 22500.00),
(N'Дмитро', N'Гончар', '0930099887', 24500.00);

INSERT INTO Examinations (Name, DayOfWeek, StartTime, EndTime) VALUES
(N'Електрокардіограма', 1, '09:00', '09:30'),
(N'МРТ голови', 3, '10:00', '11:00'),
(N'УЗД черевної порожнини', 2, '08:30', '09:00'),
(N'Загальний аналіз крові', 5, '08:00', '08:20'),
(N'Огляд очного дна', 4, '14:00', '14:20'),
(N'Рентген грудної клітки', 1, '11:00', '11:30'),
(N'Аналіз сечі', 2, '08:00', '08:10'),
(N'Біохімічний аналіз крові', 3, '08:45', '09:15'),
(N'Колоноскопія', 4, '12:00', '13:00'),
(N'Ендоскопія', 5, '13:30', '14:10'),
(N'Проба Манту', 1, '10:00', '10:15'),
(N'Флюорографія', 2, '08:00', '08:30'),
(N'Аудіометрія', 3, '15:00', '15:20'),
(N'Візометрія', 4, '09:30', '09:50'),
(N'Ортопедичне обстеження', 5, '11:00', '11:40');

INSERT INTO Wards (Building, Floor, Name) VALUES
(1, 2, N'Палата №101'),
(2, 3, N'Палата №202'),
(3, 1, N'Палата №303'),
(4, 2, N'Палата №404'),
(5, 4, N'Палата №505'),
(1, 3, N'Палата №106'),
(2, 2, N'Палата №207'),
(3, 4, N'Палата №308'),
(4, 1, N'Палата №409'),
(5, 5, N'Палата №510'),
(1, 2, N'Палата №111'),
(2, 3, N'Палата №213'),
(3, 2, N'Палата №314'),
(4, 3, N'Палата №418'),
(5, 4, N'Палата №519');


--Для бази даних «Лікарня» створіть такі запити:

--1. Вивести вміст таблиці палат.

select *
from Wards

--2. Вивести прізвища та телефони усіх лікарів.

select
Surname,
Phone
from Doctors

--3. Вивести усі поверхи без повторень, де розміщуються палати.

select distinct(Floor)
from Wards

--4. Вивести назви захворювань під назвою «Name of Disease» та ступінь їхньої тяжкості під назвою «Severity of Disease».

select Name as "Name of Disease",
Severity as "Severity of Disease"
from Diseases

--5. Застосувати вираз FROM для будь-яких трьох таблиць бази даних, використовуючи псевдоніми.
select dp.Name
from Departments dp

select doc.Name,
doc.Phone
from Doctors doc

select wr.Name,
wr.Building,
wr.Floor
from Wards wr

--6. Вивести назви відділень, які знаходяться у корпусі 5 з фондом фінансування меншим, ніж 30000.

select Name
from Departments
where Building = 5
and Financing < 50000

--7. Вивести назви відділень, які знаходяться у корпусі 3 з фондом фінансування у діапазоні від 12000 до 15000.

select Name
from Departments
where Building = 3
and (Financing >= 50000 and Financing <= 60000)

--8. Вивести назви палат, які знаходяться у корпусах 4 та 5 на 1-му поверсі.

select Name
from Wards
where (Building = 4 or Building = 5)
and Floor = 3

--9. Вивести назви, корпуси та фонди фінансування відділень, які знаходяться у корпусах 3 або 6 та мають фонд фінансування менший, ніж 11000 або більший за 25000.

select Name,
Building,
Financing
from Departments
where (Building = 3 or Building = 6)
and (Financing < 11000 or Financing > 25000)

--10. Вивести прізвища лікарів, зарплата (сума ставки та надбавки) яких перевищує 1500.

select Surname
from Doctors
where Salary > 1500

--11. Вивести прізвища лікарів, у яких половина зарплати перевищує триразову надбавку.

--12. Вивести назви обстежень без повторень, які проводяться у перші три дні тижня з 12:00 до 15:00.

select distinct(Name)
from Examinations
where DayOfWeek <= 3
and StartTime >= '12:00' 
and StartTime <= '15:00'

--13. Вивести назви та номери корпусів відділень, які знаходяться у корпусах 1, 3, 8 або 10.

select Name,
Building
from Departments
where Building in (1,2,8,10)

--14. Вивести назви захворювань усіх ступенів тяжкості, крім 1-го та 2-го.

select Name
from Diseases
where Severity<>1 and Severity<>2

--15. Вивести назви відділень, які не знаходяться у 1-му або 3-му корпусі.

select Name
from Departments
where Building not in (1,3)

--16. Вивести назви відділень, які знаходяться у 1-му або 3-му корпусі.

select Name
from Departments
where Building in (1,3)

--17. Вивести прізвища лікарів, що починаються з літери «N».

select name
from Doctors
where Name Like ('В%')

select name
from Doctors
where Left(Name,1) = 'В'
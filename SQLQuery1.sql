--Створіть базу даних для зберігання оцінок студентів. 
--CREATE DATABASE STUDENT
--GO
--USE STUDENT

--У базі даних створіть таблицю «Оцінки студентів»
--CREATE TABLE STUDENT_PERFORMANCE
--(
--    Id INT IDENTITY,
--    City NVARCHAR(20),
--    Country NVARCHAR(20),
--    Date_of_birth DATE,
--    Name_student NVARCHAR(20) NOT NULL,
--    Email VARCHAR(30),
--    Phone VARCHAR(20),
--    Name_group VARCHAR(20),
--    Average_score_All_subjects NUMERIC(4,2),
--    Name_subjects_min_scope VARCHAR(20),
--    Name_subjects_max_scope VARCHAR(20),
--    CONSTRAINT PK_Student_Id PRIMARY KEY (Id), 
--    CONSTRAINT CK_Student_Date_of_birth CHECK(Date_of_birth >'1999.01.01' AND Date_of_birth <'2010.01.01'),
--    CONSTRAINT UQ_Customer_Email UNIQUE (Email),
--    CONSTRAINT UQ_Customer_Phone UNIQUE (Phone)
--)

--Заповнення даними
--insert into STUDENT_PERFORMANCE
--(City, Country, Date_of_birth, Name_student, Email, Phone, Name_group, Average_score_All_subjects, Name_subjects_min_scope, Name_subjects_max_scope) 
--VALUES ('Київ','Україна','2000.02.03','Пономаренко Д.М.','sss1@gmail.com','0930101011','АТП-55',10,'Англійська','Математика'),
--('Черкаси','Україна','2001.04.03','Дмитренко В.М.','sss2@gmail.com','0930101012','АТП-55',8,'Англійська','Математика'),
--('Париж','Франція','2004.06.07','Василенко К.М.','sss3@gmail.com','0930101013','АТП-56',5.54,'Фізика','Геометрія'),
--('Варшава','Польща','2002.12.23','Онопрієнко Д.П.','sss4@gmail.com','0930101014','АТП-56',10.5,'Історія','Англійська'),
--('Варшава','Польща','2006.02.03','Сидоренко В.Н.','sss5@gmail.com','0930101015','АТП-55',12,'Англійська','Математика')


--■ Відображати всієї інформації з таблиці зі студентами та оцінками.
--select *
--from STUDENT_PERFORMANCE

--■ Відображати ПІБ усіх студентів.
--select Name_student
--from STUDENT_PERFORMANCE

--■ Відображати усіх середніх оцінок.
--select Name_student,Average_score_All_subjects
--from STUDENT_PERFORMANCE

--■ Показати ПІБ усіх студентів з мінімальною оцінкою, більшою, ніж зазначена.
--select Name_student
--from STUDENT_PERFORMANCE
--where Average_score_All_subjects > 8

--■ Показати країни студентів. Назви країн мають бути унікальними.
--select distinct Country
--from STUDENT_PERFORMANCE

--■ Показати міста студентів. Назви міст мають бути унікальними.
--select distinct City
--from STUDENT_PERFORMANCE

--■ Показати назви груп. Назви груп мають бути унікальними.
--select distinct Name_group
--from STUDENT_PERFORMANCE
DROP TABLE Cinema;
DROP TABLE Customer;
DROP TABLE Movie;
DROP TABLE Employee;
DROP TABLE Hall;
DROP TABLE Screening;
DROP TABLE Member;
DROP TABLE Ticket;



CREATE TABLE Cinema
(
	Cinema_ID 	CHAR(5) not null,
	Cinema_Name	VARCHAR(50),
	
	PRIMARY KEY (Cinema_ID)
);

Select * FROM Cinema;

CREATE TABLE Customer
(
	Cust_ID			INT not null,
	Cust_Name		VARCHAR(50),
	Cust_Gender		CHAR(1) CHECK (Cust_Gender IN ('M','F')),
	Cust_Phone_No	CHAR(11),
	Cust_Email		VARCHAR(50),
	
	PRIMARY KEY (Cust_ID)
);

Select * FROM Customer;

CREATE TABLE Movie
(
	Movie_ID			CHAR(5) not null,
	Movie_Name			VARCHAR(50),
	Movie_Genre			VARCHAR(10),
	Movie_Duration		INT,
	Movie_Language		VARCHAR(20),
	Movie_Age_Rating	VARCHAR(5),
	Movie_Price			DECIMAL(4,2),
	
	PRIMARY KEY (Movie_ID)
);

Select * FROM Movie;

CREATE TABLE Employee
(
	Emp_ID			CHAR(5) not null,
	Emp_Name		VARCHAR(50),
	Emp_Position	VARCHAR(20),
	Emp_Phone_No	CHAR(11),
	Cinema_ID		CHAR(5) not null,
	
	PRIMARY KEY (Emp_ID),
	FOREIGN KEY(Cinema_ID) REFERENCES Cinema
);

Select * FROM Employee;

CREATE TABLE Hall
(
	Hall_No			CHAR(4) not null,
	Hall_Type		VARCHAR(10),
	Hall_Capacity	INT not null,
	Movie_ID		CHAR(5) not null,
	Cinema_ID		CHAR(5) not null,
	
	PRIMARY KEY (Hall_No),
	FOREIGN KEY(Movie_ID) REFERENCES Movie,
	FOREIGN KEY(Cinema_ID) REFERENCES Cinema
);

Select * FROM Hall;

CREATE TABLE Screening
(
	Hall_No			CHAR(4) not null,
	Movie_ID		CHAR(5) not null,
	Screening_Date	DATE,
	Screening_Time	CHAR(8),
	
	PRIMARY KEY (Hall_No, Movie_ID),
	FOREIGN KEY(Hall_No) REFERENCES Hall,
	FOREIGN KEY(Movie_ID) REFERENCES Movie
);

Select * FROM Screening;

CREATE TABLE Member
(
	Member_ID		CHAR(5) not null,
	Member_Exp_Date	DATE,
	Member_Type		VARCHAR(10),
	Member_Status	VARCHAR(10) CHECK(Member_Status IN('Active','Not Active')),
	Cust_ID			INT not null,
	
	PRIMARY KEY (Member_ID),
	FOREIGN KEY(Cust_ID) REFERENCES Customer
);

Select * FROM Member;

CREATE TABLE Ticket
(
	Ticket_ID				INT not null,
	Cust_ID					INT not null,
	Movie_ID				CHAR(5) not null,
	Hall_No					CHAR(4) not null,
	Seat_No					VARCHAR(50) not null,
	Seat_Quantity			INT not null,
	Ticket_Payment_Method	VARCHAR(20) not null,

		
	PRIMARY KEY (Ticket_ID, Cust_ID),
	FOREIGN KEY(Cust_ID) REFERENCES Customer,
	FOREIGN KEY(Hall_No) REFERENCES Hall,
	FOREIGN KEY(Movie_ID) REFERENCES Movie
);


Select * FROM Ticket;

INSERT INTO Cinema VALUES	
('C-001','TGSCV Dpulze Cyberjaya'),
('C-002','TGSCV 1Utama'),
('C-003','TGSCV Berjaya Times Square');

Select * FROM Cinema;

INSERT INTO Customer VALUES	
(100,'James Cameron','M','0122127130','jamestitanic123@gmail.com'),
(101,'Steven Spielberg','M','0172216548','ilovejurassicpark@outlook.com'),
(102,'J.J.Abrams','M','0146436110','jjabrams@yahoo.com'),
(103,'Boba Fett','M','0125176084','boba4starwars@gmail.com'),
(104,'Chewbacca','M','0122982804','chewchew@gmail.com'),
(105,'Rey Skywalker','F','01159523201','reyskywalker@outlook.com'),
(106,'Yoda','M','01169328361','jedimaster@gmail.com'),
(107,'Michael Bay','M','0176217188','boomeverywhere@outlook.com'),
(108,'Thomas Shelby','M','0172981048','peakyblinders@gmail.com'),
(109,'Hanna Haimizan','F','01139875173','hannaham@gmail.com');

Select * FROM Customer;

INSERT INTO Movie VALUES	
('M-001','Transformers: Rise Of The Beasts','Action',127,'ENG','P12',12.00),
('M-002','The Flash','Action',144,'ENG','P12',20.00),
('M-003','Elemental','Animation',109,'ENG','P12',15.00),
('M-004','Polis Evo 3','Action',113,'BM','13',18.00),
('M-005','Spider-Man: Across the Spider-Verse','Animation',141,'ENG','P12',25.50),
('M-006','No Hard Feelings','Comedy',104,'ENG','18',15.00),
('M-007','The Little Mermaid','Fantasy',136,'ENG','P12',12.00),
('M-008','Fast X','Action',141,'ENG','13',22.50),
('M-009','The Boogeyman','Horror',99,'ENG','13',17.00),
('M-010','Anwar : The Untold Story','Drama',99,'BM','13',16.00);

Select * FROM Movie;

INSERT INTO Employee VALUES	
('E-001','Chris Pratt','Branch Manager','0163127130','C-001'),
('E-002','Zoe Saldana','Branch Manager','0172216338','C-002'),
('E-003','Ryan Reynolds','Branch Manager','0146436888','C-003'),
('E-004','Vin Diesel','Supervisor','0138468794','C-001'),
('E-005','James Brown','Supervisor','0177568423','C-002'),
('E-006','Robert Duvall','Supervisor','0141547826','C-003'),
('E-007','Mary Mounser','Crew Leader','0167524389','C-001'),
('E-008','Wlliam Zabka','Crew Leader','0163248957','C-002'),
('E-009','Michael Jordan','Crew Leader','0124586732','C-003'),
('E-010','Ashley Benson','Cashier','0197558423','C-001'),
('E-011','Michelle Yeoh','Cashier','0167896523','C-001'),
('E-012','Joshua Yatt','Cashier','0179986655','C-002'),
('E-013','George Clooney','Cashier','0142559987','C-002'),
('E-014','Mark Ruffalo ','Cashier','0171125665','C-003'),
('E-015','Nancy Pelosi','Cashier','0169877899','C-003'),
('E-016','Benjamin Bratt','Crew','01125618526','C-001'),
('E-017','Jennifer Lawrence','Crew','0132211306','C-001'),
('E-018','Daniel Craig','Crew','0136895452','C-001'),
('E-019','Charles Darwin','Crew','0127789954','C-001'),
('E-020','Anthony Davis','Crew','0136545566','C-001'),
('E-021','Kelly Potter','Crew','01172556886','C-002'),
('E-022','Amaris Hanna','Crew','0171317131','C-002'),
('E-023','Danny Madden','Crew','0148886446','C-002'),
('E-024','Kristopher Ferrell','Crew','014466838','C-002'),
('E-025','Kayleigh Bernard','Crew','0168876654','C-002'),
('E-026','Leah Velasquez','Crew','0145589902','C-003'),
('E-027','Terry Boyer','Crew','0128895622','C-003'),
('E-028','Cameron Haley','Crew','0168859903','C-003'),
('E-029','Demetrius Cooley','Crew','0197332550','C-003'),
('E-030','Abigail Hoffman','Crew','0178831009','C-003');

Select * FROM Employee;

INSERT INTO Hall VALUES	
('D-01','DB',60,'M-008','C-001'),
('D-02','DA BIG',100,'M-001','C-001'),
('D-03','2D',150,'M-002','C-001'),
('U-01','IMAX',100,'M-005','C-002'),
('U-02','2D',120,'M-003','C-002'),
('U-03','2D',80,'M-010','C-002'),
('B-01','DB',60,'M-009','C-003'),
('B-02','2D',120,'M-007','C-003'),
('B-03','2D',150,'M-006','C-003');

Select * FROM Hall;

INSERT INTO Screening VALUES	
('D-01','M-008','2023-06-06','09:30 AM'),
('D-02','M-006','2023-06-06','02:30 PM'),
('D-03','M-003','2023-06-06','05:00 PM'),
('D-01','M-001','2023-06-08','02:30 PM'),
('D-02','M-004','2023-06-08','05:00 PM'),
('D-03','M-002','2023-06-08','05:00 PM'),
('U-01','M-007','2023-06-06','02:30 PM'),
('U-02','M-009','2023-06-06','02:30 PM'),
('U-03','M-005','2023-06-06','05:00 PM'),
('U-01','M-010','2023-06-08','02:30 PM'),
('U-02','M-006','2023-06-08','02:30 PM'),
('U-03','M-008','2023-06-08','05:00 PM'),
('B-01','M-003','2023-06-06','02:30 PM'),
('B-02','M-004','2023-06-06','02:30 PM'),
('B-03','M-002','2023-06-06','05:00 PM'),
('B-01','M-001','2023-06-08','02:30 PM'),
('B-02','M-005','2023-06-08','02:30 PM'),
('B-03','M-009','2023-06-08','05:00 PM');

Select * FROM Screening;

INSERT INTO Member VALUES 	
('A-006','2025-12-31','Silver','Active',100),
('A-003','2023-01-29','Gold','Not Active',101),
('A-005','2025-12-15','Platinum','Active',102),
('A-002','2022-06-08','Platinum','Not Active',106),
('A-004','2024-04-25','Silver','Active',108),
('A-001','2020-08-17','Gold','Not Active',109);

Select * FROM Member;

INSERT INTO Ticket VALUES 	
(000001,100,'M-001','D-01','H05,H06',2,'TnG Wallet'),
(000002,101,'M-008','D-02','C01,C02,C03',3,'VISA'),
(000003,109,'M-002','B-03','D11,D12',2,'CASH'),
(000004,105,'M-009','U-01','C01,C02,C03',3,'VISA'),
(000005,103,'M-004','U-03','D11,D12',2,'VISA'),
(000006,102,'M-005','U-02','C01,C02,C03',3,'VISA'),
(000007,108,'M-010','D-03','D11,D12',2,'CASH'),
(000008,107,'M-006','B-02','C01,C02,C03',3,'VISA'),
(000009,106,'M-007','U-01','D11,D12',2,'CASH'),
(000010,104,'M-003','B-01','C01,C02,C03',3,'VISA');

Select * FROM Ticket;


SELECT Movie_Genre,CAST(AVG(Movie_Price) AS decimal(6,2)) AS AVG_MOVIE_PRICE
FROM Movie
GROUP BY Movie_Genre;

SELECT Movie_Name, MAX(Movie_Price)
FROM Movie 
GROUP BY Movie_Name;

SELECT Movie_Name, MIN(Movie_Price) 
FROM Movie 
GROUP BY Movie_Name;

SELECT Screening_Date, COUNT(Screening_Date) AS Total_Screening_Date
FROM Screening 
GROUP BY Screening_Date;

SELECT SUM(Hall_Capacity) AS Capacity
FROM Hall
WHERE Cinema_ID = 'C-001';

ALTER TABLE Ticket
ADD Ticket_Price DECIMAL(6,2);
UPDATE Ticket
SET Ticket_Price = Seat_Quantity * (SELECT Movie_Price FROM Movie WHERE Movie.Movie_ID = Ticket.Movie_ID);

SELECT * FROM Ticket;

DROP TRIGGER Calculate2;

CREATE TRIGGER Calculate2
AFTER INSERT ON Ticket
FOR EACH ROW MODE DB2SQL
	UPDATE Ticket
	SET Ticket_Price = Seat_Quantity * (SELECT Movie_Price FROM Movie WHERE Movie.Movie_ID = Ticket.Movie_ID);

INSERT INTO Ticket
VALUES 	(000011,100,'M-001','D-01','H07,H08',2,'CASH',1.00);

SELECT * FROM Ticket;

DROP VIEW CustomerView;

CREATE VIEW CustomerView AS
SELECT T.Ticket_ID, T.Cust_ID, T.Movie_ID, T.Hall_No, T.Seat_No, T.Seat_Quantity, T.Ticket_Payment_Method, T.Ticket_Price,
       S.Screening_Date, S.Screening_Time,
       M.Movie_Name, M.Movie_Genre
FROM Ticket T
INNER JOIN Screening S ON T.Hall_No = S.Hall_No AND T.Movie_ID = S.Movie_ID
INNER JOIN Movie M ON T.Movie_ID = M.Movie_ID;

Select * FROM CustomerView;

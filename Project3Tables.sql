--tables

SET ECHO ON

-- Create the log file 
SPOOL DBcreate.log;


DROP TABLE Distributor CASCADE CONSTRAINT;
DROP TABLE WholesalePurchase CASCADE CONSTRAINT;
DROP TABLE Movie CASCADE CONSTRAINT;
DROP TABLE DVD CASCADE CONSTRAINT;
DROP TABLE VHS CASCADE CONSTRAINT;
DROP TABLE Customer CASCADE CONSTRAINT;
DROP TABLE Rental CASCADE CONSTRAINT;
DROP TABLE Fees CASCADE CONSTRAINT;
DROP TABLE Actor CASCADE CONSTRAINT;
DROP TABLE Director CASCADE CONSTRAINT;
DROP TABLE Award CASCADE CONSTRAINT;
DROP TABLE Credits CASCADE CONSTRAINT;



--create 
CREATE TABLE Distributor (
	DistributorID 		NUMBER(11)		NOT NULL,
	CompanyName			VARCHAR2(20)	NOT NULL,
	PhoneNumber			NUMBER(10),
	CONSTRAINT Distributor_PK PRIMARY KEY (DistributorID));
	
COMMIT;

--create 
CREATE TABLE WholesalePurchase (
	SerialNumber 		NUMBER(11)		NOT NULL,
	DistributorID		NUMBER(11)		NOT NULL,
	DVDPrice			NUMBER(10),
	VHSPrice			NUMBER(10),
	CONSTRAINT WholesalePurchase_PK PRIMARY KEY (SerialNumber),
	CONSTRAINT WholesalePurchase_FK FOREIGN KEY (DistributorID) REFERENCES Distributor(DistributorID));
	
COMMIT;

--create 
CREATE TABLE Movie (
	MovieID		 		NUMBER(11)		NOT NULL,
	Title				VARCHAR2(40)	NOT NULL,
	MovieLength			NUMBER(3),
	MovieGenre			VARCHAR2(10),
	MoiveRating			NUMBER(3),
	MovieReleaseYear	NUMBER(4),
	CONSTRAINT Movie_PK PRIMARY KEY (MovieID));
	
COMMIT;


--create 
CREATE TABLE DVD (
	Quantity	 		NUMBER(11),
	Price				NUMBER(4));
	
COMMIT;


--create 
CREATE TABLE VHS (
	Quantity	 		NUMBER(11),
	Price				NUMBER(4));
	
COMMIT;


--create 
CREATE TABLE Customer (
	CustomerID	 		NUMBER(11)		NOT NULL,
	CustomerFirstName	VARCHAR2(20)	NOT NULL,
	CustomerLastName 	VARCHAR2(20)	NOT NULL,
	Address				VARCHAR2(20),
	City				VARCHAR2(10),
	ST 					VARCHAR2(2),
	ZipCode				NUMBER(5),
	PhoneNumber			NUMBER(10),
	TotalMoviesRented	Number(3),
	CONSTRAINT Customer_PK PRIMARY KEY (CustomerID));
	
COMMIT;


--create 
CREATE TABLE Rental (
	RentalID	 		NUMBER(11)		NOT NULL,
	MovieID				NUMBER(11)		NOT NULL,
	CustomerID			NUMBER(11)		NOT NULL,
	RentalFee			NUMBER(4),
	Status				VARCHAR2(10),
	RentalDate			DATE default sysdate,
	CONSTRAINT Rental_PK PRIMARY KEY (RentalID),
	CONSTRAINT Rental_FK FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
	CONSTRAINT Rental_FK2 FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID));
	
COMMIT;


--create 
CREATE TABLE Fees (
	FeesID				NUMBER(11)		NOT NULL,
	RentalID 			NUMBER(11)		NOT NULL,
	LateFee				NUMBER(4),
	DamageFee			NUMBER(4),
	RewindFee			NUMBER(4),
	CONSTRAINT Fees_PK PRIMARY KEY (FeesID),
	CONSTRAINT Fees_FK FOREIGN KEY (RentalID) REFERENCES Rental(RentalID));
	
COMMIT;
	
	
--create 
CREATE TABLE Actor (
	ActorID 			NUMBER(11)		NOT NULL,
	ActorName			VARCHAR2(20)	NOT NULL,
	CONSTRAINT Actor_PK PRIMARY KEY (ActorID));	

COMMIT;


--create 
CREATE TABLE Director (
	DirectorID 			NUMBER(11)		NOT NULL,
	DirectorName		VARCHAR2(20)	NOT NULL,
	CONSTRAINT Director_PK PRIMARY KEY (DirectorID));	

COMMIT;


--create 
CREATE TABLE Award (
	AwardID 			NUMBER(11)		NOT NULL,
	YearWon				NUMBER(4),
	CONSTRAINT Award_PK PRIMARY KEY (AwardID));	

COMMIT;


--create 
CREATE TABLE Credits (
	CreditsID			NUMBER(11)		NOT NULL,
	MovieID		 		NUMBER(11)		NOT NULL,
	ActorID 			NUMBER(11),
	DirectorID 			NUMBER(11),
	AwardID 			NUMBER(11),
	CONSTRAINT Credits_PK PRIMARY KEY (CreditsID),
	CONSTRAINT Credits_FK2 FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
	CONSTRAINT Credits_FK3 FOREIGN KEY (ActorID) REFERENCES Actor(ActorID),
	CONSTRAINT Credits_FK4 FOREIGN KEY (DirectorID) REFERENCES Director(DirectorID),
	CONSTRAINT Credits_FK5 FOREIGN KEY (AwardID) REFERENCES Award(AwardID));	

COMMIT;



-- Close the log file
SPOOL OFF










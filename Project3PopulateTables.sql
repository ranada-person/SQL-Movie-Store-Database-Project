SPOOL Inputs.log;

DELETE FROM Distributor;
DELETE FROM WholesalePurchase;
DELETE FROM Movie;
DELETE FROM DVD;
DELETE FROM VHS;
DELETE FROM Customer;
DELETE FROM Rental;
DELETE FROM Fees;
DELETE FROM Actor;
DELETE FROM Director;
DELETE FROM Award;
DELETE FROM Credits;


--create 
INSERT INTO Distributor
(DistributorID, CompanyName, PhoneNumber)
VALUES(00000001, 'Movies 101', 1234567891);
INSERT INTO Distributor
VALUES(00000002, '411Movies', 1234567891);
INSERT INTO Distributor
VALUES(00000003, 'MoviesRUs', 1234567891);
INSERT INTO Distributor
VALUES(00000004, 'GrandCentralMovie', 1234567891);
INSERT INTO Distributor
VALUES(00000005, 'PeppyKittyMovies', 1234567891);

COMMIT;


--create 
INSERT INTO WholesalePurchase
(SerialNumber, DistributorID, DVDPrice, VHSPrice)
VALUES(10000000, 00000002, 100, 50);
INSERT INTO WholesalePurchase
VALUES(20000000, 00000005, 200, 40);
INSERT INTO WholesalePurchase
VALUES(30000000, 00000001, 500, 70);
INSERT INTO WholesalePurchase
VALUES(40000000, 00000004, 200, 10);
INSERT INTO WholesalePurchase
VALUES(50000000, 00000003, 600, 30);

COMMIT;


--create 
INSERT INTO Movie
(MovieID, Title, MovieLength, MovieGenre, MoiveRating, MovieReleaseYear)
VALUES(10000001, 'The Forgotton Man' , 96, 'Suspence', 85, 1990);
INSERT INTO Movie
VALUES(10000002, 'The Wild World' , 88, 'Adventure', 80, 2009);
INSERT INTO Movie
VALUES(10000003, 'The Wing Secret' , 102, 'Comedy', 65, 2013);
INSERT INTO Movie
VALUES(10000004, 'The Wizards of the Moon' , 110, 'Horror', 78, 1995);
INSERT INTO Movie
VALUES(10000005, 'The Weeping Gift' , 99, 'Comedy', 66, 2000);

COMMIT;


--create 
INSERT INTO DVD
(Quantity, Price)
VALUES(75, 10);
INSERT INTO DVD
VALUES(25, 8);
INSERT INTO DVD
VALUES(100, 12);
INSERT INTO DVD
VALUES(100, 8);
INSERT INTO DVD
VALUES(50, 10);

COMMIT;


--create 
INSERT INTO VHS
(Quantity, Price)
VALUES(50, 4);
INSERT INTO VHS
VALUES(99, 5);
INSERT INTO VHS
VALUES(100, 5);
INSERT INTO VHS
VALUES(50, 2);
INSERT INTO VHS
VALUES(50, 4);

COMMIT;


--create 
INSERT INTO Customer
(CustomerID, CustomerFirstName, CustomerLastName, Address, City, ST, ZipCode, PhoneNumber, TotalMoviesRented)
VALUES(100100, 'David', 'Levy', '546 Fellows St', 'Ft Collins', 'CO', 80521, 9703219852, 12);
INSERT INTO Customer
VALUES(100110, 'Robyn', 'Reeves', '4534 Clarke Ave', 'Loveland', 'CO', 80528, 9706598543, 65);
INSERT INTO Customer
VALUES(100120, 'Ellen', 'Lutz', '8654 McKee Rd', 'Broomfield', 'CO', 80221, 9705624586, 51);
INSERT INTO Customer
VALUES(100130, 'Hector', 'Howarth', '56 Giles Blvd', 'Longmont', 'CO', 80501, 9701234861, 2);
INSERT INTO Customer
VALUES(100140, 'Willa', 'Brett', '46 Loren Rd', 'Windsor', 'CO', 80550, 9725624956, 22);

COMMIT;


--create 
INSERT INTO Rental
(RentalID, MovieID, CustomerID, RentalFee, Status, RentalDate)
VALUES(00000000001, 10000001, 100110, 12, 'Out', '22-Apr-2000');
INSERT INTO Rental
VALUES(00000000002, 10000002, 100100, 9, 'Returned', '11-Feb-2000');
INSERT INTO Rental
VALUES(00000000003, 10000003, 1100140, 15, 'Out', '24-JAN-2000');
INSERT INTO Rental
VALUES(00000000004, 10000002, 100130, 6, 'Returned', '29-MAR-2000');
INSERT INTO Rental
VALUES(00000000005, 10000005, 100130, 6, 'Returned', '20-APR-2000');

COMMIT;


--create 
INSERT INTO Fees
(FeesID, RentalID, LateFee, DamageFee, RewindFee)
VALUES(001, 00000000001, null, null, null);
INSERT INTO Fees
VALUES(002, 00000000002, 3, 6, null);
INSERT INTO Fees
VALUES(003, 00000000003, null, 6, 2);
INSERT INTO Fees
VALUES(004, 00000000004, 3, null, null);
INSERT INTO Fees
VALUES(005, 00000000005, null, null, 2);

COMMIT;


--create 
INSERT INTO Actor
(ActorID, ActorName)
VALUES(0000100, 'Sonia Pittman');
INSERT INTO Actor
VALUES(0000200, 'Carl Pierce');
INSERT INTO Actor
VALUES(0000300, 'Kathleen Green');
INSERT INTO Actor
VALUES(0000400, 'Sara Alvarez');
INSERT INTO Actor
VALUES(0000500, 'Rufus Miller');

COMMIT;


--create 
INSERT INTO Director
(DirectorID, DirectorName)
VALUES(10, 'Stella Weber');
INSERT INTO Director
VALUES(11, 'Latoya Watkins');
INSERT INTO Director
VALUES(12, 'Ronnie Turner');
INSERT INTO Director
VALUES(13, 'Adam Curry');
INSERT INTO Director
VALUES(14, 'Joanna Stone');

COMMIT;


--create 
INSERT INTO Award
(AwardID, YearWon)
VALUES(00110, 2001);
INSERT INTO Award
VALUES(00220, 2014);
INSERT INTO Award
VALUES(00330, 1992);
INSERT INTO Award
VALUES(00440, 1999);
INSERT INTO Award
VALUES(00550, 2010);

COMMIT;


--create 
INSERT INTO Credits
(CreditsID, MovieID, ActorID, DirectorID, AwardID)
VALUES(000001, 10000001, 0000400, 10, 00110);
INSERT INTO Credits
VALUES(000002, 10000002, 0000100, 13, 00550);
INSERT INTO Credits
VALUES(000003, 10000003, 0000300, 10, 00220);
INSERT INTO Credits
VALUES(000004, 10000004, 0000500, 14, 00440);
INSERT INTO Credits
VALUES(000005, 10000005, 0000200, 10, 00330);

COMMIT;




SPOOL OFF

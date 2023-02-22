create database Project;
Use Project;
create table Org
(
OrgID int not null,
OrgName varchar(50),
OrgAge int not null,
OrgChamp int,
OrgPayroll int not null, 
OrgColors varchar(50),
OrgMascotName varchar(20),

constraint Organization_PK primary key (OrgID)
);

create table Arena
(
ArenaID int not null,
OrgID int not null,
ArenaName varchar(20),
ArenaAge int not null,
ArenaOpenDate DATE, 
ArenaAddress varchar(100),
ArenaSponsor varchar(100),
ArenaSeatCap int not null,

constraint Arena_PK primary key (ArenaID),
constraint Organization_FK foreign key (OrgID) references Org(OrgID)
);

create table FrontOffice
(
FrontID int not null,
OrgID int not null,
FrontFirstName varchar(50),
FrontLastName varchar(50),
FrontCollege varchar (100), 
FrontAge int not null,
FrontPosition varchar(40),

constraint Front_PK primary key (FrontID),
constraint Organization_FK2 foreign key (OrgID) references Org(OrgID)
);

create table City
(
CityID int not null,
OrgID int not null,
CityName varchar(100),
CityAge int not null, 
CityState varchar(100),
CityCountry varchar(100),
CityMarket varchar(100),

constraint City_PK primary key (CityID),
constraint Organization_FK3 foreign key (OrgID) references Org(OrgID)
);

create table Player
(
PlayerID int not null,
OrgID int not null,
CoachID int not null,
PlayerName varchar(100),
PlayerHeight int not null, 
PlayerPosition varchar(100),
PlayerPreviousTeam varchar(100),
PlayerCollege varchar(100),
PlayerNumber int not null,
PlayerSalary int not null,
PlayerPointsPerGame DECIMAL(5,2) not null,

constraint Player_PK primary key (PlayerID),
constraint Organization_FK4 foreign key (OrgID) references Org(OrgID),
constraint Coach_FK2 foreign key (CoachID) references Coach(CoachID)
);

create table Coach
(
CoachID int not null,
OrgID int not null,
CoachName varchar(20),
CoachAge int not null,
CoachStyle varchar(100), 
CoachPreviousTeam varchar(100),
CoachContractDuration int not null,

constraint Coach_PK primary key (CoachID),
constraint Organization_FK5 foreign key (OrgID) references Org(OrgID)
);
Insert INTO Org (OrgID,OrgName,OrgAge,OrgChamp,OrgPayroll,OrgColors,OrgMascotName) VALUES
(1,'Golden State Warriors',76,7,193374192,'Blue and Gold',NULL),
(2,'Los Angeles Lakers',75,16,168350950,'Purple and Yellow',NULL),
(3,'Portland Trailblazers',52,1,150010399,'Black, Red and White','Blaze the Trail Cat'),
(4,'Sacramento Kings',99,0,134813254,'Purple, Silver, Black and White','Slamson the Lion'),
(5,'Phoenix Suns',54,0,166252588,'Orange, Purple and Black','The Suns Gorilla');
Insert INTO Arena (ArenaID,OrgID,ArenaName,ArenaAge,ArenaOpenDate,ArenaAddress,ArenaSponsor,ArenaSeatCap) VALUES
(1,1,'Chase Center',3,'2019-09-06','1 Warriors Way','Accenture, Pepsi, United Airlines',18064),
(2,2,'Cypto.com Arena',23,'1999-10-17','1111 S Figueroa St','Crypto.com',19067),
(3,3,'Golden 1 Center',6,'2016-09-30','500 David J Stern Walk','Golden 1',17608),
(4,4,'Footprint Center',30,'1992-06-06','201 E Jefferson St','Footprint, Paypal',18064),
(5,5,'Moda Center', 27,'1995-10-12','1 N Center Ct St','Moda',19980);
Insert INTO FrontOffice (FrontID,OrgId,FrontFirstName,FrontLastName,FrontCollege,FrontAge,FrontPosition) VALUES
(1,1,'Bob','Myers','UCLA',47,'General Manager'),
(2,2,'Rob','Pelinka','University of Michigan',52,'General Manager'),
(3,2,'Jeanie','Buss','USC',61,'Executive'),
(4,3,'Micheal','Winger','University of Miami',42,'General Manager'),
(5,4,'Monte','McNair','Princeton',38,'General Manager'),
(6,5,'James','Jones','University of Miami',42,'General Manager');
Insert INTO City (CityID,OrgID,CityName,CityAge,CityState,CityCountry,CityMarket) VALUES
(1,1,'San Francisco',246,'California','United States of America','Large'),
(2,2,'Los Angeles',241,'California','United States of America','Large'),
(3,3,'Portland',171,'Oregon','United States of America','Medium'),
(4,4,'Sacramento',172,'California','United States of America','Small'),
(5,5,'Phoenix',141,'Arizona','United States of America','Medium');
Insert INTO Coach (CoachID,OrgID,CoachName,CoachAge,CoachStyle,CoachPreviousTeam,CoachContractDuration) VALUES
(1,1,'Steve Kerr',57,'Movement and Shooting','Suns',5),
(2,4,'Mike Brown',52,'Defense and Shooting','Warriors',4),
(3,5,'Monty Williams',51,'Pick & Roll and Rebounding','Pelicans',6),
(4,2,'Darvin Ham',49,'Defense and Shooting','Bucks',4),
(5,3,'Chauncey Billups',46,'Shooting','Clippers',5);
Insert INTO Player(PlayerID,OrgID,CoachID,PlayerName,PlayerHeight,PlayerPosition,PlayerPreviousTeam,PlayerCollege,PlayerNumber,PlayerSalary,PlayerPointsPerGame) VALUES
(1,1,1,'Stephen Curry','6 feet 2 inches','Guard',NULL,'Davidson',30,48070014,30.0),
(2,1,1,'Andrew Wiggins','6 feet 7 inches','Forward','Timberwolves','Kansas',22,33616770,19.1),
(3,1,1,'Klay Thompson','6 feet 6 inches','Guard',NULL,'Washington State',11,40600080,18.7),
(4,1,1,'Jordan Poole','6 feet 4 inches','Guard',NULL,'Michigan',3,3901399,17.9),
(5,1,1,'Draymond Green','6 feet 6 inches','Forward',NULL,'Michigan State',23,25806468,8.1),
(6,1,1,'Jonathan Kuminga','6 feet 7 inches','Foward','G League Ignite',NULL,00,5739840,7.4),
(7,1,1,'James Wiseman','7 feet 0 inches','Center',NULL,'Memphis',33,9603360,6.5),
(8,1,1,'Kevon Looney','6 feet 9inches','Center',NULL,'UCLA',5,8000000,6.3),
(9,2,4,'Anthony Davis','6 feet 10 inches','Forward-Center','Pelicans','Kentucky',3,37980720,28.1),
(10,2,4,'Lebron James','6 feet 9 inches','Forward','Cavaliers',Null,6,44474988,26.5),
(11,2,4,'Lonnie Walker','6 feet 4 inches','Guard','Pelicans','Kentucky',4,6479000,15.7),
(12,2,4,'Russel Westbrook','6 feet 3 inches','Guard','Wizards','UCLA',0,47063478,14.7),
(13,2,4,'Austin Reaves','6 feet 5 inches','Guard',Null,'Oklahoma',15,1563518,10.6),
(14,2,4,'Thomas Bryant','6 feet 10 inches','Center-Foward','Wizards','Indiana',31,1968175,8.5),
(15,2,4,'Troy Brown Jr','6 feet 7 inches','Guard-Forward','Bulls','Oregon',7,1968175,6.9),
(16,2,4,'Kendrick Nunn','6 feet 3 inches','Guard','Heat','Oakland',12,5250000,5.3),
(17,3,5,'Damian Lillard','6 feet 2 inches','Guard',Null,'Weber State',0,42492492,28.8),
(18,3,5,'Anfernee Simons','6 feet 3 inches','Guard',Null,Null,1,22321429,23.7),
(19,3,5,'Jerami Grant','6 feet 8 inches','Forward','Pistons','Syracuse',9,20955000,22.4),
(20,3,5,'Jusuf Nurkic','7 feet 0 inches','Center','Nuggets','Cedevota',27,15625000,14.5),
(21,4,2,'DeAaron Fox','6 feet 3 inches','Guard',Null,'Kentucky',5,30351780,22.5),
(22,4,2,'Domantas Sabonis','7 feet 1 inches','Forward-Center','Pacers','Gonzaga',10,18500000,17.5),
(23,4,2,'Kevin Huerter','6 feet 7 inches','Guard-Forward','Hawks','Maryland',9,14508929,15.3),
(24,4,2,'Malik Monk','6 feet 3 inches','Guard','Lakers','Kentucky',0,9472219,14.9),
(25,5,3,'Devin Booker','6 feet 5 inches','Guard',Null,'Kentucky',1,338334000,27.4),
(26,5,3,'Deandre Ayton','7 feet 0 inches','Center',Null,'Arizona',22,30913750,17.0),
(27,5,3,'Mikal Bridges','6 feet 6 inches','Forward',Null,'Villanova',25,20100000,15.9),
(28,5,3,'Cameron Johnson','6 feet 8 inches','Forward',Null,'North Carolina',23,5887899,13.0);

Select Org.OrgID, Org.OrgName, Org.OrgColors
From Org
Where OrgColors LIKE '%Black%';

Select Org.OrgID,Org.OrgName,Coach.CoachID,Coach.CoachName,Coach.CoachStyle
From Org INNER JOIN Coach on Org.OrgID = Coach.CoachID 
Where Coach.CoachStyle LIKE '%Shooting%';

Select Org.OrgName,Player.PlayerName,Player.PlayerHeight,Player.PlayerPosition,Player.PlayerPointsPerGame
From Player INNER JOIN Org on Player.OrgID = Org.OrgID
Where Player.PlayerPointsPerGame >= 17.5
Order By PlayerPointsPerGame DESC;

Select FrontOffice.FrontID, Org.OrgID,Org.OrgChamp,Org.OrgName,FrontOffice.FrontFirstName,FrontOffice.FrontLastName,Org.OrgPayRoll
From FrontOffice INNER JOIN Org on FrontOffice.OrgID = Org.OrgID 
Order by Org.OrgChamp DESC;

Select Org.OrgID,Org.OrgName,Arena.ArenaID,Arena.ArenaName,Arena.ArenaSeatCap,Arena.ArenaOpenDate,Arena.ArenaAge
From Org INNER JOIN Arena on Org.OrgID = Arena.OrgID
Where ArenaSeatCap > 18000;

Select City.CityName,City.CityAge,City.CityState,City.CityMarket,Org.OrgID,Org.OrgName
From City INNER JOIN Org on City.OrgID = Org.OrgID
Where City.CityMarket = 'Medium' OR City.CityMarket = 'Small';







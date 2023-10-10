-- Create the Solent Boat Database (SBD)
create database up2121342_cw;
-- Create the customer table 
CREATE TABLE CUSTOMER (
    CUST_ID SERIAL PRIMARY KEY NOT NULL,
    CUST_FNAME VARCHAR(25) NOT NULL,
    CUST_LNAME VARCHAR(35) NOT NULL,
    TELEPHONE char(11) NOT NULL,
    EMAIL VARCHAR(255) NOT NULL,
    ADDR1 VARCHAR(50) NOT NULL,
    ADDR2 VARCHAR(50),
    POSTCODE CHAR(9) NOT NULL,
    TOWN VARCHAR(60) NOT NULL
);
-- CREATE BOAT YARD TABLE 
CREATE TABLE BOAT_YARD(
    YARD_ID SERIAL NOT NULL,
    YARD_SIZE VARCHAR(10) NOT NULL,
    ADDR1 VARCHAR(50) NOT NULL,
    ADDR2 VARCHAR(50),
    POSTCODE CHAR(9) NOT NULL,
    TOWN VARCHAR(40) NOT NULL,
    PRIMARY KEY (YARD_ID)
);
-- CREATE THE BOAT DETAILS TABLE 
CREATE TABLE BOAT_DETAILS(
    BOAT_ID SERIAL NOT NULL,
    BOAT_NAME VARCHAR(40) NOT NULL,
    PRODUCTION_DATE DATE NOT NULL,
    FUEL_TYPE VARCHAR(30),
    BOAT_DIMENSIONS VARCHAR(30) NOT NULL,
    ENGINE_SIZE VARCHAR(20),
    CAPACITY INT NOT NULL,
    YARD_ID INT NOT NULL,
    PRIMARY KEY (BOAT_ID),
    FOREIGN KEY (YARD_ID) REFERENCES BOAT_YARD(YARD_ID)
);
--CREATE STAFF TABLE 
CREATE TABLE STAFF(
    STAFF_ID SERIAL NOT NULL,
    STAFF_FNAME VARCHAR(25) NOT NULL,
    STAFF_LNAME VARCHAR(35) NOT NULL,
    TELEPHONE char(11) NOT NULL,
    EMAIL VARCHAR(255) NOT NULL,
    ADDR1 VARCHAR(50) NOT NULL,
    ADDR2 VARCHAR(50),
    POSTCODE CHAR(9) NOT NULL,
    TOWN VARCHAR(60) NOT NULL,
    YARD_ID INT NOT NULL,
    PRIMARY KEY (STAFF_ID),
    FOREIGN KEY (YARD_ID) REFERENCES BOAT_YARD(YARD_ID)
);
--CREATE ROLES TABLE 
CREATE TABLE ROLES(
    ROLE_ID SERIAL PRIMARY KEY NOT NULL,
    ROLE_NAME VARCHAR(30) NOT NULL
);
--CREATE SERVICING TABLE 
CREATE TABLE SERVICING(
    SERVICE_ID SERIAL NOT NULL,
    COMPLETED BOOLEAN,
    SERVICE_DATE DATE NOT NULL,
    PART VARCHAR(50),
    YARD_ID INT NOT NULL,
    BOAT_ID INT NOT NULL,
    PRIMARY KEY (SERVICE_ID),
    FOREIGN KEY (YARD_ID) REFERENCES BOAT_YARD(YARD_ID),
    FOREIGN KEY (BOAT_ID) REFERENCES BOAT_DETAILS(BOAT_ID)
);
--CREATE STAFF_SERVICE LINK TABLE 
--THE STAFF AND SERVICE ENTITIES ARE BOTH PRIMARY AND FOREIGN KEYS IN THIS TABLE 
CREATE TABLE STAFF_SERVICE(
    STAFF_ID INT NOT NULL REFERENCES STAFF(STAFF_ID),
    SERVICE_ID INT NOT NULL REFERENCES SERVICING(SERVICE_ID),
    PRIMARY KEY (STAFF_ID, SERVICE_ID)
);
--CREATE STAFF_ROLE LINK TABLE 
--THE STAFF AND ROLE ENTITIES ARE BOTH PRIMARY AND FOREIGN KEYS IN THIS TABLE 
CREATE TABLE STAFF_ROLE(
    ROLE_ID INT NOT NULL REFERENCES ROLES(ROLE_ID),
    STAFF_ID INT NOT NULL REFERENCES STAFF(STAFF_ID),
    PRIMARY KEY (ROLE_ID, STAFF_ID)
);
--CREATE BOAT_CUST LINK TABLE
--THE BOAT AND CUSTOMER ENTITIES ARE BOTH PRIMARY AND FOREIGN KEYS IN THE TABLE 
CREATE TABLE BOAT_CUST(
    CUST_ID INT NOT NULL REFERENCES CUSTOMER(CUST_ID),
    BOAT_ID INT NOT NULL REFERENCES BOAT_DETAILS(BOAT_ID),
    PRIMARY KEY (CUST_ID, BOAT_ID)
);
--ALL CODE BELOW IS USED TO POPULATE EACH TABLE WITHIN THE DATABASE 

--ROLES 

INSERT INTO ROLES (ROLE_NAME) VALUES ('Manager');
INSERT INTO ROLES (ROLE_NAME) VALUES ('Glass Fibre Specialist');
INSERT INTO ROLES (ROLE_NAME) VALUES ('Engine Technician');
INSERT INTO ROLES (ROLE_NAME) VALUES ('General');
INSERT INTO ROLES (ROLE_NAME) VALUES ('Electrician');
INSERT INTO ROLES (ROLE_NAME) VALUES ('Technician');

--Customers 

insert into Customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Dusty', 'Baguley', '09232723546', 'dbaguley0@deviantart.com', '52 Sheridan Park', 'Suite 74', 'PO72 2F2', 'Dean');
insert into Customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Stefanie', 'Teall', '09739262771', 'steall1@shop-pro.jp', '023 Coolidge Place', null, 'PO92 9N2', 'East End');
insert into Customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Freddi', 'Borrel', '06495111177', 'fborrel2@google.ru', '7463 Green Pass', null, 'PO92 6D2', 'Twyford');
insert into Customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Arlinda', 'Long', '03101374710', 'along3@angelfire.com', '0987 Vidon Way', null, 'PO02 3U2', 'Liverpool');
insert into Customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Burl', 'Vallantine', '00015113538', 'bvallantine4@hc360.com', '3571 Briar Crest Trail', null, 'PO62 3P2', 'Brampton');
insert into Customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Bettine', 'Danihel', '07342428737', 'bdanihel5@ustream.tv', '241 Karstens Street', 'Apt 495', 'PO52 2H2', 'Twyford');
insert into Customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Elianore', 'Bruniges', '09962460510', 'ebruniges6@elegantthemes.com', '784 Hooker Court', null, 'PO82 5P2', 'Manchester');
insert into Customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Coreen', 'Parken', '07880128321', 'cparken7@bbc.co.uk', '557 Division Place', null, 'PO32 5G2', 'London');
insert into Customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Luella', 'Sisson', '09675249465', 'lsisson8@tripadvisor.com', '53 Maple Wood Trail', null, 'PO82 7O2', 'Newbiggin');
insert into Customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Augusta', 'Capron', '03735670798', 'acapron9@nhs.uk', '66 Steensland Road', null, 'PO72 5S2', 'Normanton');
insert into Customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Maura', 'MacKain', '06699247139', 'mmackaina@cnn.com', '03 Kropf Alley', null, 'PO82 5M2', 'Upton');
insert into Customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Tiffy', 'Dank', '08775191203', 'tdankb@topsy.com', '84324 Jana Plaza', null, 'PO52 7W2', 'London');
insert into customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Hedi', 'Draaisma', '09026187379', 'hdraaisma0@jimdo.com', '46 Morrow Park', null, 'PO63 7I7', 'Newbiggin');
insert into customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Abby', 'Fuller', '04524097233', 'afuller1@cnet.com', '3 Darwin Plaza', null, 'PO60 1L3', 'Kirkton');
insert into customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Grant', 'Guesford', '03137799432', 'gguesford2@is.gd', '236 Vernon Place', null, 'PO60 3D7', 'Thorpe');
insert into customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Marijo', 'Franceschielli', '04240182326', 'mfranceschielli3@businessweek.com', '2075 Messerschmidt Terrace', null, 'PO64 2O7', 'London');
insert into customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Jourdain', 'Harverson', '04719293579', 'jharverson4@marketwatch.com', '36 Vera Crossing', 'Suite 36', 'PO21 7U8', 'Twyford');
insert into customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Dacey', 'de Grey', '02405418486', 'ddegrey5@ycombinator.com', '198 Old Shore Plaza', null, 'PO76 5I5', 'Burnside');
insert into customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Osmund', 'Biasi', '06104207113', 'obiasi6@etsy.com', '026 Meadow Valley Street', null, 'PO90 8O1', 'London');
insert into customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Teena', 'Padilla', '05559401293', 'tpadilla7@plala.or.jp', '89 Mayer Trail', null, 'PO14 3B1', 'Church End');
insert into customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Jud', 'Cakes', '08363884242', 'jcakes8@youtube.com', '3 Jenifer Alley', null, 'PO56 3B3', 'Birmingham');
insert into customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Cyrill', 'Ziemke', '05742198622', 'cziemke9@youku.com', '700 Continental Way', null, 'PO78 4S7', 'Charlton');
insert into customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Gerrard', 'Paula', '00383941800', 'gpaulaa@chicagotribune.com', '8 Lotheville Hill', null, 'PO54 3T6', 'Dean');
insert into customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Corina', 'Jarry', '03756368975', 'cjarryb@webmd.com', '97473 Eliot Alley', null, 'PO33 6O2', 'Milton');
insert into customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Quintilla', 'Symcox', '03095074718', 'qsymcoxc@vkontakte.ru', '764 Scoville Circle', null, 'PO01 0D2', 'Normanton');
insert into customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Frances', 'Potten', '09617542413', 'fpottend@t.co', '42251 Cody Avenue', 'PO Box 96110', 'PO64 9Y5', 'Seaton');
insert into customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Papageno', 'Hyams', '01451127858', 'phyamse@java.com', '4837 Hansons Place', null, 'PO99 2K3', 'Pentre');
insert into customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Stafani', 'Pietsma', '08603650830', 'spietsmaf@networksolutions.com', '3594 Graedel Center', null, 'PO44 7Q5', 'Upton');
insert into customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Rosemarie', 'Hattam', '05081403898', 'rhattamg@samsung.com', '8 Texas Plaza', null, 'PO48 9C6', 'London');
insert into customer (cust_fname, cust_lname, telephone, email, addr1, addr2, postcode, town) values ('Ethelind', 'Childers', '02274658325', 'echildersh@barnesandnoble.com', '3027 Shopko Place', null, 'PO59 9Q9', 'Newbiggin');

--Boat_yard 


insert into boat_yard (yard_size, addr1, addr2, postcode, town) values ('Small', '7 Pleasure Place', 'Anthes', 'PO93 6I7','Portmouth');
insert into boat_yard (yard_size, addr1, addr2, postcode, town) values ('Medium', '6216 Kenwood Road', 'Westend', 'PO77 2P8', 'Port Solent');
insert into boat_yard (yard_size, addr1, addr2, postcode, town) values ('Medium', '43438 Prairie Rose Parkway', 'Independence', 'PO20 2U9','Gosport');
insert into boat_yard (yard_size, addr1, addr2, postcode, town) values ('Large', '1160 Darwin Place', 'Loomis', 'PO63 8C3','Portsmouth');

--Boat_details 

insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('finnmaster husky r6', '12/8/2020', 'petrol', '219" x 127" x 79"', '5584cc', 4, 1);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('windrider wrtango', '8/5/2009', null, '311" x 139" x 261"', null, 3, 2);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('cw hood 32', '9/20/2010', null, '307" x 156" x 269"', null, 3, 4);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('sea ray 19 spx', '9/14/2002', 'petrol', '231" x 124" x 76"', '5035cc', 4, 4);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('catalina 16.5', '1/29/1992', null, '398" x 112" x 239"', null, 2, 3);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('rs venture', '12/12/2011', null, '304" x 102" x 252"', null, 3, 4);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('grady-white express 330', '4/1/1990', 'petrol', '396" x 254" x 27"', '7148cc', 6, 1);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('key west 219 fs', '3/30/1993', 'diesel', '304" x 258" x 29"', '7092cc', 6, 4);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('mako pro skiff 17', '8/14/1998', 'diesel', '393" x 290" x 22"', '6605cc', 6, 3);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('regal 33 express', '1/31/2012', 'diesel', '368" x 237" x 26"', '7230cc', 4, 2);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('Yamaha WaveRunner VX-C', '7/4/2011', 'diesel', '124" x 46" x 40"', '1145cc', 2, 2);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('alerion express 28', '8/2/2000', 'petrol', '367" x 100" x 233"', '2347cc', 4, 1);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('force 4 02lite', '2/15/1992', 'diesel', '175" x 189" x 42"', '1017cc', 4, 4);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('Kawasaki Jet Ski SX-R', '7/18/1999', 'petrol', '127" x 43" x 49"', '1116cc', 2, 3);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('pearson vanguard', '2/7/2022', 'petrol', '391" x 164" x 262"', '4338cc', 2, 4);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('Jet Ski STX 160', '12/15/1995', 'diesel', '122" x 49" x 49"', '602cc', 2, 4);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('west wight potter p 19', '10/19/1995', null, '302" x 123" x 227"', null, 3, 3);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('beneteau sense 50', '5/17/2002', 'diesel', '362" x 106" x 215"', '4303cc', 2, 4);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('Sea-Doo Spark', '9/6/2012', 'diesel', '127" x 48" x 45"', '1449cc', 2, 3);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('bayliner vr6', '8/23/2011', 'petrol', '226" x 126" x 71"', '5800cc', 4, 2);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('catalina 22 sport', '8/1/2021', null, '335" x 123" x 291"', null, 4, 2);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('piscator 580', '2/11/2006', 'petrol', '298" x 103" x 76"', '5903cc', 2, 2);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('sundancer 370 ob', '12/24/1996', 'petrol', '301" x 277" x 24"', '6347cc', 4, 1);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('amt 190 ht', '12/27/2018', 'petrol', '241" x 161" x 70"', '5680cc', 2, 1);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('hunter 22', '5/11/2004', null, '385" x 196" x 264"', null, 3, 3);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('flipper 640 sc', '3/10/2003', 'petrol', '216" x 197" x 77"', '5762cc', 4, 2);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('bella 550 br', '7/27/2014', 'petrol', '262" x 121" x 75"', '5206cc', 2, 4);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('Yamaha’s WaveRunner EX', '8/24/2011', 'petrol', '127" x 46" x 49"', '687cc', 1 , 4);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('crestliner 1700', '9/14/1991', 'diesel', '376" x 227" x 20"', '5089cc', 4, 4);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('ranger tugs r31', '12/7/1992', 'diesel', '335" x 239" x 21"', '5779cc', 4, 3);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('tiara c39 coupe', '7/21/1990', 'diesel', '314" x 207" x 26"', '5498cc', 8, 2);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('2021 WaveRunner SuperJet', '9/9/2021', 'petrol', '122" x 49" x 47"', '1237cc', 2, 4);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('moore 24', '6/13/1991', 'petrol', '376" x 188" x 208"', '2220cc', 4, 4);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('crewsaver air deck 23', '4/10/1990', 'petrol', '172" x 168" x 48"', '1065cc', 4, 4);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('Sea-Doo GTI 90', '5/2/1996', 'diesel', '126" x 40" x 40"', '1483cc', 1, 2);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('norseboat 17.5', '1/17/2006', null, '346" x 192" x 217"', null, 2, 3);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('nor’sea 27', '7/14/2019', 'petrol', '315" x 101" x 246"', '2180cc', 4, 4);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('sting 610 dc', '11/19/2002', 'diesel', '294" x 118" x 71"', '5532cc', 2, 3);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('dufour arpege 30', '9/7/2012', 'diesel', '322" x 106" x 276"', '3513cc', 4, 2);
insert into boat_details (boat_name, production_date, fuel_type, boat_dimensions, Engine_size, capacity, yard_id) values ('cobia 220', '4/2/2000', 'petrol', '373" x 204" x 28"', '7905cc', 4, 3);

--staff

insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Breanne', 'Craigmyle', '01789096530', 'bcraigmyle0@apple.com', '177 Main Way', null, 'PO11 4J0', 'Clanfield', 4);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Xever', 'Borgnet', '05380814560', 'xborgnet1@uol.com.br', '8681 Mccormick Center', null, 'PO24 8N7', 'Southhampton', 3);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Letitia', 'Maybey', '07092600604', 'lmaybey2@smh.com.au', '3 Bluejay Circle', null, 'PO24 7Y2', 'Portsmouth', 4);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Damien', 'Bartoli', '09160375710', 'dbartoli3@alexa.com', '18 Fulton Street', null, 'PO34 1S6', 'Havant', 2);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Arty', 'Heal', '06444471237', 'aheal4@google.com', '4588 Corben Drive', null, 'PO25 2V3', 'Southhampton', 4);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Valentina', 'Allport', '09375926853', 'vallport5@admin.ch', '0 Kenwood Center', null, 'PO71 7T9', 'Southhampton', 4);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Kari', 'Joney', '09055085605', 'kjoney6@cargocollective.com', '44365 Mcbride Place', null, 'PO91 0G1', 'Portsmouth', 3);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Malinde', 'Sherbrook', '00042873141', 'msherbrook7@xrea.com', '3935 Jay Avenue', null, 'PO00 6Z9', 'Portsmouth', 4);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Tiphany', 'Schulze', '02375204724', 'tschulze8@domainmarket.com', '405 American Junction', null, 'PO79 7P1', 'Havant', 3);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Eustace', 'Koopman', '06530903501', 'ekoopman9@nasa.gov', '1 Mifflin Terrace', null, 'PO21 4P6', 'Fratton', 4);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Niki', 'Arlett', '02348668139', 'narletta@e-recht24.de', '84988 Mesta Avenue', null, 'PO46 2E5', 'Fratton', 4);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Teddy', 'Normant', '09187404726', 'tnormantb@macromedia.com', '16 Darwin Road', null, 'PO96 9Y9', 'Havant', 2);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Ursola', 'Rodolfi', '07105539284', 'urodolfic@arizona.edu', '5047 Vera Drive', null, 'PO75 9D6', 'Portsmouth', 2);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Fannie', 'Harder', '06366370662', 'fharderd@mysql.com', '5 Del Sol Street', null, 'PO54 4Q2', 'Havant', 2);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Marcelle', 'Hartwright', '06078619157', 'mhartwrighte@alexa.com', '40 5th Drive', null, 'PO20 5M6', 'Gosport', 2);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Clare', 'Gatland', '01402018038', 'cgatlandf@jigsy.com', '88585 Northfield Junction', null, 'PO34 0V0', 'Fratton', 3);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Claus', 'Dalzell', '05583273657', 'cdalzellg@imageshack.us', '462 Veith Center', null, 'PO09 3N1', 'Gosport', 1);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Verney', 'Matus', '02435653506', 'vmatush@creativecommons.org', '8802 Coleman Parkway', null, 'PO86 3T8', 'Clanfield', 1);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Fletch', 'Giblin', '09247178209', 'fgiblini@histats.com', '0194 La Follette Street', null, 'PO07 0A3', 'Havant', 3);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Nerte', 'Frede', '00567362657', 'nfredej@tuttocitta.it', '7774 Nelson Place', null, 'PO50 8I4', 'Havant', 1);
insert into staff (staff_fname, staff_lname, telephone, email, addr1, addr2, postcode, town, yard_id) values ('Moreen', 'Bosson', '02588004317', 'mbossonk@examiner.com', '11 Oak Valley Avenue', null, 'PO98 8B8', 'Havant', 3);


--Servicing

insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '5/6/2020', 'Shaftless. propeller', 1, 6);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '6/5/2020', 'carbon racing tiller', 2, 15);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '10/24/2020', 'Shaftless. propeller', 2, 36);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '12/25/2021', 'carbon racing tiller', 1, 23);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '12/9/2020', 'Controllable-pitch propeller', 4, 32);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '1/25/2021', 'carbon racing tiller', 2, 16);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '12/21/2022', 'omp mugello wheel', 2, 31);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '12/22/2022', 'schooner  mast', 3, 18);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '10/22/2021', 'omp mugello wheel', 4, 31);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '9/19/2022', 'omp mugello wheel', 3, 37);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '5/8/2020', 'carbon racing tiller', 1, 19);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '11/19/2022', 'polyform fender', 2, 13);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '6/8/2022', 'Voith Schneider propeller', 1, 29);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '6/13/2021', 'Toroidal. propeller', 3, 22);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '12/13/2022', 'optimist tiller', 2, 3);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '11/28/2022', 'catboat mast', 3, 18);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '9/22/2022', 'huuricane fenders', 4, 15);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '7/13/2022', 'schooner  mast', 4, 36);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '7/31/2020', 'polyform fender', 4, 14);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '6/28/2022', 'Shaftless. propeller', 1, 12);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '8/11/2020', 'Toroidal. propeller', 1, 23);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '1/22/2023', 'carbon racing tiller', 2, 27);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '10/7/2022', 'carbon racing tiller', 4, 1);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '1/2/2023', 'Skewback propeller', 3, 33);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('true', '6/12/2022', 'Modular propeller', 1, 31);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/25/2023', 'ketch mast', 2, 17);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/10/2023', 'fractional-rig sloop mast', 4, 16);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/14/2023', 'carbon racing tiller', 3, 12);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/9/2023', 'ketch mast', 1, 28);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/25/2023', 'omp mugello wheel', 1, 39);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/1/2023', 'cutter mast', 3, 12);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '1/30/2023', 'polyform fender', 3, 21);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/15/2023', 'sloop mast', 3, 26);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/23/2023', 'cutter mast', 3, 22);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/19/2023', 'catboat mast', 3, 34);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/20/2023', 'optimist tiller', 3, 39);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/3/2023', 'sloop mast', 1, 13);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/4/2023', 'Modular propeller', 2, 23);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/2/2023', 'stainless steel wheel', 3, 2);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/25/2023', 'schooner  mast', 3, 33);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/20/2023', 'cutter mast', 3, 14);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/23/2023', 'schooner  mast', 1, 23);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/19/2023', 'Voith Schneider propeller', 1, 30);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/26/2023', 'Shaftless. propeller', 2, 16);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/5/2023', 'polyform fender', 3, 27);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/23/2023', 'polyform fender', 2, 3);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '1/30/2023', 'Skewback propeller', 3, 5);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/15/2023', 'omp mugello wheel', 1, 13);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/20/2023', 'Toroidal. propeller', 2, 25);
insert into Servicing (completed, service_date , part, yard_id, Boat_id) values ('false', '2/12/2023', 'Voith Schneider propeller', 1, 33);

-- Boat_cust

insert into boat_cust (cust_id, boat_id) values (1, 17);
insert into boat_cust (cust_id, boat_id) values (2, 1);
insert into boat_cust (cust_id, boat_id) values (3, 27);
insert into boat_cust (cust_id, boat_id) values (4, 8);
insert into boat_cust (cust_id, boat_id) values (5, 12);
insert into boat_cust (cust_id, boat_id) values (6, 21);
insert into boat_cust (cust_id, boat_id) values (7, 13);
insert into boat_cust (cust_id, boat_id) values (8, 3);
insert into boat_cust (cust_id, boat_id) values (9, 18);
insert into boat_cust (cust_id, boat_id) values (10, 6);
insert into boat_cust (cust_id, boat_id) values (11, 7);
insert into boat_cust (cust_id, boat_id) values (12, 29);
insert into boat_cust (cust_id, boat_id) values (13, 9);
insert into boat_cust (cust_id, boat_id) values (14, 30);
insert into boat_cust (cust_id, boat_id) values (15, 14);
insert into boat_cust (cust_id, boat_id) values (16, 25);
insert into boat_cust (cust_id, boat_id) values (17, 22);
insert into boat_cust (cust_id, boat_id) values (18, 15);
insert into boat_cust (cust_id, boat_id) values (19, 11);
insert into boat_cust (cust_id, boat_id) values (20, 20);
insert into boat_cust (cust_id, boat_id) values (21, 28);
insert into boat_cust (cust_id, boat_id) values (22, 26);
insert into boat_cust (cust_id, boat_id) values (23, 4);
insert into boat_cust (cust_id, boat_id) values (24, 10);
insert into boat_cust (cust_id, boat_id) values (25, 23);
insert into boat_cust (cust_id, boat_id) values (26, 16);
insert into boat_cust (cust_id, boat_id) values (27, 2);
insert into boat_cust (cust_id, boat_id) values (28, 19);
insert into boat_cust (cust_id, boat_id) values (29, 24);
insert into boat_cust (cust_id, boat_id) values (30, 5);
insert into boat_cust (cust_id, boat_id) values (20, 33);
insert into boat_cust (cust_id, boat_id) values (28, 35);
insert into boat_cust (cust_id, boat_id) values (26, 40);
insert into boat_cust (cust_id, boat_id) values (4, 36);
insert into boat_cust (cust_id, boat_id) values (10, 32);
insert into boat_cust (cust_id, boat_id) values (23, 39);
insert into boat_cust (cust_id, boat_id) values (16, 38);
insert into boat_cust (cust_id, boat_id) values (2, 31);
insert into boat_cust (cust_id, boat_id) values (19, 37);
insert into boat_cust (cust_id, boat_id) values (24, 34);

--staff_role

insert into staff_role (role_id, staff_id) values (1, 1);
insert into staff_role (role_id, staff_id) values (2, 3); 
insert into staff_role (role_id, staff_id) values (3, 5);
insert into staff_role (role_id, staff_id) values (4, 6);
insert into staff_role (role_id, staff_id) values (5, 8);
insert into staff_role (role_id, staff_id) values (6, 10);
insert into staff_role (role_id, staff_id) values (6, 11);
insert into staff_role (role_id, staff_id) values (1, 2);
insert into staff_role (role_id, staff_id) values (2, 7); 
insert into staff_role (role_id, staff_id) values (3, 9);
insert into staff_role (role_id, staff_id) values (4, 16);
insert into staff_role (role_id, staff_id) values (5, 19);
insert into staff_role (role_id, staff_id) values (6, 21);
insert into staff_role (role_id, staff_id) values (1, 4);
insert into staff_role (role_id, staff_id) values (2, 12);
insert into staff_role (role_id, staff_id) values (3, 13);
insert into staff_role (role_id, staff_id) values (4, 14);
insert into staff_role (role_id, staff_id) values (5, 15);
insert into staff_role (role_id, staff_id) values (6, 4);
insert into staff_role (role_id, staff_id) values (1, 17);
insert into staff_role (role_id, staff_id) values (2, 17);
insert into staff_role (role_id, staff_id) values (3, 17);
insert into staff_role (role_id, staff_id) values (4, 17);
insert into staff_role (role_id, staff_id) values (5, 18);
insert into staff_role (role_id, staff_id) values (6, 20);

--staff_service 

insert into staff_service (staff_id, service_id) values (17, 1); 
insert into staff_service (staff_id, service_id) values (18, 4);
insert into staff_service (staff_id, service_id) values (20, 11);
insert into staff_service (staff_id, service_id) values (17, 13);
insert into staff_service (staff_id, service_id) values (18, 20);
insert into staff_service (staff_id, service_id) values (20, 21);
insert into staff_service (staff_id, service_id) values (17, 25);
insert into staff_service (staff_id, service_id) values (18, 29);
insert into staff_service (staff_id, service_id) values (20, 30);
insert into staff_service (staff_id, service_id) values (17, 37);
insert into staff_service (staff_id, service_id) values (18, 42);
insert into staff_service (staff_id, service_id) values (20, 43);
insert into staff_service (staff_id, service_id) values (17, 48);
insert into staff_service (staff_id, service_id) values (18, 50);
insert into staff_service (staff_id, service_id) values (17, 50);
insert into staff_service (staff_id, service_id) values (20, 50);
insert into staff_service (staff_id, service_id) values (17, 43);
insert into staff_service (staff_id, service_id) values (17, 20);
insert into staff_service (staff_id, service_id) values (4, 2);
insert into staff_service (staff_id, service_id) values (12, 3);
insert into staff_service (staff_id, service_id) values (13, 6);
insert into staff_service (staff_id, service_id) values (14, 7);
insert into staff_service (staff_id, service_id) values (15, 12);
insert into staff_service (staff_id, service_id) values (4, 15);
insert into staff_service (staff_id, service_id) values (12, 22);
insert into staff_service (staff_id, service_id) values (13, 26);
insert into staff_service (staff_id, service_id) values (14, 38);
insert into staff_service (staff_id, service_id) values (15, 44);
insert into staff_service (staff_id, service_id) values (4, 46);
insert into staff_service (staff_id, service_id) values (12, 49);
insert into staff_service (staff_id, service_id) values (13, 2);
insert into staff_service (staff_id, service_id) values (14, 3);
insert into staff_service (staff_id, service_id) values (15, 6);
insert into staff_service (staff_id, service_id) values (4, 7);
insert into staff_service (staff_id, service_id) values (12, 12);
insert into staff_service (staff_id, service_id) values (13, 15);
insert into staff_service (staff_id, service_id) values (14, 22);
insert into staff_service (staff_id, service_id) values (15, 26);
insert into staff_service (staff_id, service_id) values (15, 2);
insert into staff_service (staff_id, service_id) values (4, 3);
insert into staff_service (staff_id, service_id) values (15, 6);
insert into staff_service (staff_id, service_id) values (4, 7);
insert into staff_service (staff_id, service_id) values (13, 12);
insert into staff_service (staff_id, service_id) values (15, 2);
insert into staff_service (staff_id, service_id) values (15, 3);
insert into staff_service (staff_id, service_id) values (2, 8); 
insert into staff_service (staff_id, service_id) values (7, 10);
insert into staff_service (staff_id, service_id) values (9, 14);
insert into staff_service (staff_id, service_id) values (16, 16);
insert into staff_service (staff_id, service_id) values (19, 24);
insert into staff_service (staff_id, service_id) values (21, 28);
insert into staff_service (staff_id, service_id) values (2, 31);
insert into staff_service (staff_id, service_id) values (7, 32);
insert into staff_service (staff_id, service_id) values (9, 33);
insert into staff_service (staff_id, service_id) values (16, 34);
insert into staff_service (staff_id, service_id) values (19, 35);
insert into staff_service (staff_id, service_id) values (21, 36);
insert into staff_service (staff_id, service_id) values (2, 39);
insert into staff_service (staff_id, service_id) values (7, 40);
insert into staff_service (staff_id, service_id) values (9, 41);
insert into staff_service (staff_id, service_id) values (16, 45);
insert into staff_service (staff_id, service_id) values (19, 47);
insert into staff_service (staff_id, service_id) values (2, 32);
insert into staff_service (staff_id, service_id) values (7, 33);
insert into staff_service (staff_id, service_id) values (9, 34);
insert into staff_service (staff_id, service_id) values (16, 35);
insert into staff_service (staff_id, service_id) values (19, 36);
insert into staff_service (staff_id, service_id) values (21, 39);
insert into staff_service (staff_id, service_id) values (2, 40);
insert into staff_service (staff_id, service_id) values (7, 41);
insert into staff_service (staff_id, service_id) values (9, 45);
insert into staff_service (staff_id, service_id) values (16, 47);
insert into staff_service (staff_id, service_id) values (19, 32);
insert into staff_service (staff_id, service_id) values (21, 33);
insert into staff_service (staff_id, service_id) values (2, 34);
insert into staff_service (staff_id, service_id) values (7, 35);
insert into staff_service (staff_id, service_id) values (9, 36);
insert into staff_service (staff_id, service_id) values (16, 39);
insert into staff_service (staff_id, service_id) values (19, 40);
insert into staff_service (staff_id, service_id) values (1, 5);
insert into staff_service (staff_id, service_id) values (3, 9);
insert into staff_service (staff_id, service_id) values (5, 17);
insert into staff_service (staff_id, service_id) values (6, 18);
insert into staff_service (staff_id, service_id) values (8, 19);
insert into staff_service (staff_id, service_id) values (10, 23);
insert into staff_service (staff_id, service_id) values (11, 27);

--Query 1: 

select service_date, servicing.service_id, staff_id
from servicing join staff_service 
on staff_service.service_id = servicing.service_id
where current_date < service_date 
and 
SERVICE_DATE < current_date + 7
and 
servicing.service_id = staff_service.service_id
order by service_date;

--Rationale:

--A query that shows all the staff members that will be needed for the
--services booked over the next 7 days. This is useful for the business as it 
--allows them to know who they on site on each day and who currently isn't assigned a job over the next 7 days.

--Query 2:

select service_id, cust_id, part as part_used
from servicing join boat_details 
on servicing.boat_id = boat_details.boat_id,
boat_cust
where boat_details.boat_id = Boat_cust.Boat_id;

--Rationale:

--This query connects the customer to a service and displays which part was used.
--This is useful for the business becuase it allows them to easily see who they need to 
--send an invoice to with the price of the.

--Query 3:

select staff.yard_id, staff.staff_id, telephone, email, addr1 as Address
from staff join staff_role
on staff.staff_id = staff_role.staff_id
where role_id = 4
order by yard_id;

--Rationale:

--This query shows the manager of each yard with their contact details.
--This is useful as it allows the manager of each site to be quickly found and contacted incase of emergency
--or new service information needs to be passed to them.

--Query 4

select service_id, customer.cust_id, boat_details.boat_id, servicing.service_date as last_service, cust_fname as first_name, cust_lname 
as last_name, telephone, email, addr1 as address, postcode, town
from servicing join boat_details 
on servicing.boat_id = boat_details.boat_id,
boat_cust, customer 
where boat_details.boat_id = Boat_cust.Boat_id
and servicing.service_date < current_date - 730
and boat_cust.cust_id = customer.cust_id
order by servicing.service_date asc;

--Rationale:

--This query displays all the information of customers that have a boat that hasn't been 
--serviced in over 2 years. This is useful as it lets the company know who they should send a 
--reminder to.

--Query 5:

select boat_yard.Yard_id, boat_id, Boat_name, Addr1 as Address, Postcode, Town 
from boat_details join boat_yard
on boat_details.yard_id = Boat_yard.yard_id;


--Rationale

--Creates a list of all boats and their current locations.
--This is incase a customer needs to know where the business is currently holding the boat
--as it may have moved due to servicing.

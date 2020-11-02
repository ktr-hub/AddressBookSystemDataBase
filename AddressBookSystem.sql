/* Welcome to Address Book Service Data Base using MySQL client */
/* UC1- Creating DataBase*/
CREATE DATABASE AddressBookSystem;

/*UC2- Creating DataTable*/
CREATE TABLE AddressBookTable 
(
 firstName VARCHAR(15),
 lastName VARCHAR(15),
 address VARCHAR(15),
 city VARCHAR(15),
 state VARCHAR(15),
 zip INT,
 phoneNumber VARCHAR(10),
 email VARCHAR(15)
);

/*UC3- Inserting data into DataTable*/
INSERT INTO AddressBookTable 
VALUES('kummari','tirupathi','1-106','srikakulam','andhra',532221,'9010640342','ktr@gmail.com'),
('kummari','ktrr','1-107','srikakulam','andhra',532221,'9010640341','ktrr@gmail.com'),
('k','ktrrr','1-107','srikakulam','andhra',532221,'9010640349','ktrrr@gmail.com');

/*UC4- Editing Details*/
UPDATE AddressBookTable 
SET state='Andhra Pradesh' WHERE firstName='kummari';

/*UC5- Deleting Data*/
DELETE FROM AddressBookTable 
WHERE firstName = 'k' AND lastName = 'ktrrr';

/*UC6-Retrieve Person of a city or state*/
SELECT firstName+' '+lastName AS FullName From AddressBookTable 
WHERE city='srikakulam';

/*UC7-Count of Persons by city/state*/
SELECT COUNT(firstName) FROM AddressBookTable
WHERE city ='srikakulam' AND state='Andhra Pradesh';

/*UC8-Person names alphabetical order of specific city*/
SELECT lastName FROM AddressBookTable
WHERE city = 'srikakulam' ORDER BY lastName; 

select*from AddressBookTable;

/*UC9-Name and Type*/
ALTER TABLE AddressBookTable ADD name VARCHAR(30);
ALTER TABLE AddressBookTable ADD type VARCHAR(30);

/*UC10-Count by type*/
SELECT type,COUNT(name) AS TotalCount
FROM AddressBookTable
GROUP BY type;

/*UC11-AddIntoBothTypes*/
INSERT INTO AddressBookTable 
VALUES('kummari','narsi','1-106','srikakulam','andhra',532221,'9010640341','narsi@gmail.com','narsi','family'),
('kummari','narsi','1-106','srikakulam','andhra',532221,'9010640341','narsi@gmail.com','narsi','friends')

/*UC12-ER_Diagram*/

/*UC13-Final_ER_Tables*/

CREATE TABLE addressBook
(
 addressBookId INT IDENTITY(100,1) PRIMARY KEY,
 addressBookName VARCHAR(30)
);

INSERT INTO addressBook(addressBookName) VALUES('ktr');

CREATE TABLE contact
(
 nameId INT IDENTITY(1,1) PRIMARY KEY,
 firstName VARCHAR(15),
 lastName VARCHAR(15),
 address VARCHAR(15),
 city VARCHAR(15),
 state VARCHAR(15),
 zip INT,
 phoneNumber VARCHAR(10),
 email VARCHAR(15)
);

ALTER TABLE contact ADD addressBookId INT REFERENCES addressBook(addressBookId)
UPDATE contact SET addressBookId = 100;

INSERT INTO contact(firstName,lastName,address,city,state,zip,phoneNumber,email)
VALUES('kummari','tiru','1-106','srikakulam','andhra',532221,'9010640041','tiru@gmail.com');

CREATE TABLE type
(
 typeId INT IDENTITY(50,1) PRIMARY KEY,
 typeName VARCHAR(30)
);

INSERT INTO type(typeName) values('profession');

CREATE TABLE contactType
(
 typeId INT REFERENCES type(typeId),
 nameId INT REFERENCES contact(nameId)
);

INSERT INTO contactType VALUES(50,1),(51,1),(52,2)

select * from addressBook;
select * from contact;
select * from type;
select * from contactType;

/*UC6-Retrieve Person of a city or state*/
SELECT firstName+' '+lastName AS FullName From addressBook,contact
WHERE city='srikakulam' and addressBook.addressBookId = contact.addressBookId;


/*UC7-Count of Persons by city/state*/
SELECT COUNT(firstName) AS Total FROM addressBook,contact
WHERE city ='srikakulam' AND state='andhra' AND addressBook.addressBookId = contact.addressBookId;

/*UC8-Person names alphabetical order of specific city*/
SELECT lastName FROM addressBook,contact
WHERE city = 'srikakulam' ORDER BY lastName DESC; 

/*UC10-Count by type*/
SELECT typeName,COUNT(firstName) AS TotalCount
FROM addressBook,contact,type,contactType
WHERE addressBook.addressBookId = contact.addressBookId AND
contact.nameId = contactType.nameId AND
contactType.typeId = type.typeId  
GROUP BY typeName;

/* Welcome to Address Book Service Data Base using MySQL client */

/*UC1-TestCase*/
CREATE DATABASE AddressBookSystem;

/*UC2-TestCase*/
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

/*UC3-TestCase*/
INSERT INTO AddressBookTable 
VALUES('kummari','tirupathi','1-106','srikakulam','andhra',532221,'9010640342','ktr@gmail.com'),
('kummari','ktrr','1-107','srikakulam','andhra',532221,'9010640341','ktrr@gmail.com'),
('k','ktrrr','1-107','srikakulam','andhra',532221,'9010640349','ktrrr@gmail.com');

/*UC4-TestCase*/
UPDATE AddressBookTable SET state='Andhra Pradesh' WHERE firstName='kummari';

/*UC5-TestCase*/
DELETE FROM AddressBookTable WHERE firstName = 'k' AND lastName = 'ktrrr';
SELECT * FROM AddressBookTable;
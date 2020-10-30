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

SELECT * FROM AddressBookTable;
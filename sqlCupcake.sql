drop database users;
create database users;
use users;
DROP TABLE if exists login;
DROP TABLE if exists topping;
DROP TABLE if exists bottom;
DROP TABLE IF exists invoice;
CREATE TABLE login(
 id int(5) PRIMARY KEY auto_increment,
 username varchar(20) not null,
 password varchar(30) not null,
 balance int(5) not null
 );
 
 CREATE TABLE topping(
 id int(5) PRIMARY KEY auto_increment,
 topping varchar(20) not null,
 price int(5) not null);
 
 CREATE TABLE bottom(
 id int(5) PRIMARY KEY auto_increment,
 bottom varchar(20) not null,
 price int(5) not null);
 
 CREATE TABLE invoice(
 id int(5) PRIMARY KEY auto_increment,
 user varchar(20) not null,
 items varchar(5000) not null,
 price int(5));
 


INSERT INTO login (username,password,balance) VALUES ('Joacim', 'test',100);
INSERT INTO login (username,password,balance) VALUEs ('Magnus', 'test',100);
INSERT INTO login (username,password,balance) VALUEs ('Leon', 'test',100);

INSERT INTO bottom (bottom,price) VALUES ('Chocolate',5);
INSERT INTO bottom (bottom,price) VALUES ('Vanilla',5);
INSERT INTO bottom (bottom,price) VALUES ('Nutmeg',5);
INSERT INTO bottom (bottom,price) VALUES ('Pistacio',6);
INSERT INTO bottom (bottom,price) VALUES ('Almond',7);

INSERT INTO topping(topping, price) VALUES('Chocolate',5);
INSERT INTO topping(topping, price) VALUES('Blueberry',5);
INSERT INTO topping(topping, price) VALUES('Raspberry',5);
INSERT INTO topping(topping, price) VALUES('Crispy',6);
INSERT INTO topping(topping, price) VALUES('Strawberry',6);
INSERT INTO topping(topping, price) VALUES('Rum/Raisin',7);
INSERT INTO topping(topping, price) VALUES('Orange',8);
INSERT INTO topping(topping, price) VALUES('Lemon',8);
INSERT INTO topping(topping, price) VALUES('Blue cheese',9);



SELECT * FROM users.login;
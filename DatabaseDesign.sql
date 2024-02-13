CREATE DATABASE PRStest;

USE PRStest;

/*
User: People Who can log into our system
Note: "User" is a reserved word
Created By: Dominic Shawhan
Date: 2/9/2024
*/

CREATE TABLE "User" (
	ID     INT            IDENTITY(1,1) NOT NULL PRIMARY KEY,
	UserName   nvarchar(30)                 NOT NULL,
	Password   nvarchar(30)                 NOT NULL,
	FirstName  nvarchar(30)                 NOT NULL,
	LastName   nvarchar(30)                 NOT NULL,
	Phone      varchar(12)                  NULL,
	Email      nvarchar(255)                NULL,
	IsReviewer bit                          NOT NULL,
	IsAdmin    bit                          NOT NULL
);

SELECT * FROM "User";

CREATE TABLE Vendor (
	ID      int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Code    nvarchar(30) NOT NULL,
	Name    nvarchar(30) NOT NULL,
	Address nvarchar(30) NOT NULL,
	City    nvarchar(30) NOT NULL,
	State   char(2) NOT NULL,
	Zip     nvarchar(5) NOT NULL,
	Phone   varchar(12) NULL,
	Email   nvarchar(255) NULL
)

CREATE TABLE Product (
	ID        int Identity(1,1) NOT NULL PRIMARY KEY,
	PartNbr   nvarchar(30) NOT NULL,
	Name      nvarchar(30) NOT NULL,
	Price     decimal(11, 2) NOT NULL,
	Unit      nvarchar(30) NOT NULL,
	PhotoPath nvarchar(255) NULL,
	VendorID  int Foreign Key References Vendor(ID) NOT NULL
)

CREATE TABLE Request (
	ID              int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Description     nvarchar(80) NOT NULL,
	Justification   nvarchar(80) NOT NULL,
	RejectionReason nvarchar(80) NULL,
	DeliveryMode    nvarchar(20) NOT NULL DEFAULT 'PICKUP',
	Status          nvarchar(10) NOT NULL DEFAULT 'New',
	Total           decimal(11, 2) NOT NULL DEFAULT 0,
	UserID          int FOREIGN KEY REFERENCES "USER"(ID)
)

CREATE TABLE RequestLine(
	ID        int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	RequestID int FOREIGN KEY REFERENCES Request(ID),
	ProductID int FOREIGN KEY REFERENCES Product(ID),
	Quantity  int NOT NULL DEFAULT 1
)
CREATE DATABASE PRStest;

USE PRStest;

/*
User: People Who can log into our system
Note: "User" is a reserved word
Created By: Dominic Shawhan
Date: 2/9/2024
*/

CREATE TABLE "User" (
	UserID     INT            IDENTITY(1,1) NOT NULL,
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
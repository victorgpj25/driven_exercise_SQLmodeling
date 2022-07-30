-- CRIAR DB

CREATE DATABASE "driven_bank";


-- CRIAR TABLES

CREATE TABLE "customers" (
	"id" SERIAL PRIMARY KEY, 
	"fullName" TEXT NOT NULL, 
	"cpf" varchar(11) NOT NULL UNIQUE, 
	"email" text NOT NULL UNIQUE, 
	"password" text NOT NULL
);

CREATE TYPE valid_phones AS ENUM ('landline', 'mobile);

CREATE TABLE "customerPhones" (
	"id" SERIAL PRIMARY KEY, 
	"customerId" INTEGER REFERENCES "customers"("id"), 
	"number" TEXT NOT NULL, 
	"type" VALID_PHONES
);

CREATE TABLE "states" (
	"id" SERIAL PRIMARY KEY, 
	"name" TEXT NOT NULL
);

CREATE TABLE "cities" (
	"id" SERIAL PRIMARY KEY, 
	"name" TEXT NOT NULL, 
	"stateId" INTEGER REFERENCES "states"("id")
);

CREATE TABLE "customerAddresses" (
	"id" SERIAL PRIMARY KEY, 
	"customerId" INTEGER REFERENCES "customers"("id") UNIQUE, 
	"street" TEXT NOT NULL, 
	"number" INTEGER NOT NULL, 
	"complement" TEXT, 
	"postalCode" TEXT NOT NULL, 
	"cityId" INTEGER REFERENCES "cities"("id")
);

CREATE TABLE "bankAccount" (
	"id" SERIAL PRIMARY KEY, 
	"customerId" INTEGER REFERENCES "customers"("id"), 
	"accountNumber" TEXT NOT NULL UNIQUE, 
	"agency" TEXT NOT NULL, 
	"openDate" DATE NOT NULL, 
	"closeDate" DATE
);

CREATE TYPE valid_transactions AS ENUM ('deposit', 'withdraw');

CREATE TABLE "transactions" (
	"id" SERIAL PRIMARY KEY, 
	"bankAccountId" INTEGER REFERENCES "bankAccount"("id"), 
	"amount" INTEGER NOT NULL, 
	"type" VALID_TRANSACTIONS, 
	"time" TIMESTAMP NOT NULL DEFAULT NOW(), 
	"description" TEXT, 
	"cancelled" BOOL NOT NULL DEFAULT FALSE
);

CREATE TABLE "transactions" (
	"id" SERIAL PRIMARY KEY, 
	"bankAccountId" INTEGER REFERENCES "bankAcoount"("id"), 
	"name" TEXT NOT NULL, 
	"number" TEXT NOT NULL UNIQUE, 
	"securityCode" VARCHAR(3) NOT NULL, 
	"expirationMonth" INTEGER NOT NULL, 
	"expirationYear" INTEGER NOT NULL, 
	"password" TEXT NOT NULL, 
	"limit" INTEGER
);


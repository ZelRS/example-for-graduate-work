-- liquibase formatted sql

--changeset YuriiYatsenko:1
CREATE TABLE users (
	id         int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE),
	email      varchar(255) NULL,
	first_name varchar(255) NULL,
	image      varchar(255) NULL,
	last_name  varchar(255) NULL,
	"password" varchar(255) NULL,
	phone      varchar(255) NULL,
	"role"     varchar(255) NULL,
	CONSTRAINT users_pkey PRIMARY KEY (id)
);

CREATE TABLE ads (
	pk          int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE),
	description varchar(255) NULL,
	image       varchar(255) NULL,
	price       int4 NULL,
	title       varchar(255) NULL,
	user_id     int4 NULL,
	CONSTRAINT ads_pkey PRIMARY KEY (pk),
	CONSTRAINT ads_user_fkey FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE "comments" (
	pk         int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE),
	created_at int8 NULL,
	"text"     varchar(255) NULL,
	user_id    int4 NULL,
	CONSTRAINT comments_pkey PRIMARY KEY (pk),
	CONSTRAINT comments_user_fkey FOREIGN KEY (user_id) REFERENCES users(id)
);

--changeset YuriiYatsenko:2
ALTER TABLE users
    ALTER COLUMN email      TYPE varchar(50),
    ALTER COLUMN first_name TYPE varchar(20),
	ALTER COLUMN last_name  TYPE varchar(20),
	ALTER COLUMN "password" TYPE varchar(50),
	ALTER COLUMN phone      TYPE varchar(20),
	ALTER COLUMN "role"     TYPE varchar(50);
ALTER TABLE ads
    ALTER COLUMN title      TYPE varchar(100);
ALTER TABLE "comments"
    ALTER COLUMN "text"     TYPE varchar(2000);

--changeset RomanZelenin:1
ALTER TABLE comments
    ADD COLUMN ad_id int4 NULL;
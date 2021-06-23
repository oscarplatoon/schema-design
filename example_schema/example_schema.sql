drop table if exists addresses cascade;
drop table if exists guardians cascade;
drop table if exists students cascade;

CREATE TABLE addresses (
    id serial primary key,
    line_1 varchar(255) not null,
    line_2 varchar(255) default null,
    city varchar(100) NOT NULL,
    state varchar(2) NOT NULL,
    zip_code varchar(5) NOT NULL
);

create table guardians (
    id serial primary key,
    name varchar(255) NOT NULL,
    phone varchar(10) NOT NULL,
    email varchar(255) NOT NULL,
    address_id int references addresses
);

create table students (
    id serial primary key,
    name varchar(255) not null,
    grade varchar(2), 
    dob date not null,
    guardian_id int references guardians
);
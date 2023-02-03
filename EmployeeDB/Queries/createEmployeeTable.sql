--create database payroll_service;
use payroll_service;

create table employee(
id int Identity(1,1) primary key,
name varchar(50) not null,
salary float,
startDate date
);
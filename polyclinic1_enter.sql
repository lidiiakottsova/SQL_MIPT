use polyclinic9
go

create table patient(
patient_id int not null,
site_id int not null,
last_name varchar(30) not null,
first_name varchar(30) not null,
date_of_birth date not null,
policy_number int not null,
social_status varchar(30) not null,
primary key (patient_id)
);

create table doctor(
doctor_id int not null,
site_id int not null,
schedule_id int not null,
last_dname varchar(30) not null,
first_dname varchar(30) not null,
date_of_dbirth date not null,
experience int not null,
specialization varchar(30) not null,
primary key (doctor_id)
);

create table treatment(
appointment_id int identity not null,
patient_id int not null,
doctor_id int not null,
service_id int not null,
diagnosis varchar(30) not null,
starting_date date not null,
completion_date date not null,
current_state varchar(30) not null,
primary key (appointment_id)
);

create table app_rec(
appointment_id int not null,
reception_id int not null,
primary key (appointment_id)
);

create table servicec(
service_id int not null,
name_of_service varchar(40) not null,
nurse_name varchar(30) not null,
service_price int not null,
primary key (service_id)
);

create table site(
site_id int not null,
name_of_site varchar(30) not null,
adress varchar(40) not null,
primary key (site_id)
);

create table medicine(
reception_id int not null,
name_of_medicine varchar(60) not null,
price int not null,
primary key (reception_id)
);

create table diagnosis(
diagnosis varchar(30) not null,
description varchar(60) not null,
primary key (diagnosis)
);

create table schedule(
schedule_id int not null,
starting_hour int not null,
completion_hour int not null,
primary key (schedule_id)
);

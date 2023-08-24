use polyclinic9
go

--app_rec
insert into app_rec values(1,1)
insert into app_rec values(2,2)
insert into app_rec values(3,3)
insert into app_rec values(4,4)
insert into app_rec values(5,5)
insert into app_rec values(6,6)
insert into app_rec values(7,7)
insert into app_rec values(8,8)
insert into app_rec values(9,1)
insert into app_rec values(10,2)
insert into app_rec values(11,3)
insert into app_rec values(12,4)
insert into app_rec values(13,5)
insert into app_rec values(14,6)
insert into app_rec values(15,7)
insert into app_rec values(16,8)
insert into app_rec values(17,1)
insert into app_rec values(18,2)
insert into app_rec values(19,3)
insert into app_rec values(20,4)
insert into app_rec values(21,5)
insert into app_rec values(22,6)
insert into app_rec values(23,7)
insert into app_rec values(24,8)
insert into app_rec values(25,1)

--schedule
insert into schedule values(21,9,18)
insert into schedule values(22,10,19)
insert into schedule values(23,8,17)
insert into schedule values(24,7,16)
insert into schedule values(25,9,18)
insert into schedule values(26,10,19)
insert into schedule values(27,8,17)
insert into schedule values(28,7,16)

--servicec
insert into servicec values(1,'operation','morozova',150)
insert into servicec values(2,'inspection','ivanova',50)
insert into servicec values(3,'removal_of_a_tooth','sedova',100)
insert into servicec values(4,'gastroscopy','pogorelova',100)
insert into servicec values(5,'operation','novikova',150)
insert into servicec values(6,'operation','novikova',150)
insert into servicec values(7,'inspection','pogorelova',50)
insert into servicec values(8,'inspection','sedova',50)


--site
insert into site values(11,'number_1','new_york')
insert into site values(22,'number_2','new_york')
insert into site values(33,'number_3','new_york')
insert into site values(44,'number_4','los_angeles')
insert into site values(55,'number_5','los_angeles')
insert into site values(66,'number_6','chikago')
insert into site values(77,'number_7','chikago')
insert into site values(88,'number_8','brooklyn')
insert into site values(99,'number_9','boston')

--diagnosis
insert into diagnosis values('appendicitis','pain_in_stomachcache')
insert into diagnosis values('stomachache','pain_in_stomachcache')
insert into diagnosis values('caries','toothache')
insert into diagnosis values('ulcer','pain_in_stomachcache')
insert into diagnosis values('heart_attack','pain_in_heart')
insert into diagnosis values('cataract','loss_of_sight')
insert into diagnosis values('angina','pain_in_throat')
insert into diagnosis values('chickenpox','rash')



--medicine
insert into medicine values(1,'antibiotic',16)
insert into medicine values(2,'linex',17)
insert into medicine values(3,'dentol',18)
insert into medicine values(4,'denol',19)
insert into medicine values(5,'relif',18)
insert into medicine values(6,'optifree',17)
insert into medicine values(7,'hexoral',16)
insert into medicine values(8,'poxclean',16)




--patient 
insert into patient values(1,11,'Murphy','Eddie','2002-09-25',8601,'student')
insert into patient values(2,22,'Downey','Robert','2003-10-26',8602,'student')
insert into patient values(3,33,'Depp','Johnny','2004-11-27',8603,'student')
insert into patient values(4,44,'Hemsworth','Chris','1999-09-25',8604,'working')
insert into patient values(5,55,'Cooper','Bradley','1998-02-25',8605,'working')
insert into patient values(6,66,'Matt','Damon','1997-09-25',8606,'working')
insert into patient values(7,77,'Smith','Will','1996-08-12',8607,'temporarily_unemployed')
insert into patient values(8,88,'Dicaprio','Leonardo','1995-07-11',8608,'temporarily_unemployed')
insert into patient values(9,99,'Johnson','Dwayne','1994-06-08',8609,'temporarily_unemployed')
insert into patient values(10,11,'Hanks','Tom','1965-05-11',8610,'disabled')
insert into patient values(11,22,'Lawrence','Jeniffer','1964-04-03',8611,'disabled')
insert into patient values(12,33,'Monroe','Marylin','1935-03-21',8612,'disabled')
insert into patient values(13,44,'Witherspoon','Reese','1951-10-06',8613,'retiree')
insert into patient values(14,55,'Aniston','Jennifer','1950-09-25',8614,'retiree')
insert into patient values(15,66,'Jackman','Hugh','1949-08-31',8615,'retiree')
insert into patient values(16,77,'Hepburn','Audrey','1948-11-21',8616,'retiree')
insert into patient values(17,88,'Reeves','Keanu','2005-12-28',8617,'student')
insert into patient values(18,99,'Ivanov','Ivan','2006-01-01',8601,'student')


--doctor
insert into doctor values(1,11,21,'Jackson','Michael','1980-01-03',19,'surgeon')
insert into doctor values(2,22,22,'Schwarzenegger','Arnold','1979-02-04',5,'therapist')
insert into doctor values(3,33,23,'Sidorov','Sidor','1978-03-05',7,'dentist')
insert into doctor values(4,44,24,'Stepanov','Stepan','1977-04-06',6,'gastroenterologist')
insert into doctor values(5,55,25,'Nikolaev','Nicolay','1976-05-07',15,'cardiologist')
insert into doctor values(6,66,26,'Fedorov','Fedor','1975-06-08',14,'ophthalmologist')
insert into doctor values(7,77,27,'Vasilyev','Vasiliy','1974-07-09',13,'lore')
insert into doctor values(8,88,28,'Yuryev','Yuriy','1972-09-11',16,'pediatrician')
insert into doctor values(9,99,21,'Volkova','Mariia','1970-11-13',9,'surgeon')
insert into doctor values(10,11,22,'Morozova','Olga','1969-12-14',28,'therapist')
insert into doctor values(11,22,23,'Lubimova','Vera','1968-04-15',29,'dentist')
insert into doctor values(12,33,24,'Nikolaeva','Sofiia','1977-01-16',15,'gastroenterologist')

set identity_insert treatment on;
go



--treatment
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(1,1,1,1,'appendicitis','2020-03-04','2020-03-28','moderate')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(2,1,2,2,'stomachache','2020-04-04','2020-04-28','serious')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(3,1,3,3,'caries','2020-05-04','2020-05-28','in-patient')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(4,1,4,4,'ulcer','2020-06-04','2020-06-28','moderate')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(5,1,5,5,'heart_attack','2020-08-04','2020-07-28','serious')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(6,1,6,6,'cataract','2020-09-04','2020-09-28','in-patient')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(7,1,7,7,'angina','2020-10-04','2020-10-28','moderate')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(8,1,8,8,'chickenpox','2020-11-04','2020-12-28','serious')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(9,2,9,1,'appendicitis','2020-01-03','2020-02-26','in-patient')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(10,3,10,2,'stomachache','2020-02-27','2020-03-28','serious')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(11,4,11,3,'caries','2020-05-02','2020-05-29','in-patient')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(12,5,12,4,'ulcer','2020-06-18','2020-08-28','died')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(13,6,1,1,'appendicitis','2020-07-04','2020-07-28','moderate')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(14,7,2,2,'stomachache','2020-08-15','2020-09-30','serious')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(15,8,3,3,'caries','2020-05-04','2020-05-28','died')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(16,9,4,4,'ulcer','2020-02-28','2020-04-28','died')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(17,10,5,5,'heart_attack','2020-03-02','2020-03-28','moderate')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(18,11,6,6,'cataract','2020-06-05','2020-07-28','serious')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(19,12,7,7,'angina','2020-07-07','2020-08-28','in-patient')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(20,13,8,8,'chickenpox','2020-09-01','2020-10-01','died')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(21,14,9,1,'appendicitis','2020-10-16','2020-11-28','moderate')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(22,15,10,2,'stomachache','2020-09-16','2020-10-28','serious')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(23,16,11,3,'caries','2020-11-28','2020-12-28','in-patient')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(24,17,12,4,'ulcer','2020-01-04','2020-02-25','died')
insert into treatment (appointment_id,patient_id,doctor_id,service_id,diagnosis,starting_date,completion_date,current_state) values(25,18,1,1,'appendicitis','2020-03-04','2020-04-28','moderate')

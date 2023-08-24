--find all cases where patients returned to the outpatient clinic less than a month after their next visit
SELECT Patients_Information.first_name, Patients_Information.last_name, V1.visit_date_and_time, V2.visit_date_and_time
	FROM Visit_Info V1 CROSS JOIN Visit_Info V2
		INNER JOIN Patients_Information 
			ON Patients_Information.patient_id = V1.patient_id AND Patients_Information.patient_id = V2.patient_id
	WHERE V1.visit_id > V2.visit_id AND ABS(DATEDIFF(month, V1.visit_date_and_time, V2.visit_date_and_time)) < 1


--Bring out the names of those doctors who work exclusively with disabled people
Select INJ.first_name, INJ.last_name FROM (SELECT DISTINCT Doctors.first_name, Doctors.last_name FROM
	Doctors, Visit_Info, Patients_Information, Social_Statuses, Social_Status_Types
	WHERE Doctors.doctor_id = Visit_Info.doctor_id AND
	Visit_Info.patient_id = Patients_Information.patient_id AND
	Patients_Information.patient_id = Social_Statuses.patient_id AND
	Social_Statuses.social_status_id = Social_Status_Types.social_status_id AND
	Social_Status_Types.social_status_name != 'инвалид') AS NOINJ
	RIGHT OUTER JOIN
	(SELECT DISTINCT Doctors.first_name, Doctors.last_name FROM
	Doctors, Visit_Info, Patients_Information, Social_Statuses, Social_Status_Types
	WHERE Doctors.doctor_id = Visit_Info.doctor_id AND
	Visit_Info.patient_id = Patients_Information.patient_id AND
	Patients_Information.patient_id = Social_Statuses.patient_id AND
	Social_Statuses.social_status_id = Social_Status_Types.social_status_id AND
	Social_Status_Types.social_status_name = 'инвалид') AS INJ
	ON NOINJ.last_name = INJ.last_name
	WHERE NOINJ.first_name IS NULL AND NOINJ.last_name is NULL


--Determine the percentage of caries patients over the entire time ever referred to the hospital
select s1*100/s2 FROM
(SELECT count(*) AS s1 FROM Patients_Information, Visit_Info, Diagnosises, Diagnosis_Types, Conditions
	Where Patients_Information.patient_id = Visit_Info.patient_id AND
	Visit_Info.visit_id = Diagnosises.visit_id AND
	Diagnosises.diagnosis_id = Diagnosis_Types.diagnosis_id AND
	Visit_Info.condition_id = Conditions.condition_id AND
	condition_name = 'направлен в стационар' AND
	diagnosis_name = 'Кариес') AS tab1,
(SELECT count(*) AS s2 FROM  Diagnosis_Types, Diagnosises, Visit_info
	WHERE Diagnosis_Types.diagnosis_id = Diagnosises.diagnosis_id AND
	Diagnosises.visit_id = Visit_Info.visit_id AND 
	Diagnosis_Types.diagnosis_name = 'Кариес') AS tab2;


--Patients treated by physicians of all specialties
SELECT Tab1.first_name, Tab1.last_Name FROM 
	(SELECT Patients_Information.first_name, Patients_Information.last_name, count(*) as c FROM Visit_Info
	INNER JOIN Patients_Information
		ON Visit_Info.patient_id = Patients_Information.patient_id
	INNER JOIN Doctors
		ON Doctors.doctor_id = Visit_Info.doctor_id
	INNER JOIN Doctors_Specializations
		ON Doctors_Specializations.doctor_id = Doctors.doctor_id
	INNER JOIN Specializations
		ON Specializations.specialization_id = Doctors_Specializations.specialization_id
	GROUP BY Patients_Information.first_name, Patients_Information.last_name) AS Tab1,
	(SELECT count (*) AS s FROM Specializations) AS Tab2
WHERE Tab1.c = Tab2.s


--display the names of patients in the inpatient unit that are linked to site 11
SELECT distinct first_name, last_name FROM treatment 
		INNER JOIN patient
		ON patient.patient_id = treatment.patient_id
		INNER JOIN site
		ON patient.site_id= site.site_id
		WHERE current_state = 'in-patient' AND patient.site_id=11


--display the names of patients who had dental appointments in 2020
SELECT DISTINCT patient.first_name, patient.last_name FROM
	treatment INNER JOIN doctor
		ON treatment.doctor_id = doctor.doctor_id
	INNER JOIN patient
		ON treatment.patient_id =  patient.patient_id
	WHERE doctor.specialization = 'dentist' AND year(treatment.starting_date) = '2020';

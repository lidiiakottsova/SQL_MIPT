--Physician, patient, time since last visit for patients whose diagnosis has been removed
CREATE VIEW Doc_Pat_Time AS
	SELECT Doctors.first_name as doc_first_name, Doctors.last_name as doc_last_name, Patients_Information.first_name as pat_first_name, Patients_Information.last_name as pat_last_name, min(DATEDIFF(DAY, Visit_Info.visit_date_and_time, GETDATE())) as days FROM Patients_Information
		INNER JOIN Visit_Info
			ON Patients_Information.patient_id = Visit_Info.patient_id
		INNER JOIN Doctors
			ON Visit_Info.doctor_id = Doctors.doctor_id
		INNER JOIN Diagnosises
			ON Diagnosises.visit_id = Visit_Info.visit_id
		WHERE Diagnosises.diagnosis_status = 0
		GROUP BY Doctors.first_name, Doctors.last_name, Patients_Information.first_name, Patients_Information.last_name

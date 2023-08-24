--Physician, patient, treatment time - for cured patients only
CREATE VIEW Docpattime as
	SELECT doctor.first_dname as doc_first_name, doctor.last_dname as doc_last_name, patient.first_name as pat_first_name, patient.last_name as pat_last_name, min(DATEDIFF(DAY, treatment.starting_date, treatment.completion_date)) as days FROM patient
		INNER JOIN treatment
			ON patient.patient_id = treatment.patient_id
		INNER JOIN doctor
			ON treatment.doctor_id = doctor.doctor_id
		INNER JOIN diagnosis
			ON diagnosis.diagnosis = treatment.diagnosis
		WHERE treatment.current_state='moderate'
		GROUP BY doctor.last_dname,doctor.first_dname, patient.last_name,patient.first_name
		GO
		SELECT * FROM Docpattime

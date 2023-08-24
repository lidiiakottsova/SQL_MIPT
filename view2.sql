--Social status, month of 2016, diagnosis, number of people cured in that month.
DROP VIEW Social_Status_Month_Diagonsis

CREATE VIEW Social_Status_Month_Diagonsis AS
	SELECT Social_Status_Types.social_status_name, MONTH(Visit_Info.visit_date_and_time) AS MON, Diagnosis_Types.diagnosis_name, count(Patients_Information.patient_id) as pats FROM Patients_Information 
		INNER JOIN Social_Statuses
			ON Social_Statuses.patient_id = Patients_Information.patient_id
		INNER JOIN Social_Status_Types
			ON Social_Statuses.social_status_id = Social_Status_Types.social_status_id
		INNER JOIN Visit_Info
			ON Visit_Info.patient_id = Patients_Information.patient_id
		INNER JOIN Diagnosises
			ON Diagnosises.visit_id = Visit_Info.visit_id
		INNER JOIN Diagnosis_Types
			ON Diagnosis_Types.diagnosis_id = Diagnosises.diagnosis_id
		WHERE Diagnosises.diagnosis_status = 0 AND Social_Statuses.social_status_finish IS NULL AND YEAR(Visit_Info.visit_date_and_time) = '2016'
		GROUP BY MONTH(Visit_Info.visit_date_and_time), Social_Status_Types.social_status_name, Diagnosis_Types.diagnosis_name

SELECT * FROM Social_Status_Month_Diagonsis

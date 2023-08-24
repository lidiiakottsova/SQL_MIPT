--Social status, month of 2020, diagnosis, number of people treated in that month
use polyclinic9
go

CREATE VIEW Socstatmondia AS
	SELECT patient.social_status, MONTH(treatment.completion_date) AS MON, diagnosis.diagnosis, count(patient.patient_id) as pats FROM patient 
		INNER JOIN treatment
			ON treatment.patient_id = patient.patient_id
		INNER JOIN diagnosis
			ON diagnosis.diagnosis = treatment.diagnosis
		WHERE treatment.current_state ='moderate' AND YEAR(treatment.completion_date)='2020'
		GROUP BY MONTH(treatment.completion_date), patient.social_status, diagnosis.diagnosis

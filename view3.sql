--Physician, number of visits per year during which the patient was diagnosed, total number of visits to the physician. 

CREATE VIEW Doctor_SucVis_TotVis AS
	SELECT doctor.first_dname, doctor.last_dname, COUNT(CASE WHEN treatment.current_state = 'moderate' THEN 1 END) AS SUCCESS, COUNT(treatment.patient_id) AS TOTAL FROM treatment
			INNER JOIN doctor
				ON doctor.doctor_id = treatment.doctor_id
			INNER JOIN diagnosis
				ON diagnosis.diagnosis = treatment.diagnosis
			GROUP BY doctor.first_dname, doctor.last_dname

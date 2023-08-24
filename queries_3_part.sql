--Remove all critically ill patients from the outpatient clinic
DELETE FROM patient WHERE patient_id IN
	(SELECT DISTINCT patient.patient_id FROM patient
		INNER JOIN treatment
			ON patient.patient_id = treatment.patient_id
		WHERE current_state = 'serious')


--remove all patients with tuberculosis vaccinations
DELETE FROM Patients_Information
	WHERE patient_id IN
		(SELECT DISTINCT Patients_Information.patient_id FROM Patient_Vaccinations
			INNER JOIN Vaccinations
				ON Patient_Vaccinations.vaccination_id = Vaccinations.vaccination_id
			INNER JOIN Patients_Information
				ON Patients_Information.patient_id = Patient_Vaccinations.patient_id
		WHERE Vaccinations.vaccination_name = 'От туберкулеза')


--remove all patients from site 88
DELETE FROM patient
	WHERE patient_id IN
		(SELECT DISTINCT patient.patient_id FROM treatment
			INNER JOIN site
				ON patient.site_id = site.site_id
		WHERE site.site_id = 88)

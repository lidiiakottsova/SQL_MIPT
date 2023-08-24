--change the condition of all ulcer patients referred to the hospital
UPDATE treatment
	SET current_state = 'in-patient'
	WHERE treatment.appointment_id IN
		(SELECT treatment.appointment_id FROM diagnosis
			INNER JOIN treatment
				ON treatment.diagnosis = diagnosis.diagnosis
			WHERE diagnosis.diagnosis = 'ulcer' AND treatment.current_state != 'in-patient')


--if the patient has a flu shot, replace it with Tantum Verde if prescribed No-Shpa
UPDATE Visit_Medicines
	Set medicine_id = 3
	WHERE Visit_Medicines.visit_id IN
		(SELECT Visit_Info.visit_id FROM Patients_Information
			INNER JOIN Visit_Info
				ON Patients_Information.patient_id = Visit_Info.patient_id
			INNER JOIN Visit_Medicines
				ON Visit_Info.visit_id = Visit_Medicines.visit_id
			INNER JOIN Medicines
				ON Visit_Medicines.medicine_id = Medicines.medicine_id
			INNER JOIN Patient_Vaccinations
				ON Patients_Information.patient_id = Patient_Vaccinations.patient_id
			INNER JOIN Vaccinations
				ON Patient_Vaccinations.vaccination_id = Vaccinations.vaccination_id
			WHERE Vaccinations.vaccination_name = 'От гриппа' AND Medicines.medicine_name = 'Но-Шпа' AND Medicines.medicine_name != 'Тантум Верде')
		AND medicine_id = 7

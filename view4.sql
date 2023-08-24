--Year of birth, the number of patients of that year of birth, the diagnosis most commonly encountered in them.
use polyclinic9
go

CREATE VIEW Year_Pats_Diagn AS
	SELECT YEARPATS.year_, YEARPATS.count_, YEARDIAGN.diagn FROM
		(SELECT YEAR(patient.date_of_birth) as year_, count(DISTINCT patient.patient_id) as count_ FROM patient
			INNER JOIN treatment
				ON patient.patient_id = treatment.patient_id
			INNER JOIN diagnosis
				ON diagnosis.diagnosis = treatment.diagnosis
			GROUP BY YEAR(patient.date_of_birth)) AS YEARPATS
		INNER JOIN
		(SELECT year1, MAX(diagnosis) as diagn FROM
			(SELECT COUNT_YEAR.year1, max(COUNT_YEAR.count1) as count_max FROM
				(SELECT YEAR(patient.date_of_birth) as year1, diagnosis.diagnosis, count(diagnosis.diagnosis) as count1 FROM patient
					INNER JOIN treatment
						ON patient.patient_id = treatment.patient_id
					INNER JOIN diagnosis
						ON treatment.diagnosis = diagnosis.diagnosis
					GROUP BY YEAR(patient.date_of_birth), diagnosis.diagnosis) AS COUNT_YEAR
				GROUP BY COUNT_YEAR.year1) AS YEARMAX
			INNER JOIN
			(SELECT YEAR(patient.date_of_birth) as year2, diagnosis.diagnosis, count(diagnosis.diagnosis) as count2 FROM patient
					INNER JOIN treatment
						ON patient.patient_id = treatment.patient_id
					INNER JOIN diagnosis
						ON treatment.diagnosis = diagnosis.diagnosis
					GROUP BY YEAR(patient.date_of_birth), diagnosis.diagnosis) AS YEARCOUNT
			ON YEARMAX.year1 = YEARCOUNT.year2 AND YEARMAX.count_max = YEARCOUNT.count2
			GROUP BY year1) AS YEARDIAGN
		ON YEARPATS.year_ = YEARDIAGN.year1

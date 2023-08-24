--The doctor who, on average, treats the longest
use polyclinic9
go

SELECT TOP 4 WITH TIES doctor.last_dname, doctor.first_dname
FROM doctor
INNER JOIN TREATMENT 
ON treatment.doctor_id=doctor.doctor_id
	GROUP BY last_dname, first_dname
	ORDER BY AVG(DATEDIFF(DAY, treatment.starting_date, treatment.completion_date)) desc


--Identify the most successful physicians (highest cure rate)
use polyclinic9
go

SELECT TOP  WITH TIES last_dname, first_dname
FROM doctor
INNER JOIN treatment
ON treatment.doctor_id=doctor.doctor_id
	WHERE current_state='moderate'
    GROUP BY first_dname, last_dname
	ORDER BY (count('moderate'))/(count(*)) DESC


--Identify the diagnosis that is most common among patients over 30 years of age
use polyclinic9
go

SELECT TOP 7 with ties diagn
FROM Yearpatdia
	WHERE YEAR (GETDATE()) - (year_)>30
	GROUP BY diagn
	ORDER BY COUNT (*) DESC


--Find the patient who was seen before everyone else
SELECT TOP 1 Docpattime.pat_first_name, Docpattime.pat_last_name FROM Docpattime
	ORDER BY Docpattime.days DESC

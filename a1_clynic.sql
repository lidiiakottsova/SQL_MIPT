--find the patient who was seen before everyone else.
SELECT TOP 1 Doc_Pat_Time.pat_first_name, Doc_Pat_Time.pat_last_name FROM Doc_Pat_Time
	ORDER BY Doc_Pat_Time.days DESC


--Determine the most frequent diagnosis in patients of such a birth year that the number of patients of that birth year is maximized
DECLARE @M INT -- maximum number of diagnoses
SET @M = (SELECT MAX(Year_Pats_Diagn.count_) FROM Year_Pats_Diagn)
DECLARE @S INT -- Number of patients with the maximum number of diagnoses
SET @S = (SELECT count(Year_Pats_Diagn.year_)  FROM Year_Pats_Diagn WHERE Year_Pats_Diagn.count_ = @M)
SELECT TOP (@S) Year_Pats_Diagn.diagn FROM Year_Pats_Diagn
	ORDER BY Year_Pats_Diagn.count_ DESC

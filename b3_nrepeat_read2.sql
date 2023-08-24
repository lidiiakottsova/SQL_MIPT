--REPEATABLE READ
--Non-repeatable reading

USE new

GO

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN

UPDATE Visit_Info
	SET visit_date_and_time = '01.11.2017 15:00:00'
	WHERE doctor_id = 41 and patient_id = 26

COMMIT TRAN

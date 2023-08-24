--REPEATABLE READ
--Non-repeatable reading

USE new

GO

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN	


SELECT * FROM Visit_Info
	WHERE doctor_id = 41 and patient_id = 26

WAITFOR DELAY '00:00:05'

SELECT * FROM Visit_Info
	WHERE doctor_id = 41 and patient_id = 26

COMMIT TRAN

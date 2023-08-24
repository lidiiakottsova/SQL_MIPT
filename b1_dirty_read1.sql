--READ COMMITED
--Dirty read

USE polyclinic9

GO

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRAN

UPDATE treatment
SET diagnosis = 'heart_attack'
WHERE doctor_id = 5 and patient_id = 1

WAITFOR DELAY '00:00:05'

ROLLBACK TRAN

SELECT * FROM treatment
WHERE doctor_id = 5 and patient_id = 1


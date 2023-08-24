--READ UNCOMMITED
--Lost changes

USE polyclinic9

GO

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

SELECT * FROM treatment
WHERE appointment_id = 1
BEGIN TRAN

UPDATE treatment 
SET starting_date = DATEADD(day,4,starting_date)
WHERE appointment_id = 1;

WAITFOR DELAY '00:00:05';

COMMIT TRAN

SELECT * FROM treatment
WHERE appointment_id = 1

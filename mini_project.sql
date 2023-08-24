-- роль testrole
-- логин testlogin
-- пользователь test

USE polyclinic9

IF EXISTS (SELECT * FROM sys.database_principals WHERE sys.database_principals.name = 'testrole')
BEGIN
EXEC sp_droprolemember 'testrole', 'test'
DROP ROLE testrole
END
GO

IF EXISTS (SELECT * FROM sys.sql_logins WHERE sys.sql_logins.name = 'testlogin')
DROP LOGIN testlogin
GO

IF EXISTS (SELECT * FROM sys.database_principals WHERE sys.database_principals.name = 'test')
DROP USER test	
GO

CREATE LOGIN testlogin
	WITH PASSWORD = '123';
GO


CREATE USER test FOR LOGIN testlogin;
GO



GRANT SELECT, INSERT, UPDATE ON OBJECT :: DOCTOR TO test;
GO

EXECUTE AS USER = 'test';



SELECT * FROM doctor


INSERT INTO doctor VALUES (13,44,25,'Novikova', 'Alla', '1980-03-07', 3,'cardiologist')



UPDATE doctor
SET first_dname = 'Anne'
WHERE first_dname = 'Olga'



REVERT

REVOKE SELECT, INSERT, UPDATE ON OBJECT :: doctor TO test;
GO

GRANT SELECT (patient_id, site_id), UPDATE (social_status) ON OBJECT :: patient to test
GO

EXECUTE AS USER = 'test';


SELECT patient_id, site_id FROM patient



UPDATE patient
SET social_status = 'working'
WHERE patient_id = 1


REVERT

REVOKE SELECT (patient_id, site_id), UPDATE (social_status) ON OBJECT :: patient to test
GO

GRANT SELECT ON OBJECT :: site TO test;
GO

EXECUTE AS USER = 'test';

SELECT * FROM site



REVERT

REVOKE SELECT ON OBJECT :: site TO test;

GRANT SELECT ON OBJECT :: Docpattime TO test;
GO

EXECUTE AS USER = 'test';

SELECT * FROM Docpattime



REVERT

REVOKE SELECT ON OBJECT :: Docpattime TO test;


CREATE ROLE testrole
GO

GRANT SELECT, UPDATE ON docpatient TO testrole
GO


EXEC sp_addrolemember 'testrole', 'test'

EXECUTE AS USER = 'test';


UPDATE docpatient																		
SET doc_last_name='Vladimir'														
WHERE pat_first_name='Robert'                             


REVERT

REVOKE UPDATE ON docpatient TO testrole

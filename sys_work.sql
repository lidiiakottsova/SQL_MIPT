SELECT * FROM sys.fn_dblog(NULL, NULL)

SELECT * FROM sys.change_tracking_tables

SELECT * FROM sys.objects -- таблицы, представления, ограничения целостности (первичные и внешние ключи), триггеры и т. д.

SELECT * FROM sys.columns -- информация о столбцах таблицы и параметрах хранимых процедур

SELECT * FROM sys.systypes -- информация о типах данных

SELECT * FROM sys.sysreferences -- информация о ссылочных ограничениях целостности данных (внешних ключах)

SELECT * FROM sys.syscomments -- текстовые описания объектов (в частности, SQL-скрипты создания триггеров и представлений)

SELECT * FROM sys.sysusers -- информация о пользователях базы данных

SELECT * FROM sys.user_token

SELECT * FROM sys.identity_columns

SELECT * FROM sys.database_principals

SELECT * FROM sys.database_role_members

SELECT * FROM sys.foreign_keys

SELECT * FROM sys.login_token

SELECT * FROM sys.check_constraints

SELECT * FROM sys.views

SELECT * FROM sys.messages

SELECT * FROM sys.schemas

SELECT * FROM sys.sql_modules

SELECT * FROM sys.extended_procedures

SELECT * FROM sys.sysusers

SELECT a.name AS table_name, b.name AS column_name, is_identity
           FROM sysobjects a, sys.	columns b
           WHERE a.id = b.object_id and
	is_identity=1


SELECT a.name AS table_name, b.name AS column_name, b.is_identity, seed_value, increment_value,last_value
FROM sysobjects a, sys.columns b, sys.identity_columns c
WHERE a.id = b.object_id
           AND a.xtype = 'U'
AND b.is_identity = 1
AND b.object_id = c.object_id
ORDER BY 1, 2

select rol.name as "group" from sysusers rol, sysusers test
where is_rolemember(rol.name , test.name) = 1 and
	 rol.issqlrole = 1 and
	 test.name = 'test'

-- вывести таблицы, из коотрых состоят представления
SELECT OBJECT_NAME(referencing_id) AS view_name,
referenced_entity_name as table_name
FROM sys.sql_expression_dependencies AS sed
INNER JOIN sys.objects AS tab ON sed.referencing_id = tab.object_id
WHERE tab.type_desc='VIEW'

--По имени пользователя вывести все объекты какой-то схемы, которой он владеет (иметь в виду, что имя схемы не всегда совпадает с владельцем объектов)
SELECT SCHEMA_NAME(schema_id) AS 'schema', name
FROM sys.objects
WHERE USER_NAME(OBJECTPROPERTY(object_id, 'OwnerId')) = user_name()


--вывести размер бд на диске
select name, physical_name, size * 8 as size  from sys.database_files


SELECT * FROM sys.database_files

SELECT *
FROM sys.dm_exec_sessions
          where session_id = @@spid


SELECT * FROM sys.sysusers WHERE issqlrole = 1

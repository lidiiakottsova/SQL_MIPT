SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
--Lost changes
BEGIN TRANSACTION
	 UPDATE STADIUMS SET capacity = 90000 WHERE hometeam_id = 24


COMMIT

--Dirty reading
BEGIN TRANSACTION
	SELECT stadium_id, name, capacity FROM STADIUMS WHERE stadium_id = 311

	SELECT stadium_id, name, capacity FROM STADIUMS WHERE stadium_id = 311

	SELECT stadium_id, name, capacity FROM STADIUMS WHERE stadium_id = 311
COMMIT
--------------------------------------------------------------------------
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
--Dirty reading
BEGIN TRANSACTION
	SELECT stadium_id, name, capacity FROM STADIUMS WHERE stadium_id = 311

	SELECT stadium_id, name, capacity FROM STADIUMS WHERE stadium_id = 311

	SELECT stadium_id, name, capacity FROM STADIUMS WHERE stadium_id = 311
COMMIT

--Non-repeatable reading
BEGIN TRANSACTION
	SELECT stadium_id, name, capacity FROM STADIUMS WHERE stadium_id = 311


	SELECT stadium_id, name, capacity FROM STADIUMS WHERE stadium_id = 311
COMMIT
--------------------------------------------------------------------------
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
--Non-repeatable reading
BEGIN TRANSACTION
	SELECT stadium_id, name, capacity FROM STADIUMS WHERE stadium_id = 311


	SELECT stadium_id, name, capacity FROM STADIUMS WHERE stadium_id = 311
COMMIT

--Phantom
BEGIN TRANSACTION
	SELECT name, capacity FROM STADIUMS WHERE capacity >= 75000


	SELECT name, capacity FROM STADIUMS WHERE capacity >= 75000
COMMIT
-----------------------------------------------------------------
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
--Phantom
BEGIN TRANSACTION
	SELECT name, capacity FROM STADIUMS WHERE capacity >= 75000


	SELECT name, capacity FROM STADIUMS WHERE capacity >= 75000
COMMIT

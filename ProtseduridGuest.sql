CREATE PROCEDURE LisaGuest
@f_name varchar (30),
@l_name varchar (30),
@m_since datetime
AS
BEGIN
INSERT INTO guest(first_name,last_name,member_since) VALUES (@f_name,@l_name,@m_since);
SELECT * FROM guest;
END
--kontroll
SELECT * FROM guest;
EXECUTE LisaGuest @f_name= 'Alpha', @l_name='Bravo',@m_since='2020-09-11';


CREATE PROCEDURE KustutaGuest
@id int
AS
BEGIN
SELECT * FROM guest;
DELETE FROM guest WHERE id=@id;
SELECT * FROM guest;
END
--kontroll
EXECUTE KustutaGuest @id=7;

CREATE PROCEDURE UpdateGuest
@id int,
@f_name varchar (30),
@l_name varchar (30),
@m_since datetime
AS
BEGIN
SELECT * FROM guest;
UPDATE guest SET first_name=@f_name ,  last_name=@l_name , member_since=@m_since WHERE id=@id;
SELECT * FROM guest;
END
--kontroll
EXECUTE UpdateGuest 4,'Quebec','Echo','2020-11-09';


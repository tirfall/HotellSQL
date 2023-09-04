CREATE TABLE room(
id int not null Primary key IDENTITY(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke BIT
);

--lisamine triger
CREATE TRIGGER roomLisamine
ON room
FOR INSERT
AS
INSERT INTO logi(kuupaev,kasutaja,andmed,tegevus)
SELECT GETDATE(), USER,
CONCAT(inserted.number, ' ,', inserted.name,' ,',inserted.status,' ,',inserted.smoke),
'room on lisatud' 
FROM inserted
--kontroll
INSERT INTO room(number,name,status,smoke) VALUES (1,'Nice place','10/10', 1);
INSERT INTO room(number,name,status,smoke) VALUES (2,'Very nice place','10/10', 1);
SELECT * FROM room;
SELECT * FROM logi;

--kasutatud triger

CREATE TRIGGER roomKustutamine
ON room
FOR DELETE
AS
INSERT INTO logi(kuupaev,kasutaja,andmed,tegevus)
SELECT GETDATE(), USER,
CONCAT(deleted.number, ' ,', deleted.name,' ,', deleted.status,' ,',deleted.smoke),
'room on kustatud' 
FROM deleted
--kontroll
DELETE FROM room WHERE id=2;
SELECT * FROM room;
SELECT * FROM logi;

--update triger

CREATE TRIGGER roomUpdate
ON room
FOR UPDATE
AS
INSERT INTO logi(kuupaev,kasutaja,andmed,tegevus)
SELECT GETDATE(), USER,
CONCAT('VANAD - ' ,deleted.number, ' ,', deleted.name,' ,', deleted.status,' ,', deleted.smoke,
' UUED - ', inserted.number, ' ,',inserted.name, ' ,',inserted.status, ' ,',inserted.smoke),
'room on uuendatud' 
FROM deleted INNER JOIN inserted
ON deleted.id=inserted.id

--kontroll
SELECT * FROM room;
UPDATE room SET number=4 WHERE id=1;
SELECT * FROM room;
SELECT * FROM logi;
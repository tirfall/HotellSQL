CREATE TRIGGER guestUpdate
ON guest
FOR UPDATE
AS
INSERT INTO logi(kuupaev,kasutaja,andmed,tegevus)
SELECT GETDATE(), USER,
CONCAT('VANAD - ' ,deleted.first_name, ' ,', deleted.last_name,
' UUED - ', inserted.first_name, ' ,',inserted.last_name),
'guest on uuendatud' 
FROM deleted INNER JOIN inserted
ON deleted.id=inserted.id

--kontroll
SELECT * FROM guest;
UPDATE guest SET first_name='Alex' WHERE id=3;
SELECT * FROM guest;
SELECT * FROM logi;
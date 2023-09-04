CREATE TRIGGER guestKustutamine
ON guest
FOR DELETE
AS
INSERT INTO logi(kuupaev,kasutaja,andmed,tegevus)
SELECT GETDATE(), USER,
CONCAT(deleted.first_name, ' ,', deleted.last_name),
'guest on kustatud' 
FROM deleted
--kontroll
DELETE FROM guest WHERE id=2;
SELECT * FROM guest;
SELECT * FROM logi;



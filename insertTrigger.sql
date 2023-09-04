CREATE TABLE guest(
id int NOT NULL Primary key IDENTITY(1,1),
first_name varchar(80),
last_name varchar(80) NULL,
member_since date
);
CREATE TABLE logi(
id int NOT NULL Primary key IDENTITY(1,1),
kuupaev datetime,
kasutaja varchar(80),
andmed TEXT,
tegevus varchar(100)
);

CREATE TRIGGER guestLisamine
ON guest
FOR INSERT
AS
INSERT INTO logi(kuupaev,kasutaja,andmed,tegevus)
SELECT GETDATE(), USER,
CONCAT(inserted.first_name, ' ,', inserted.last_name),
'guest on lisatud' 
FROM inserted
--kontroll
INSERT INTO guest(first_name,last_name,member_since) VALUES ('Aleks','Klimov','2020-10-05');
SELECT * FROM guest;
SELECT * FROM logi;
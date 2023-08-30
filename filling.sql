INSERT INTO room_type(description,max_capacity)
VALUES ('single',1);
INSERT INTO room_type(description,max_capacity)
VALUES ('double',2);

INSERT INTO room(number,name,status,smoke,room_type_id) VALUES (1,'Nice place','10/10', 1, 1);
INSERT INTO room(number,name,status,smoke,room_type_id) VALUES (2,'Very nice place','10/10', 1, 2);
INSERT INTO room(number,name,status,smoke,room_type_id) VALUES (3,'Not nice place','10/10', 0, 1);
INSERT INTO room(number,name,status,smoke,room_type_id) VALUES (4,'Cheap place','10/10', 0, 1);
INSERT INTO room(number,name,status,smoke,room_type_id) VALUES (5,'Family place','10/10', 0, 2);

INSERT INTO guest(first_name,last_name,member_since) VALUES ('Aleks','Klimov','2020-10-05')
INSERT INTO guest(first_name,last_name,member_since) VALUES ('Ahmed','Mulahov','2021-09-15')
INSERT INTO guest(first_name,last_name,member_since) VALUES ('John','Tarov','2022-01-13')
INSERT INTO guest(first_name,last_name,member_since) VALUES ('Timur','Emelyanenko','2023-05-05')
INSERT INTO guest(first_name,last_name,member_since) VALUES ('valeria','Hilus','2020-06-02')

INSERT INTO reservation(date_in,date_out,made_by,guest_id) VALUES ('2023-10-05','2023-11-05','Aleks',1);
INSERT INTO reservation(date_in,date_out,made_by,guest_id) VALUES ('2023-09-01','2023-09-11','Ahmed',2);
INSERT INTO reservation(date_in,date_out,made_by,guest_id) VALUES ('2023-09-05','2023-09-15','John',3);
INSERT INTO reservation(date_in,date_out,made_by,guest_id) VALUES ('2023-10-05','2023-11-05','Timur',4);
INSERT INTO reservation(date_in,date_out,made_by,guest_id) VALUES ('2023-09-25','2023-10-05','Valeria',5);


INSERT INTO reserved_room(number_of_rooms,room_type_id,reservation_id,status) VALUES (1,1,1,'Active');
INSERT INTO reserved_room(number_of_rooms,room_type_id,reservation_id,status) VALUES (2,2,2,'Active');
INSERT INTO reserved_room(number_of_rooms,room_type_id,reservation_id,status) VALUES (3,1,3,'Active');
INSERT INTO reserved_room(number_of_rooms,room_type_id,reservation_id,status) VALUES (4,1,4,'Active');
INSERT INTO reserved_room(number_of_rooms,room_type_id,reservation_id,status) VALUES (5,2,5,'Active');

INSERT INTO  occupied_room(check_in,check_out,room_id,reservation_id) VALUES ('2023-10-05','2023-11-05',1,1);
INSERT INTO  occupied_room(check_in,check_out,room_id,reservation_id) VALUES ('2023-09-01','2023-09-11',2,2);
INSERT INTO  occupied_room(check_in,check_out,room_id,reservation_id) VALUES ('2023-09-05','2023-09-15',3,3);
INSERT INTO  occupied_room(check_in,check_out,room_id,reservation_id) VALUES ('2023-10-05','2023-11-05',4,4);
INSERT INTO  occupied_room(check_in,check_out,room_id,reservation_id) VALUES ('2023-09-25','2023-10-05',5,5);

INSERT INTO hosted_at(guest_id,occupied_room_id) VALUES (1,1);
INSERT INTO hosted_at(guest_id,occupied_room_id) VALUES (2,2);
INSERT INTO hosted_at(guest_id,occupied_room_id) VALUES (3,3);
INSERT INTO hosted_at(guest_id,occupied_room_id) VALUES (4,4);
INSERT INTO hosted_at(guest_id,occupied_room_id) VALUES (5,5);

SELECT * FROM hosted_at;
SELECT * FROM occupied_room;
SELECT * FROM reserved_room;
SELECT * FROM reservation;
SELECT * FROM guest;
SELECT * FROM room;
SELECT * FROM room_type;
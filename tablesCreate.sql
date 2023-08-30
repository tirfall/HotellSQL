CREATE TABLE room_type(
id int not null Primary key IDENTITY(1,1),
description varchar(80),
max_capacity int
);

CREATE TABLE room(
id int not null Primary key IDENTITY(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke BIT,
room_type_id int
);
ALTER TABLE room ADD FOREIGN KEY (room_type_id) REFERENCES room_type(id);

CREATE TABLE guest(
id int NOT NULL Primary key IDENTITY(1,1),
first_name varchar(80),
last_name varchar(80) NULL,
member_since date
);

CREATE TABLE reservation(
id int not null Primary key IDENTITY(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int
);
ALTER TABLE reservation ADD FOREIGN KEY (guest_id) REFERENCES guest(id);

CREATE TABLE occupied_room(
id int not null Primary key identity (1,1),
check_in datetime,
check_out datetime,
room_id int,
reservation_id int
);
ALTER TABLE occupied_room ADD FOREIGN KEY (room_id) REFERENCES room(id);
ALTER TABLE occupied_room ADD FOREIGN KEY (reservation_id) REFERENCES reservation(id);

create table hosted_at(
id int not null primary key identity (1,1),
guest_id int,
occupied_room_id int
);
ALTER TABLE hosted_at ADD FOREIGN KEY (guest_id) REFERENCES guest(id);
ALTER TABLE hosted_at ADD FOREIGN KEY (occupied_room_id) REFERENCES occupied_room(id);

create table reserved_room(
id int not null primary key identity (1,1),
number_of_rooms int,
room_type_id int,
reservation_id int,
status varchar(20)
);
ALTER TABLE reserved_room ADD FOREIGN KEY (room_type_id) REFERENCES room_type(id);
ALTER TABLE reserved_room ADD FOREIGN KEY (reservation_id) REFERENCES reservation(id);
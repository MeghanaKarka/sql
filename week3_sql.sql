

# 1.Users table
create table users
(
UserId integer(9) primary key,
UserName varchar(50)
);

insert into users values (1,'Modesto');
insert into users values (2,'Ayine');
insert into users values (3,'Christopher');
insert into users values (4,'Cheong woo');
insert into users values (5,'Saulat');
insert into users values (6,'Heidy');

# 2.Groups table
create table groups
(
GroupId integer(9) primary key,
GroupName varchar(50)
);

insert into groups values (1,'I.T.');
insert into groups values (2,'Sales');
insert into groups values (3,'Administration');
insert into groups values (4,'Operations');

# 3.Rooms table
create table rooms
(
RoomId integer(9) primary key,
RoomName varchar(50)
);

insert into rooms values (1,'101');
insert into rooms values (2,'102');
insert into rooms values (3,'Auditorium A');
insert into rooms values (4,'Auditorium B');

#4.User and group table
create table usergroups
(
UserGroupId integer(9) primary key,
GroupId integer(9),
UserId integer(9)
);

insert into usergroups values (1,1,1);
insert into usergroups values (2,1,2);
insert into usergroups values (3,2,3);
insert into usergroups values (4,2,4);
insert into usergroups values (5,3,5);
insert into usergroups values (6,NULL,6);
insert into usergroups values (7,4,NULL);


# 5. Key card access table
create table keycardaccess
(
AccessId  integer(9) primary key,
GroupId integer(9),
RoomId integer(9)
);

insert into keycardaccess values (1,1,1);
insert into keycardaccess values (2,1,2);
insert into keycardaccess values (3,2,2);
insert into keycardaccess values (4,2,3);
insert into keycardaccess values (5,3,NULL);




#1 Solution 
select a.*, b.UserId, c.UserName from 
groups a
left outer join usergroups b on b.GroupId = a.GroupId
left outer join users c on c.UserId = b.UserId;

#2 Solution 
select a.*, b.GroupId, c.GroupName from 
rooms a
left outer join keycardaccess b on b.RoomId = a.RoomId
left outer join groups c on c.GroupId = b.GroupId
order by a.RoomId;

#3 Solution 
select a.*, b.GroupId, c.GroupName, d.RoomId, e.RoomName from 
users a
left outer join usergroups b on b.UserId = a.UserId
left outer join groups c on c.GroupId = b.GroupId
left outer join keycardaccess d on d.GroupId = c.GroupId
left outer join rooms e on e.RoomId = d.RoomId
order by a.UserId, b.GroupId, d.RoomId;
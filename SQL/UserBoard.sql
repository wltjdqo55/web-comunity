create table UserBoard(
num int auto_increment primary key,
userId varchar(50),
userPassword varchar(50),
userNickName varchar(50),
userPhoneNumber varchar(20),
userEmail varchar(50),
wtime timestamp not null default current_timestamp,
hit int default 0,
isMailReceptionChecked boolean,
isPhoneReceptionChecked boolean,
userName varchar(50),
userBirth int,
power varchar(50) default "모든권한"
);
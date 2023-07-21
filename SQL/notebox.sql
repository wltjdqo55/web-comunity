create table notebox(
num int auto_increment primary key,
title varchar(100),
content varchar(1000) not null,
wtime timestamp not null default current_timestamp, 
tosendNickName varchar(50) not null,
userNickName varchar(50) not null,
cases int DEFAULT 1
);
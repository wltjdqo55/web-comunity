create table AdminNotice(
num int auto_increment primary key,
board varchar(50),
adminNickName varchar(50) default "관리자",
state varchar(50) default "공지",
title varchar(100),
content text,
wtime timestamp not null default current_timestamp, 
hit int,
recommend int
);
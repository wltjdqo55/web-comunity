create table Admin_QNA(
	num int auto_increment primary key,
    bnum int,
    userNickName varchar(50),
    adminNickName varchar(50) default "관리자",
    content text,
    wtime timestamp not null default current_timestamp
);
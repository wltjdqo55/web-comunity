create table QNA(
	num int auto_increment primary key,
    userNickName varchar(50),
    content text,
    wtime timestamp not null default current_timestamp,
    QNARadio varchar(50),
    State varchar(50) default "답변대기"
);
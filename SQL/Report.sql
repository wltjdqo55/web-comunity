create table Report(
	num int auto_increment primary key,
	title text,
    userNickName varchar(50),
    replyNickName varchar(50),
    reportcontent text,
    wtime timestamp not null default current_timestamp,
    ReportRadio varchar(50),
    State varchar(50) default "처리대기"
);
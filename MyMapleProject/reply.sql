create table reply(
bnum int auto_increment primary key,
num int default 0,
replytext varchar(1000) not null,
wtime timestamp not null default current_timestamp, 
replyNickName varchar(50) not null,
replyId varchar(50) not null,
replyPassword varchar(50) not null,
replyGoodCommand int default 0,
replyFuckCommand int default 0,
replyName varchar(50) not null,
groupNum int default 0,
stepNum int default 0,
boardcategory varchar(50) default "자유게시판"
);
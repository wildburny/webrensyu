create table customer(
	custid varchar2(20) primary key
	,password varchar2(20) not null
	,name varchar2(30) not null
	,email varchar2(30)
	,division varchar2(30) not null
	check(division = 'personal' or division = 'company')
	,idno varchar2(20) unique
	,address varchar2(100)
)

insert into CUSTOMER values ('1','1','1','1','personal','1','1');

update customer set password = '9999', name = '9999', email = '9999' where custid = '999';

create table board2(
	boardnum number primary key
	,id varchar2(20)
	,title varchar2(100) not null
	,content varchar2(2000) not null
	,inputdate date default sysdate
	,hits number default 0
)

create sequence board2_seq
start with 1
increment by 1

insert into BOARD2 values(board2_seq.nextval,'user01','hello','hi',sysdate,0);
insert into BOARD2 values(board2_seq.nextval,'user01','hello','hi',sysdate,0);
insert into BOARD2 values(board2_seq.nextval,'user01','hello','hi',sysdate,0);
insert into BOARD2 values(board2_seq.nextval,'user01','hello','hi',sysdate,0);
insert into BOARD2 values(board2_seq.nextval,'user01','hello','hi',sysdate,0);
insert into BOARD2 values(board2_seq.nextval,'user01','hello','hi',sysdate,0);
insert into BOARD2 values(board2_seq.nextval,'user01','hello','hi',sysdate,0);
insert into BOARD2 values(board2_seq.nextval,'user01','hello','hi',sysdate,0);
insert into BOARD2 values(board2_seq.nextval,'user01','hello','hi',sysdate,0);
insert into BOARD2 values(board2_seq.nextval,'user01','hello','hi',sysdate,0);

Select * from
	(
		Select rownum r, b.* from
			(
				Select boardnum, id, title, content, to_char(inputdate, 'yyyy/mm/dd') as inputdate, hits from board2
			) b
	) where r between 10 and 20;
	
	
create table reply2(
	replynum number primary key
	,boardnum number references board2 on delete cascade
	,id varchar2(20) not null
	,text varchar2(200) not null
	,inputdate date default sysdate
)

drop table reply2;


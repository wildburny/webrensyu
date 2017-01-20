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
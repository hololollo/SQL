--테이블설계표 / 테이블기본데이터
create table emp(u_id varchar(8) primary key, name varchar(20) not null, password varchar(20)not null, position varchar(4)not null, workplace varchar(20)not null, address varchar(50), birth DATE DEFAULT CURRENT_DATE, regday DATE DEFAULT CURRENT_DATE, wedday DATE DEFAULT CURRENT_DATE);

insert into emp values('A1001',	'강범준','a1234','A','강남구','신사동912','1979-12-25','2003-02-17',null);	
insert into emp values('A1002',	'권민지','a3421','B','강동구','강일동128','1987-1-8','2010-2-28','2015-2-28');	
insert into emp values('A1003',	'김동연','b1111','B','강북구','수유동100','1984-9-23','2007-11-15','2013-11-15');	
insert into emp values('A1004',	'김민식','c456','D','강서구','화곡1동37','2000-8-4','2021-9-26',null);	
insert into emp values('A1005',	'김민아','z675','C','관악구','난곡동67','1994-11-13','2018-1-5',null);	
insert into emp values('A1006',	'김응원','q789','A','광진구','능동13','1980-8-19','2003-10-11','2009-10-11');	
insert into emp values('A1007',	'김필규','g478','B','구로구','고척1동178','1983-7-7','2006-8-30','2012-8-30');	
insert into emp values('A1008',	'박동빈','d666','C','금천구','독산1동75','1996-9-4','2019-10-27',null);	
insert into emp values('A1009',	'박범수','e964','A','노원구','상계동777','1981-3-5','2004-4-27',null);	
insert into emp values('A1010',	'박은성','h369','D','도봉구','쌍문3동888','2001-4-27','2021-6-19',null);	


select * from emp;

create table sal(u_id varchar(8) primary key, salary number(10) not null, from_date DATE, to_date DATE);
insert into sal values('A1001',	4000000,'2022-5-1','2022-5-31');	
insert into sal values('A1002',	3600000,'2022-5-1','2022-5-31');	
insert into sal values('A1003',	3500000,'2022-5-1','2022-5-31');
insert into sal values('A1004',	3350000,'2022-5-1','2022-5-31');
insert into sal values('A1005',	3450000,'2022-5-1','2022-5-31');
insert into sal values('A1006',	3750000,'2022-5-1','2022-5-31');
insert into sal values('A1007',	3550000,'2022-5-1','2022-5-31');
insert into sal values('A1008',	3400000,'2022-5-1','2022-5-31');
insert into sal values('A1009',	3700000,'2022-5-1','2022-5-31');
insert into sal values('A1010',	3150000,'2022-5-1','2022-5-31');

select * from sal;

create table member(id varchar(12) primary key, password varchar(12) not null, name varchar(20) not null, address varchar(100), tel varchar(20) not null, reg_date DATE DEFAULT CURRENT_DATE);
	
select * from member;

create table book(bookid number(10) primary key, bookkind varchar(3) not null, booktitle varchar(50) not null, bookprice number(10) not null, bookcount number(5) not null, author varchar(20), pubcom varchar(20), pubdate DATE);

select * from book;

--종합실습1

create table member1(id varchar(12)primary key, password varchar(12)not null, name varchar(20) not null, address varchar(100), tel varchar(20)not null, req_date DATE DEFAULT sysdate);

insert into member1 values('bgh', 'a1234', '배곤희', '신사동912', '010-1111-2222', '2023-09-13');
insert into member1 values('yjh', 'a3421', '유정환', '강일동128', '010-2222-3333', '2023-09-13');
insert into member1 values('lmk', 'b1111', '이민규', '수유동1004', '010-3333-4444', '2023-09-14');
insert into member1 values('lsh', 'c456', '이성하', '화곡1동37', '010-4444-5555', '2023-09-15');
insert into member1 values('lyj', 'z675', '이연정', '난곡동67', '010-4444-2222', '2023-09-11');
insert into member1 values('lyl', 'q789', '이예린', '능동13', '010-5555-6666', '2023-09-15');
insert into member1 values('lws', 'g478', '이원석', '고척1동178', '010-6666-7777', '2023-09-13');
insert into member1 values('ljh', 'd666', '이정희', '독산1동75', '010-7777-8888', '2023-09-14');
insert into member1 values('ljw', 'e964', '이종우', '상계동777', '02-5555-2222', '2023-09-05');
insert into member1 values('jib', 'h369', '장인범', '쌍문3동888', '010-8888-9999', '2023-09-16');

insert into member1 values('kkt', 'a1004', '김기태', '가산동', '010-1004-1004', '2023-09-12');


-- number쓰면 에러 / int로 통일(자리수는 상관없다.)
create table book1(bookid int primary key, bookkind varchar(3) not null, booktitle varchar(50) not null, bookprice int not null, bookcount int not null, author varchar(30), pubcom varchar(20), pubdate DATE);
create sequence sseq increment by 1 start with 1;

insert into book1 values(sseq.nextval, 'IT', '이것이 자바다', 30000, 10, '신용권', '한빛미디어', '2021-08-20');
insert into book1 values(sseq.nextval, 'IT', '자바웹개발워크북', 31500, 19, '구멍가게코딩단', '남가람북스', '2022-08-04');
insert into book1 values(sseq.nextval, 'NV', '하얼빈', 14400, 15, '신용권', '김훈', '2022-08-03');
insert into book1 values(sseq.nextval, 'NV', '불편한편의점', 12600, 10, '김호연', '나무옆의자', '2022-08-10');
insert into book1 values(sseq.nextval, 'DV', '역행자', 15750, 8, '신용권', '자청', '2022-05-30');
insert into book1 values(sseq.nextval, 'DV', '자소서바이블', 18000, 15, '이형', '엔알디', '2022-08-25');
insert into book1 values(sseq.nextval, 'HC', '벌거벗은한국사', 17500, 10, 'tvn', '프런트페이지', '2022-08-22');
insert into book1 values(sseq.nextval, 'HC', '난중일기', 14000, 30, '이순신', '스타북스', '2022-07-27');
insert into book1 values(sseq.nextval, 'TC', '진짜쓰는실무엑셀', 20000, 10, '전진권', '제이펍', '2022-02-15');
insert into book1 values(sseq.nextval, 'TC', '빅데이터인공지능', 25000, 15, '박해선', '한빛미디어', '2020-12-21');

insert into book1 values(sseq.nextval, 'IT', '스프링프레임워크', 38000, 8, '김기태', '정복사', '2022-09-10');

--drop table book1;
--drop sequence sseq;
--alter table book1 modify author varchar(30);

select * from book1;


create table sales(sno int primary key, bno int not null, id varchar(12) not null, amount int default 1 not null, money int, salesday DATE DEFAULT sysdate);
create sequence bseq increment by 1 start with 1;
insert into sales values(bseq.nextval, 1, 'lhy', 1, 300000, sysdate);
insert into sales values(bseq.nextval, 2, 'ykh', 1, 598500, sysdate);
insert into sales values(bseq.nextval, 1, 'jjs', 2, 600000, sysdate);
insert into sales values(bseq.nextval, 9, 'lhy', 1, 200000, sysdate);
insert into sales values(bseq.nextval, 2, 'cmj', 5, 2992500, sysdate);
insert into sales values(bseq.nextval, 2, 'jjs', 3, 1795500, sysdate);
insert into sales values(bseq.nextval, 3, 'yjh', 2, 432000, sysdate);
insert into sales values(bseq.nextval, 5, 'hsy', 4, 504000, sysdate);
insert into sales values(bseq.nextval, 4, 'nsy', 8, 1008000, sysdate);
insert into sales values(bseq.nextval, 1, 'jbj', 3, 900000, sysdate);
insert into sales values(bseq.nextval, 2, 'kyj', 4, 2394000, sysdate);
insert into sales values(bseq.nextval, 7, 'lhn', 1, 175000, sysdate);
insert into sales values(bseq.nextval, 8, 'hth', 2, null, sysdate);
insert into sales values(bseq.nextval, 10, 'cmj',51, null, sysdate);
insert into sales values(bseq.nextval, 1, 'lhy', 3, null, sysdate);
insert into sales values(bseq.nextval, 2, 'cmj', 2, null, sysdate);
insert into sales values(bseq.nextval, 2, 'lhy', 1, null, sysdate);
insert into sales values(bseq.nextval, 1, 'vkh', 3, null, sysdate);

insert into sales values(bseq.nextval, 1, 'kkt', 2, 600000, sysdate); 

select * from sales;
--drop table sales;
--drop sequence bseq;
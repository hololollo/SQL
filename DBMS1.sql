create table emp (u_id varchar(20) not null primary key,name varchar(20) not null,pw varchar(20) not null, position varchar(4) not null, workplace varchar(20) not null, address varchar(50), birth date  ,regday date, wedday date );

select * from emp;
drop table emp;

create table member1 (id varchar(12) primary key,pw varchar(12) not null, name varchar(20) not null, addr varchar(100), tel varchar(20) not null, regday date default sysdate);
drop table member
select * from member;

create table sal(u_id varchar(8)primary key, salary number(10) not null,from_date date, "to_date" date);

select * from sal;
alter table sal rename column "to_date" to "TO_DATE";

create table book(bookid number(10) primary key ,bookkind varchar(3) not null,booktitle varchar(50) not null, bookcount number(5) not null,author varchar(20),pubcon varchar(20),pubdate date);
desc book;
drop table book;
--시퀀스 생성--
create sequence seq increment by 1 start with 1minvalue 1maxvalue 9999 nocycle;
insert into book
select * from book;

insert into emp values ('A1001','강범준','a1234','A','강남구','신사동 912','1979/12/25','2003/2/17',null);
insert into emp values ('A1002'   ,'권민지','a3421','B','강동구','강일동 128','1987/01/08','2010/2/28','2015/2/28');
insert into emp values ('B1003','김동연','b1111','B','강북구','수유동1004',   '1984/9/23','2007/11/15','2013/11/15');
insert into emp values ('B1004','김민식',   'c456','D','강서구','화곡1동37','2000/8/4','2021/9/26',null);
insert into emp values ('C1005','김민아',   'z675','C','관악구','난곡동 67','1994/11/13','2018/1/5',null);
insert into emp values ('C1006','김응원',   'q789','A','광진구','능동 13','1980/8/19','2003/10/11','2009/10/11');
insert into emp values ('D1007','김필규',   'g478','B','구로구','고척1동 178','1983/7/7','2006/8/30','2012/8/30');
insert into emp values ('D1008','박동빈',   'd666','B','금천구','독산1동 75','1996/9/4','2019/10/27',null);
insert into emp values ('E1009','박범수',   'e964','A','노원구','상계동 777','1981/3/5','2004/4/27',null);
insert into emp values ('E1010','박은성',   'h369','D','도봉구','쌍문3동 888','2001/4/27','2021/6/19',null);

--sal 에 로우 넣기
insert into sal values('A1001',4000000,'2022-05-01','2022-05-31');
insert into sal values('A1002',3600000,'2022-05-01','2022-05-31');
insert into sal values('B1003',3500000,'2022-05-01','2022-05-31');
insert into sal values('B1004',3350000,'2022-05-01','2022-05-31');
insert into sal values('C1005',3450000,'2022-05-01','2022-05-31');
insert into sal values('C1006',3750000,'2022-05-01','2022-05-31');
insert into sal values('D1007',3550000,'2022-05-01','2022-05-31');
insert into sal values('D1008',3400000,'2022-05-01','2022-05-31');
insert into sal values('E1009',3700000,'2022-05-01','2022-05-31');
insert into sal values('E1010',3150000,'2022-05-01','2022-05-31');

----종합실습------
---member1테이블 만들기--
create table member1(id varchar(12) primary key,pw varchar(12) not null,name varchar(20) not null, addr varchar(100), tel varchar(20) not null, regday date default sysdate);

--member1 값 넣기--
insert into member1 values('bgh','a1234,''배곤희','신사동 912','010-1111-2222','2023-09-13');
insert into member1 values('yjh','a3421','유정환','강일동 128','02-2222-3333',   '2023-09-13');
insert into member1 values('lmk','b1111','이민규','수유동 1004','010-3333-4444','2023-09-14');
insert into member1 values('lsh','c456','이성하','화곡1동 37','010-4444-5555',   '2023-09-15');
insert into member1 values('lyj','z675','이연정','난곡동 67','02-4444-2222','2023-09-11');
insert into member1 values('lyl','q789','이예린','능동 13','010-5555-6666','2023-09-15');
insert into member1 values('lws','g478','이원석','고척1동 178','010-6666-7777','2023-09-13');
insert into member1 values('ljh','d666','이정희','독산1동 75','010-7777-8888','2023-09-14');
insert into member1 values('ljw','e964','이종우','상계동 777','02-5555-2222','2023-09-05');
insert into member1 values('jib','h369','장인범','쌍문3동 888','010-8888-9999','2023-09-16');
alter table member1 add pt int default 0;

select * from member1;
--테이블 삭제
drop table member1;

---도서(book1)table 만들기--
create table book(bookid int primary key ,bookkind varchar(3) not null,booktitle varchar(100) not null, bookprice int not null,bookcount int not null,author varchar(100),pubcon varchar(40),pubdate date);
--book1 table 확인--
--시퀀스 생성--
create sequence bseq increment by 1 start with 1;
--도서(book1) 데이터 값 넣기--
insert into book values (bseq.nextval,'IT','이것이 자바다'   ,30000,   10,   '신용권',   '한빛미디어','2021-08-20');
insert into book values (bseq.nextval,'IT',   '자바웹개발워크북',31500,19,'구멍가게코딩단','남가람북스','2022-08-04');
insert into book values (bseq.nextval,'NV',   '하얼빈',   14400,15,'김훈','문학동네','2022-08-03');
insert into book values (bseq.nextval,'NV','불편한편의점',   12600,10,'김호연','나무옆의자','2022-08-10');
insert into book values (bseq.nextval,'DV',   '역행자',   15750,8,'자청','웅진출판',   '2022-05-30');
insert into book values (bseq.nextval,'DV',   '자소서바이블',18000,15,'이형','엔알디','2022-08-25');
insert into book values (bseq.nextval,'HC',   '벌거벗은한국사',17500,10,   'tvn','프런트페이지','2022-08-22');
insert into book values (bseq.nextval,'HC',   '난중일기',14000,30,'이순신','스타북스','2022-07-27');
insert into book values (bseq.nextval,'TC',   '진짜쓰는실무엑셀',20000,10,'전진권','제이펍','2022-02-15');
insert into book values (bseq.nextval,'TC',   '빅데이터인공지능',25000,15,'박해선','한빛미디어','2020-12-21');
desc book;
select * from book;
--테이블, 시퀸스 삭제
drop table book1;
drop sequence bseq;




--sale table 확인--
select * from sales;
drop table sales;
--판매(sales)table 만들기--
create table sales(sno int primary key, bno int not null, id varchar(12) not null, amount int default 1 not null, money int, salesday timestamp DEFAULT sysdate);
create sequence sseq increment by 1 start with 1;
insert into sales values(sseq.nextval, 1, 'bgh', 1, null, sysdate);
insert into sales values(sseq.nextval, 2, 'lmk', 1, null, sysdate);
insert into sales values(sseq.nextval, 1, 'lsh', 2, null, sysdate);
insert into sales values(sseq.nextval, 9, 'lyj', 1, null, sysdate);
insert into sales values(sseq.nextval, 2, 'lyl', 5, null, sysdate);
insert into sales values(sseq.nextval, 2, 'ljh', 3, null, sysdate);
insert into sales values(sseq.nextval, 3, 'ljw', 2, null, sysdate);
insert into sales values(sseq.nextval, 5, 'jib', 4, null, sysdate);
insert into sales values(sseq.nextval, 4, 'lmk', 8, null, sysdate);
insert into sales values(sseq.nextval, 1, 'bgh', 3, null, sysdate);
insert into sales values(sseq.nextval, 2, 'lmk', 4, null, sysdate);
insert into sales values(sseq.nextval, 7, 'lyl', 1, null, sysdate);
insert into sales values(sseq.nextval, 8, 'ljw', 2, null, sysdate);
insert into sales values(sseq.nextval, 10, 'jib',5, null, sysdate);
insert into sales values(sseq.nextval, 1, 'lmk', 3, null, sysdate);
insert into sales values(sseq.nextval, 2, 'jib', 2, null, sysdate);
insert into sales values(sseq.nextval, 2, 'lyj', 1, null, sysdate);
insert into sales values(sseq.nextval, 1, 'jib', 3, null, sysdate);

update sales set money=(select bookprice from book1 where bookid=sales.bno)*amount;
--ex) 9번 거래 : 100800, 수량 : 8, 도서가격 : 12600
select bookprice from book1 where bookid=4;

insert into sales values(sseq.nextval, 1, 'kkt', 2, null, sysdate); 

select * from sales;
--테이블, 시퀸스 삭제
drop table sales;
drop sequence sseq;
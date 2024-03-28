use kh;

show tables;

select * from member;

-- Select 문을 활용한 Update Safe Mode => sql_safe_updates
-- SQL 실행시 자동 커밋 => autocommit
-- 아래의 내용을 수정하고, MySQL 서버를 재시작하게 되면 Safe Mode와 AutoCommit이 


-- c:\programData\MySQL\MySQL Server 8.0\my.ini
-- [mysqld]
-- sql_safe_updates=0
-- autocommit=0

-- WorkBench에서 해당 내용을 설정하고 싶다면,
-- SET 명령에 해당 옵션을 설정하면 된다.
-- set sql_safe_update = 0
-- set autocommit = false : 트랜잭션 처리가 필요한 경우 반드시 OFF(false)이어야 함.



-- 엑셀파일 - 종합실습2

-- 1) 회원 테이블에 다음과 같은 내용을 추가하시오.
-- kkt	a1004	김기태	가산동 123 010-1004-1004 2023-09-12
insert into member values('kkt', 'a1004', '김기태', '가산동123', '010-1004-1004', '2023-09-12');
    
    select * from member;
    
-- 2) 도서 테이블에 다음 데이터를 추가하시오.
-- 시퀀스번호	IT	스프링프레임워크	38000	8	김기태	정복사	2022-09-10
insert into book values(default, 'IT', '스프링프레임워크', 38000, 8, '김기태', '정복사', '2022-09-10');
    
    select * from book;
    
-- 3) 판매 테이블에 다음 튜플(레코드)을 추가하시오.
-- 시퀀스번호	1	kkt	2	조회가격*수량	오늘날짜
insert into sales values(default, 1, 'kkt', '2', null, now());	-- current_timstamp = default = now() // curdate():오늘날짜 / curtime():오늘시간
update sales set money=(select bookprice from book where bookid=sales.bno)*amount where sno=19; -- 해당번호만 변경
    
    select * from sales;
    
-- 4) 회원 테이블에 기본값이 0인 숫자 데이터를 저장할 포인트(pt) 컬럼을 추가하시오.
alter table member add pt int default 0;
    
    select * from member;
    
-- 5) 회원 테이블에 방문횟수(visited) 컬럼을 추가하시오.(컬럼타입 및 제약조건 등은 본인이 판단하여 할 것.)
alter table member add visited int default 0;
    
    select * from member;
    
-- 6) 회원 테이블에 이메일(email) 컬럼을 추가하시오(컬럼타입 및 제약조건 등은 본인이 판단하여 할 것.)
alter table member add email varchar(200);
    
    select * from member;
    
--    ※중간에 컬럼추가시 not null 들어올 수 없음(테이블 생성간 null 있음 . 따라서 오류)
    
-- 7) 회원 테이블에 지역코드(areacode) 컬럼을 추가하시오.(컬럼타입 및 제약조건 등은 본인이 판단하여 할 것.)
alter table member add areacode varchar(8);
    
    select * from member;
    
-- 8) 회원 테이블에 있는 컬럼 중에서 방문횟수 컬럼을 제거하시오.
alter table member drop column visited;
    
    select * from member;
    
-- 9) 회원 테이블에 지역(areacode) 컬럼의 이름을 areadata 로 변경하시오.
alter table member rename column areacode to areadata; 
-- 그냥 rename 하면 테이블 이름 변경    
    select * from member;
    
-- 10) 판매(sales) 테이블을 복제하여 판매2(sales2) 테이블을 만드시오.
create table sales2 as (select * from sales); #괄호는 필수가 아니다.
    
    select * from sales2;
    
    select count(*) as cnt from sales2;
    
-- 11) 도서 테이블을 복제하여 도서2(book2) 테이블을 만드시오.
create table book2 as select * from book;
    
    select * from book2;
    
-- 12) 회원 테이블을 복제하여 회원2(member2) 테이블을 만드시오.
create table member2 as select * from member;

-- select * from member2 limit (5, 3) ... 5번째부터 3번째 조회
    select * from member2;
    
-- 13) 판매2(sales2) 테이블을 제거하시오.
-- drop table sales2;
    
    select * from sales2;
    
-- 14) 복제된 회원2(member2) 테이블에서 아이디가 j가 포함된 회원을 삭제하시오.
SET sql_safe_updates = 0;
delete from member2 where id like '%j%';
SET sql_safe_updates = 1;
-- id가 기본키라서 또 보호모드가 되어 있다..
 

-- 15) 회원(member) 테이블에서 모든 회원에 대한 포인트를 100 이 지급될 수 있도록 변경하시오.
update member set pt = pt + 100;
-- 16) 회원(member) 테이블에서 회원의 아이디가 lsh인 회원의 주소를 '도화동 27'로 변경하시오.
SET sql_safe_updates = 0;
update member set address = '도화동27' where id = 'lsh';
SET sql_safe_updates = 1;
-- id가 기본키라서 또 보호모드가 되어 있다..

-- 17) 회원2(member2) 테이블에서 연락처가 02인 회원에 대하여 가입일을 오늘날짜로 변경하시오.
SET sql_safe_updates = 0;
update member2 set reg_date=default where tel like '02%'; -- # like ~~= 없다.~~
SET sql_safe_updates = 1;

-- 18) 도서2(book2) 테이블에서 도서 분류가 HC인 레코드에 대하여 도서 수량을 5로 변경하시오.
update book2 set bookcount=5 where bookkind='HC';

-- 19) 도서2(book2) 테이블에서 도서 분류가 TC인 튜플을 제거하시오.
delete from book2 where bookkind = 'TC';

-- 20) 도서2(book2) 테이블에 도서상태(ckdata) 컬럼을 추가하시오.(컬럼타입 및 제약조건 등은 본인이 판단하여 할 것.)
alter table book2 add ckdata varchar(40); 

-- 21) 도서2(book2) 테이블에 도서 수량이 7이하인 튜플에 대하여 도서상태를 '재입고요망' 으로 내용을 추가하시오. → 수정 하라는 의미.
update book2 set ckdata='재입고요망' where bookcount <=7;
    
   select * from book2 where ckdata is not null;
    
-- 22) 회원2(member2) 테이블에 id를 기본키로 추가하시오.
-- alter table member2 modify id varchar(12) primary key; 
    
--    #mySQL, mariaDB : varchar to 지원X / 기본키를 지울 때 새로만들어야 함.
SET sql_safe_updates = 0;
alter table member2 add constraint mpkey1 primary key(id); 
SET sql_safe_updates = 1;
    
--    #select /  alter table member2 drop constraints Kmember2
    
-- 23) 도서2(book2) 테이블에 도서코드(bookid)를 기본키로, 도서분류(bookkind)를 외래키로 추가하시오.
    
-- bookkind테이블?을 먼저 만들어야 함.(foreign key는 참조하는 임의의 테이블이 필요)
create table bookkind(kindcode varchar(6) primary key, kindname varchar(50)); 
    
--    → bookkind테이블에서 kindcode를 기본키로 만들기
--    이후 값이 같게 만들어 주기 위해서(타입, 값) 값 똑같이 넣기(컬럼명만 달라도 된다.)
    
insert into bookkind values('IT', 'IT관련서적'); -- → 값1 넣기
insert into bookkind values('NV', '소설'); -- → 값2넣기    
insert into bookkind values('DV', '자기계발'); -- → 값3 넣기    
insert into bookkind values('HC', '역사'); -- → 값4 넣기    
insert into bookkind values('TC', '일반상식'); -- → 값5 넣기
--    # 복수일 경우 constraint’s’    
alter table book2 add constraint bfkey foreign key (bookkind) references bookkind(kindcode); -- 외래키 지정
desc book2; -- mul : 외래키


-- 24) 도서2(book2) 테이블에서 출판일(pubdate)가 2022년 8월 인 데이터의 수량을 5씩 더 증가시키시오.
    
-- update book2 set bookcount=bookcount+5 where pubdate='%2022-08%'; 
-- pubdate가 varchar형이면 가능.    
update book2 set bookcount=bookcount+5 where pubdate between '2022-08-01' and '2022-08-31'; 
    
-- 25) 회원(member) 테이블에서 모든 회원의 모든 정보를 조회하시오.
select * from member;
    
-- 26) 판매(sales) 테이블에서 구매한 적이 있는 회원의 아이디를 중복을 제거하여 조회하시오.  # id in{있다} (어디에서) / id not in{없다} (어디에서)
    
select distinct id, name, tel from member where id in (select id from sales);
-- sales테이블에 id가 있다 => 구매한 적이 있다.
-- select * from member where id in (select id from sales);
    
-- 27) 도서(book) 테이블에서 도서종류(bookkind)가 IT인 튜플을 검색하시오.
select * from book where bookkind='IT';
    
-- 28) 회원(member) 테이블에서 아이디가 k가 포함된 회원의 이름(name), 연락처(tel) 컬럼을 검색하시오.
select name, tel from member where id like '%k%';
    
-- 29) 판매(sales) 테이블에서 수량(amount)이 2이상인 레코드를 검색하시오.
select * from sales where amount >= 2;
    
-- 30) 도서(book) 테이블에서 단가(bookprice)가 19000이상 30000이하인 데이터의 도서명(booktitle), 도서가격(bookprice), 저자(author) 를 조회하시오.
select booktitle, bookprice, author from book where bookprice >= 19000 and bookprice <= 30000;
-- select booktitle, bookprice, author from book1 where bookprice >=19000 or bookprice <= 30000;    
-- select booktitle, bookprice, author from book1 where bookprice between 19000 and 30000;

-- 31) 도서(book) 테이블에서 출판사(pubcom)이 한빛미디어 이거나 남가람북스인 튜플의 도서명(booktitle), 저자(author), 수량(bookcount)를 조회하시오.
select booktitle, author, bookcount from book where pubcom='한빛미디어' or pubcom='남가람북스';
-- select booktitle, author, bookcount from book where pubcom in('한빛미디어', '남가람북스'); # in(00 이거나 00)
    
-- 32) 도서(book) 테이블에서 출판일(pubdate)이 2022년인 튜플을 검색하시오.
-- select * from book where pubdate like '%2022%'; 
--    ※Date, String(varchar)형이면 가능하다.   datetime ⇒ timestamp(안됌) - date(됌) - varchar(됌)
-- select * from book where pubdate >= ‘2022-01-01’ and pubdate <= ‘2022-12-31’;
select * from book where pubdate between ‘2022-01-01’ and ‘2022-12-31’;
    
-- 33) 회원(member) 테이블에서 비밀번호(password)가 5글자 이상인 회원의 아이디(id), 이름(name), 주소(tel)을 검색하시오.
select id, name, tel from member where length(password) >= 5;
--    ※length ⇒ 글자의 개수
    
-- 34) 도서(book) 테이블에서 출판일(pubdate)을 기준으로 오름차순하여 검색하되 출판일(pubdate)이 같은 경우 도서코드(bookid)의 내림차순으로 하시오.
select * from book order by pubdate asc, bookid desc;
-- select * from book1 order by pubdate [asc], bookid desc;
-- pubdate 를 기준으로 오름차순으로 가다가 같은게 나오면 bookid를 기준으로 내림차순으로    
--    ※asc ⇒ default값, 작은 것에서 부터 큰 순으로
    
-- 35) 도서(book) 테이블에서 도서의 수량(bookcount)가 10권 미만인 튜플에 대하여 도서분류(bookkind), 도서명(booktitle), 출판사(pubcom) 을 검색하되 그 결과가 저자(author)의 오름차순으로 정렬하여 표시되도록 하시오.
select bookkind, booktitle, pubcom from book where bookcount < 10 order by author ;
-- order by 00 limit 00 으로 사용할 수 있다.  
  
-- 36) 도서(book) 테이블에서 도서분류(bookkind)가 IT, NV, TC가 아닌 레코드의 도서코드(bookid), 도서명(booktitle), 저자(author) 를 검색하되 그 결과가 출판일을 기준으로 내림차순되어 표시되도록 하시오.
select bookid, booktitle, author from book where bookkind not in ('IT','NV','TC') order by pubdate desc;
    
-- 36) 판매(sales) 테이블의 전체 구매 건수를 출력하되 표시되는 컬럼명은 구매건수로 출력될 수 있도록 조회하시오.
select count(*) as "구매건수" from sales;
-- alias(as) : 영문이 아닌경우, 띄어쓰기가 있는 경우 
    
-- 37) 판매(sales) 테이블의 회원별 구매 건수를 출력하되 회원아이디(id)와 구매건수를 표시하되 컬럼명은 구매건수로 하며, 회원아이디(id)의 오름차순 정렬되어 표시되도록 하시오.
select id, count(*) as "구매건수" from sales group by id order by id asc;
-- 회원 구분 : primary key => id
-- ※작은따옴표 : 레코드값으로 간주함.

-- 구매건수가 2건 이상인 사람 : select id, count(*) as cnt from sales group by id having cnt>=2 order by id asc;
    
-- 38) 판매(sales) 테이블의 도서별 판매금액의 합계를 구하여 표시하되, 도서코드(bno), 판매금액합계 로 출력되게 하시오.
select bno, sum(money) as "판매금액합계" from sales group by bno;

-- 도서이름과 판매금액합계가 같이 출력되게 하려면(inner join)
-- select b.bno, a.booktitle, sum(b.money) as "판매금액합계" from book a inner join sales b on a.bookid=b.bno group by b.bno, a.booktitle;

-- 도서이름과 판매금액합계가 같이 출력되게 하려면(연관쿼리)
-- select b.bno, a.booktitle, sum(b.money) as "판매금액합계" from book a, sales b where a.bookid=b.bno group by b.bno, a.booktitle;

-- select * from member, book; // member : 11, book : 10 => product(*) 11 * 10 = 110(카디널리티)
    
-- 39) 판매(sales) 테이블에서 가장 큰 판매금액을 출력하되, 회원아이디(id), 도서코드(bno), 판매금액이 표시되도록 하시오.
select id, bno, max(money) as "판매금액" from sales group by id, bno;
    
--    ※집계함수 : min, max …. ⇒ group by ~
    
-- 40) 회원(member) 테이블에서 가입일별 인원수를 구하여 출력하되, 가입일 오름차순으로 출력되도록 하시오.
select reg_date, count(*) as "인원수" from member group by reg_date order by reg_date asc;
    
-- ★41) 도서(book) 테이블에서 도서수량(bookcount)가 남은 수량이 적은 것을 기준으로 5위권까지 모든 도서 정보가 출력되도록 하시오.
select * from book order by bookcount asc limit 5;

-- select * from(select * from book order by bookcount asc) where rownum <= 5; (Oracle)
    
--    ※select * from book order by bookcount asc limit ~(mySQL, mairaDB);

-- ★42) 판매(sales) 테이블에서 판매금액(money)가 큰 순으로 3위 까지인 튜플의 판매코드(sno), 도서코드(bno), 회원아이디(id)가 출력될 수 있도록 하시오.
select sno, bno, id from sales order by money desc limit 3;

-- 43) 회원 뷰(mem_view)를 생성하되 회원2(member2) 테이블을 활용하고, 회원 데이터 중에서 가입일을 기준으로 2022년 09월 이후에 가입한 회원을 대상으로 하시오.
create view mem_view as (select * from member2 where reg_date >= '2022-09-01');
-- select * from mem_view;
    
-- 44) 판매 뷰(sales_view)를 생성하되 판매(sales) 테이블을 활용하고, 판매코드(sno), 도서코드(bno), 아이디(id), 판매금액(money) 컬럼만 추출되어 생성되게 하시오.
create view sales_view as (select sno, bno, id, money from sales2);
-- select * from sales_view;
    
-- 45) 도서 뷰(book_view)를 생성하되 도서2(book2) 테이블을 활용하고, 도서 데이터 중에서 도서분류(bookkind)가 'IT', 'TC', 'HC' 인 데이터를 대상으로 하며, 컬럼은 도서분류(bookkind), 도서명(booktitle), 도서가격(bookprice), 출판사(pubcom) 만으로 구성되게 하시오.
create view book_view as (select bookkind, booktitle, bookprice, pubcom from book2 where bookkind in ('IT','TC','HC'));
    
-- 46) 도서 뷰(book_view)에서 도서가격(bookprice)가 현재 가격에서 10% 인상이 될 수 있도록 데이터를 갱신하시오.
update book_view set bookprice=bookprice * 1.1;
-- 데이터를 변경
-- select * from book_view;
-- select * from book2; 
-- update를 쓰면 실제 데이터인 book2에서 bookkind컬럼의 IT, HC 레코드에 해당하는 bookprice컬럼 레코드 값이 증가된다. 
    
-- 47) 판매 뷰(sales_view)를 편집하되 기존 select 구문에서 수량(amount) 가 2이상인 조건을 추가되게 하시오.
create or replace view sales_view as select * from sales where amount >= 2;
-- SQL 구문 자체를 변경
--    ※create or replace : 있으면 대체(변경), 없으면 생성 ⇒ 구문을 바꿀때. 데이터변경X
--    select * from sales_view;      ※44번) → 47번) 값으로 변경.
    
-- 48) 회원 뷰(mem_view)에서 아이디(id)가 y로 끝나는 회원의 데이터를 삭제하시오.
delete from mem_view where id like '%y'; 
-- ※ 실제 데이터인 member테이블의 데이터가 지워진다.
    
-- 49) 판매 뷰(sales_view) 를 제거하시오.
drop view sales_view; -- ※뷰만 제거되고 실제 데이터는 건재하다.
    
-- ~~-50) 판매 뷰(sales_view) 를 제거하시오. ??~~


-- 51) 상반기 판매순번 시퀀스(sd_seq)를 만들되 1부터 1씩 증가하도록 생성하시오.
    
-- create sequence sd_seq start with 1 increment by 1; 
-- MySQL, mariaDB 에서는 sequence 개념이 사용되지 않는다.. 정 사용하려면 별로도 추가옵션을 설치 했을 경우에만 사용이 가능하다.
    
-- 52) 상반기 판매순번 시퀀스(sd_seq)를 시작값이 6부터 될수 있도록 수정하시오.
    
--    ⇒※이미 만들어진 시퀀스에서 시작값을 변경할 수 없다.
--  drop sequence sd_seq;
-- create sequence sd_seq start with 6 increment by 1;
-- ※alter sequence sd_seq start with 6 increment by 1; (mySQL, mariaDB)
    
-- 53) 상반기 판매순번 시퀀스(sd_seq)의 현재값이 조회될 수 있도록 하시오.
-- select system.sd_seq.currval from dual;
    
-- 54) 상반기 판매순번 시퀀스(sd_seq)를 제거하시오.
-- drop sequence sd_seq;
    
-- 55) 서브쿼리를 이용하여 구매한 적이 있는 (판매 테이블에 있는) 회원의 이름(name)을 중복성을 제거하여 조회하시오.
select distinct name from member where id in (select distinct id from sales);
-- 회원이름이 member테이블에 있고 판매테이블에 있는 아이디와 member테이블의 아이디를 조회하여 같은것만 출력 
 
-- 56) 서브쿼리를 이용하여 판매되지 않은 (판매 테이블에 있는) 도서의 정보를 조회하시오.
select booktitle from book where bookid not in (select bno from sales);
    
-- 57) 서브쿼리를 활용하여 판매 테이블에서 판매금액의 평균이상인 모든 컬럼을 조회하시오.
select * from sales where money >= (select avg(money) from sales); 
    
--    ※특이케이스 : group by ~ 안써도 된다.
    
-- 58) 내부조인을 활용하여 구매한 회원의 아이디(id),이름(name), 연락처(tel) 을 조회하시오.
select a.id, a.name, b.tel from member a inner join sales b on a.id = b.id;
    
--    ※중복성 제거 : select distinct a.id, a.name, b.tel from member a inner join sales b on a.id = b.id;

-- 58) 내부조인을 활용하여 구매한 도서의 도서코드(booktid), 도서명(booktitle), 총판매수량합계(amount), 총판매금액(money) 을 조회하시오. 단, 출력내용은 도서코드(bookid)의 오름차순으로 정렬하여 표시하시오.
select a.bookid, a.booktitle, sum(b.amount) as "총판매수량합계", sum(b.money) as "총판매금액" from book a inner join sales b on a.bookid = b.bno group by a.bookid, a.booktitle order by a.bookid;

-- 59) 외부조인을 활용하여 판매되지 않은 도서의 도서명(booktitle), 도서가격(bookprice), 저자(author) 을 조회하시오.
-- 서브쿼리
select distinct booktitle, bookprice, author from book where bookid not in(select bno from sales);

-- 교집합(팔린것)
-- select distinct booktitle, a.bookprice, a.author from book a, sales b where a.bookid=b.bno;

-- 차집합(팔리지 않은것, 외부조인)
-- select distinct a.booktitle, a.bookprice, a.author from book a left join sales b on a.bookid=b.bno where b.bno is null;
    
-- 60) 외부조인을 활용하여 구매한 적이 없는 회원의 회원아이디(id), 회원명(name) 을 조회하시오.
select distinct id, name from member where id not in (select distinct id from sales);
-- 외부조인
-- select distinct a.id, a.name from book a left join sales b on a.bookid =b.id where b.id is null;

-- 연관쿼리 + 서브쿼리
-- select distinct a.id, a.name, a.bookid from book a where not EXISTS(select 1 from sales b where a.bookid = b.bno);

-- 연관쿼리
--
    
-- 61) 판매(sales)와 판매2(sales2) 테이블을 합집합하여 종합 판매 뷰(tot_sales_view)를 생성하시오.

create view tot_sales_view as (select * from sales UNION select * from sales2);

delete from sales2 where sno=12 or sno=17;

delete from sales where sno=10 or sno=15;

create view tot_sales_view as (select sno, bno, id, amount, money from sales UNION select sno, bno, id, amount, money from sales2);

select * from tot_sales_view order by sno;

-- 62) 회원(member)와 회원2(member2) 테이블을 교집합하여 중복회원 뷰(cross_mem_view)를 생성하시오.
-- create view cross_mem_view as (select * from member INTERSECT select * from member2);
-- ※멤버 타입, 컬럼 이름 등 이 같아야 한다.
    
-- select * from cross_mem_view; → 중복되는 값 없음.(컬럼이 다르다.)
    
-- drop view cross_mem_view;
    
-- create view cross_mem_view as (select id, name, addr from member1 INTERSECT select * from member2);
    
-- select * from member;
    
-- select * from member2;
    
-- 63) 회원(member)와 회원2(member2) 테이블을 교집합하여 중복회원 뷰(cross_mem_view)를 생성하시오.
-- MySQL은 연관쿼리를 활용하여 교집합 생성
create view cross_mem_view as (select a.id, a.password, a.name, a.address from member a, member b where a.id = b.id);
-- 괄호는 필수가 아니다.
-- create view minus_book_view as (select bookid, bookkind, booktitle, bookprice from book1 MINUS select bookid, bookkind, booktitle, bookprice from book2 );
    
-- 64) 도서(book)와 도서2(book2) 테이블을 차집합하여 도서(book)에만 있는 도서 뷰(minus_book_view)를 생성하시오.
-- 서브쿼리를 이용한 차집합 뷰 작성
create view minus_book_view as 
select bookid, bookkind, booktitle, bookcount from book
where bookid not in(
	select distinct bookid from book2);
    
-- 외부조인을 이용한 차집합 뷰 작성
create view minus_book_view2 as 
select a.bookid, a.bookkind, a.booktitle, a.bookcount
from book a left join book2 b on a.bookid = b.bookid
where b.bookid is null;
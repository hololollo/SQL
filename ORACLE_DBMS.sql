--1) 회원 테이블에 다음과 같은 내용을 추가하시오.									
kkt	a1004	김기태	가산동 123	 010-1004-1004	 2023-09-12				
insert into member1 values('kkt', 'a1004', '김기태', '가산동123', '010-1004-1004', '2023-09-12');									
									
--2) 도서 테이블에 다음 데이터를 추가하시오.									
시퀀스번호	IT	스프링프레임워크	38000	8	김기태	정복사	2022-09-10		
insert into book values(bseq.nextval, 'IT', '스프링프레임워크', 38000, 8, '김기태', '정복사', '2022-09-10');									
									
--3) 판매 테이블에 다음 튜플(레코드)을 추가하시오.									
시퀀스번호	1	kkt	2	조회가격*수량	오늘날짜				
insert into sales values(bseq.nextval, 1, 'kkt', '2', null, sysdate);	
update sales set money=(select bookprice from book1  where bookid=sales.bno)*amount;
									
--4) 회원 테이블에 기본값이 0인 숫자 데이터를 저장할 포인트(pt) 컬럼을 추가하시오.									
alter table member1 add pt int default 0;									
									
--5) 회원 테이블에 방문횟수(visited) 컬럼을 추가하시오.(컬럼타입 및 제약조건 등은 본인이 판단하여 할 것.)									
alter table member1 add visited int default 0;									
									
--6) 회원 테이블에 이메일(email) 컬럼을 추가하시오(컬럼타입 및 제약조건 등은 본인이 판단하여 할 것.)									
alter talble member1 add email varchar(200) not null; 									
									
--7) 회원 테이블에 지역코드(areacode) 컬럼을 추가하시오.(컬럼타입 및 제약조건 등은 본인이 판단하여 할 것.)									
alter table member1 add areacode varchar(50);									
									
--8) 회원 테이블에 있는 컬럼 중에서 방문횟수 컬럼을 제거하시오.									
alter table member1 drop coulmn visited;									
									
--9) 회원 테이블에 지역(areacode) 컬럼의 이름을 areadata 로 변경하시오.									
alter table member1 rename column areacode to areadata;									
									
--10) 판매(sales) 테이블을 복제하여 판매2(sales2) 테이블을 만드시오.									
create table sales2 as select * from sales;									
									
--11) 도서 테이블을 복제하여 도서2(book2) 테이블을 만드시오.									
create table book2 as select * from book1;									
									
--12) 회원 테이블을 복제하여 회원2(member2) 테이블을 만드시오.									
create table member2 as select * from member1;									
									
--13) 판매2(sales2) 테이블을 제거하시오.									
drop table sales2;									
									
--14) 복제된 회원2(member2) 테이블에서 아이디가 j가 포함된 회원을 삭제하시오.									
delete from member2 where id like '%j%';									
									
--15) 회원(member) 테이블에서 모든 회원에 대한 포인트를 100 이 지급될 수 있도록 변경하시오.									
update member1 set pt=pt+100;									
									
--16) 회원(member) 테이블에서 회원의 아이디가 lsh인 회원의 주소를 '도화동 27'로 변경하시오.									
update member1 set addr='도화동27' where id='lsh';									
									
--17) 회원2(member2) 테이블에서 연락처가 02인 회원에 대하여 가입일을 오늘날짜로 변경하시오.									
update member2 set regday	=sysdate where tel like '02%';								
									
--18) 도서2(book2) 테이블에서 도서 분류가 HC인 레코드에 대하여 도서 수량을 5로 변경하시오.									
update book2 set bookcount=5 where bookkind='HC';								
									
--19) 도서2(book2) 테이블에서 도서 분류가 TC인 튜플을 제거하시오.									
delete from book2 where bookkind = 'TC';									
									
--20) 도서2(book2) 테이블에 도서상태(ckdata) 컬럼을 추가하시오.(컬럼타입 및 제약조건 등은 본인이 판단하여 할 것.)									
alter table book2 add ckdata varchar(200); 									
									
--21) 도서2(book2) 테이블에 도서 수량이 7이하인 튜플에 대하여 도서상태를 '재입고요망' 으로 내용을 추가하시오.									
update book2 set ckdata='재입고요망' where bookcount <=7;									
									
--22) 회원2(member2) 테이블에 id를 기본키로 추가하시오.									
alter table member2 add constraint Kmember2 primary key(id);									
									
--23) 도서2(boo2) 테이블에 도서코드(bookid)를 기본키로 도서분류(bookkind)를 외래키로 추가하시오.									
alter table book2 add constraints pkey primary key bookid and fkey foreign key bookkind references book1(bookid and bookkind); 									
									
--24) 도서2(book2) 테이블에서 출판일(pubdate)가 2022년 8월 인 데이터의 수량을 5씩 더 증가시키시오.									
									
									
--25) 회원(member) 테이블에서 모든 회원의 모든 정보를 조회하시오.									
									
									
--26) 판매(sales) 테이블에서 구매한 적이 있는 회원의 아이디를 중복을 제거하여 조회하시오.									
									
									
--27) 도서(book) 테이블에서 도서종류(bookkind)가 IT인 튜플을 검색하시오.									
									
									
--28) 회원(member) 테이블에서 아이디가 k가 포함된 회원의 이름(name),  연락처(tel) 컬럼을 검색하시오.									
									
									
--29) 판매(sales) 테이블에서 수량(amount)이 2이상인 레코드를 검색하시오.									
									
									
--30) 도서(book) 테이블에서 단가(bookprice)가 19000이상 30000이하인 데이터의 도서명(booktitle), 도서가격(bookprice), 저자(author) 를 조회하시오.									
									
									
--31) 도서(book) 테이블에서 출판사(pubcom)이 한빛미디어 이거나 남가람북스인 튜플의 도서명(booktitle), 저자(author), 수량(bookcount)를 조회하시오.									
									
									
--32) 도서(book) 테이블에서 출판일(pubdate)이 2022년인 튜플을 검색하시오.									
									
									
--33) 회원(member) 테이블에서 비밀번호(password)가 5글자 이상인 회원의 아이디(id), 이름(name), 주소(tel)을 검색하시오.									
									
									
--34) 도서(book) 테이블에서 출판일(pubdate)을 기준으로 오름차순하여 검색하되 출판일(pubdate)이 같은 경우 도서코드(bookid)의 내림차순으로 하시오.									
									
									
--35) 도서(book) 테이블에서 도서의 수량(bookcount)가 10권 미만인 튜플에 대하여 도서분류(bookkind), 도서명(booktitle), 출판사(pubcom) 을 검색하되 그 결과가 저자(author)의 오름차순으로 정렬하여 표시되도록 하시오.									
									
									
--36) 도서(book) 테이블에서 도서분류(bookkind)가 IT, NV, TC가 아닌 레코드의 도서코드(bookid), 도서명(booktitle), 저자(author) 를 검색하되 그 결과가 출판일을 기준으로 내림차순되어 표시되도록 하시오.									
									
									
--36) 판매(sales) 테이블의 전체 구매 건수를 출력하되 표시되는 컬럼명은 구매건수로 출력될 수 있도록 조회하시오.									
									
									
--37) 판매(sales) 테이블의 회원별 구매 건수를 출력하되 회원아이디(id)와 구매건수를 표시하되 컬럼명은 구매건수로 하며, 회원아이디(id)의 오름차순 정렬되어 표시되도록 하시오.									
									
									
--38) 판매(sales) 테이블의 도서별 판매금액의 합계를 구하여 표시하되, 도서코드(bno), 판매금액합계 로 출력되게 하시오.									
									
									
--39) 판매(sales) 테이블에서 가장 큰 판매금액을 출력하되, 회원아이디(id), 도서코드(bno), 판매금액이 표시되도록 하시오.									
									
									
--40) 회원(member) 테이블에서 가입일별 인원수를 구하여 출력하되, 가입일 오름차순으로 출력되도록 하시오.									
									
									
--41) 도서(book) 테이블에서 도서수량(bookcount)가 남은 수량이 적은 것을 기준으로 5위권까지 모든 도서 정보가 출력되도록 하시오.									
									
									
--42) 판매(sales) 테이블에서 판매금액(money)가 큰 순으로 3위 까지인 튜플의 판매코드(sno), 도서코드(bno), 회원아이디(id)가 출력될 수 있도록 하시오.									
									
									
--43) 회원 뷰(mem_view)를 생성하되 회원2(member2) 테이블을 활용하고, 회원 데이터 중에서 가입일을 기준으로 2022년 09월 이후에 가입한 회원을 대상으로 하시오.									
									
									
--44) 판매 뷰(sales_view)를 생성하되 판매(sales) 테이블을 활용하고, 판매코드(sno), 도서코드(bno), 아이디(id), 판매금액(money) 컬럼만 추출되어 생성되게 하시오.									
									
									
--45) 도서 뷰(book_view)를 생성하되 도서2(book2) 테이블을 활용하고, 도서 데이터 중에서 도서분류(bookkind)가 'IT', 'TC', 'HC' 인 데이터를 대상으로 하며, 컬럼은 도서분류(bookkind), 도서명(booktitle), 도서가격(bookprice), 출판사(pubcom) 만으로 구성되게 하시오.									
									
									
--46) 도서 뷰(book_view)에서 도서가격(bookprice)가 현재 가격에서 10% 인상이 될 수 있도록 데이터를 갱신하시오.									
									
									
--47) 판매 뷰(sales_view)를 편집하되 기존 select 구문에서 수량(amount) 가 2이상인 조건을 추가되게 하시오.									
									
									
--48) 회원 뷰(mem_view)에서 아이디(id)가 y로 끝나는 회원의 데이터를 삭제하시오.									
									
									
--49) 판매 뷰(sales_view) 를 제거하시오.									
									
									
--50) 판매 뷰(sales_view) 를 제거하시오.									
									
									
--51) 상반기 판매순번 시퀀스(sd_seq)를 만들되 1부터 1씩 증가하도록 생성하시오.									
									
									
--52) 상반기 판매순번 시퀀스(sd_seq)를 시작값이 6부터 될수 있도록 수정하시오.									
									
									
--53) 상반기 판매순번 시퀀스(sd_seq)의 현재값이 조회될 수 있도록 하시오.									
									
									
--54) 상반기 판매순번 시퀀스(sd_seq)를 제거하시오.									
									
									
--55) 서브쿼리를 이용하여 구매한 적이 있는 (판매 테이블에 있는) 회원의 이름(name)을 중복성을 제거하여 조회하시오.									
									
									
--56) 서브쿼리를 이용하여 판매되지 않은 (판매 테이블에 있는) 도서의 정보를 조회하시오.									
									
									
--57) 서브쿼리를 활용하여 판매 테이블에서 판매금액의 평균이상인 모든 컬럼을 조회하시오.									
									
									
--58) 내부조인을 활용하여 판매된 적이 있는 도서이름(booktitle), 도서가격(bookprice), 판매수량(amount), 판매금액(money) 을 조회하시오.									
									
									
--58) 내부조인을 활용하여 구매한 적이 있는 회원아이디(id), 회원명(name), 판매수량(amount), 판매금액(money) 을 조회하시오.									
									
									
--59) 외부조인을 활용하여 판매되지 않은 도서의 도서명(booktitle), 도서가격(bookprice), 저자(author) 을 조회하시오.									
									
									
--60) 외부조인을 활용하여 구매한 적이 없는 회원의 회원아이디(id), 회원명(name) 을 조회하시오.									
									
									
--61) 판매(sales)와 판매2(sales2) 테이블을 합집합하여 종합 판매 뷰(tot_sales_view)를 생성하시오. 									
									
									
--62) 회원(member)와 회원2(member2) 테이블을 교집합하여 중복회원 뷰(cross_mem_view)를 생성하시오. 									
									
									
--63) 도서(book)와 도서2(book2) 테이블을 차집합하여 도서(book)에만 있는 도서 뷰(minus_book_view)를 생성하시오. 									

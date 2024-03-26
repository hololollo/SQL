select * from member;

insert into member values (mem_seq.nextval, 'kang', '1234', '강범준', '1992-10-21', 'kangmh1021@gmail.com');
insert into member values (mem_seq.nextval, 'park', '4321', '박동수', '1998-03-25', 'park@gmail.com');
insert into member values (mem_seq.nextval, 'lee', '3421', '이연정', '1999-05-23', 'lee@gmail.com');
insert into member values (mem_seq.nextval, 'kim', '1111', '김김김', '2000-04-26', 'kim@gmail.com');
insert into member values (mem_seq.nextval, 'gang', '9999', '갱갱갱', '2020-01-28', 'gang@gmail.com');
insert into member values (mem_seq.nextval, 'bang', '7777', '빵야', '2000-01-21', 'bang@gmail.com');

select id, name, birth from member where birth>='1999-01-01' and birth<='2019-01-01';
select id, name, birth from member where birth between '1999-01-01' and '2019-01-01';

select id, name birth from member
where id like 'e%'

--데이터 검색
select * from member;

--생일이 1995~2020년생인 회원의 id, name, birth 컬럼 검색
select id, name, birth from member;
select id, name, birth from member where birth between '1995-01-01' and '2020-12-31'

--id에 i나 e가 포함된 회원의 id, name 컬럼을 검색
select id, name from member where id like '%i%' or id like '%e%';

select * from member where id='kim' or id='lee' or id='kang';
select * from member where id in ('kim','lee','kang');
select * from member where id not in ('kim','lee','kang');

-- 컬럼명이 길거나 수식이나 함수를 적용하여 컬럼을 구성할 경우 컬럼에 대한 alias(별칭)를 붙일 수 있다.
-- 회원 테이블로부터 id와 name, 이름 중에서 성씨를 검색
select id, name, substr(name, 1, 1) as surname from member;
-- java에서 rs.getString(""); 처럼 alias로 호출해야 함.

select * from member;
--id가 'lee'인 회원의 이메일(email)을 'lee@naver.com' 변경
update member set email ='lee@naver.com' where id='lee';



--id가 'kim'인 회원을 강제탈퇴하도록 한다.
delete from member where id='kim';
select * from member;
--no는 채워지지 않는다.

alter table member add regdate timestamp default sysdate;    

--기본키와 기본값은 출력되지 않는다.
alter table member add point int default 0;

--컬럼 명 변경
alter table member rename column regdate to reg;

desc member;

select * from member;
--컬럼 데이터 타입 변경
alter table member modify pw varchar(200);
--컬럼 제거
alter table member drop column point;

commit;
--테이블명 변경
alter table member rename to temp1;

desc temp1;

create table temp2(no int, name varchar(200), point int);

insert into temp2 values (1, '김', 90);
insert into temp2 values (2, '박', 80);
insert into temp2 values (3, '최', 85);

--제약조건과 기본키가 없으므로 추가 가능
insert into temp2(name, point) values ('이', 75);

--null값이 있으므로 기본키값 조건 충족 불가능.
alter table temp2 add constraints key1 primary key (no);

delete from temp2 where no is null;

alter table temp2 add constraints key1 primary key (no);

--이렇게도 가능
create table emp(no int, name varchar(100), pcode int, constraints key2 primary key(no)); 

insert into emp values (1, '김', 1);
insert into emp values (2, '이', 2);
insert into emp values (3, '이', 3);
insert into emp values (4, '이', 4);
insert into emp values (5, '이', 5);

update emp set name='박' where no=3;
update emp set name='최' where no=4;
update emp set name='조' where no=5;

create table pos(pcode int primary key, pname varchar(100));

insert into pos values(1, '이사');
insert into pos values(2, '부장');
insert into pos values(3, '과장');
insert into pos values(4, '사원');

insert into pos values(5, '인턴');

select * from emp;
select * from pos;

alter table emp add constraints fkey foreign key (pcode) references pos(pcode);
desc temp2;

select * from ALL_CONSTRAINTS where OWNER='C##TEST123'; 
select * from ALL_CONSTRAINTS where TABLE_NAME='EMP'; 

alter table emp drop constraint key2;

drop table pos cascade constraints ;

desc emp;

commit;
--뷰 생성
create view view_emp as select * from emp;

--실제 테이블 생성이 아닌 그렇게 보이는 거처럼(가상)
select * from emp;
select * from view_emp;

create view view_emp2 as select * from emp where no >=3;
select * from emp where no>=3;
select * from view_emp2;
--view 삭제
drop view view_emp;
--view는 일반적으로 수정하지 않는다.
--alter view view_emp2 as select * from emp where no >=2 or name like 

--시퀀스 생성
create sequence emp_seq increment by 1 start with 6 minvalue 1 maxvalue 9999 nocycle;

--alter sequence emp_seq 수정할 내용
alter sequence emp_seq increment by 1;


--emp_seq 시퀀스 정보 조회
select * from all_sequences where sequence_name = 'EMP_SEQ';

select * from emp;

-- emp 테이블의 no값을 다음 순번(nextval)으로 적용하여 레코드 추가
insert into emp values (emp_seq.nextval, '고', 3);

-- 현재 시퀀스값 조회
select emp_seq.currval from dual;

--테이블 복제
create table emp2 as select * from emp;
--제약조건은 복제되지 않는다.
desc emp2;
select * from emp2;
--no컬럼을 기본키로 설정
alter table emp2 modify no int primary key;

select a.no, a.name, b.pcode, b.pname from emp a inner join pos b on  a.pcode=b.pcode

--시퀀스 삭제
drop sequence emp_seq;
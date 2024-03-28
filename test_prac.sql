use kh;

create table TB_MEMBER(MEMBER_ID varchar(100), MEMBER_PWD varchar(100), MEMBER_NAME varchar(100), GRADE int, AREA_CODE varchar(50));

insert into TB_MEMBER values('hong01', 'pass01', '홍길동', 10, '02');
insert into TB_MEMBER values('leess99', 'pass02', '이순신', 10, '032');
insert into TB_MEMBER values('ss50000', 'pass03', '신사임당', 30, '031');
insert into TB_MEMBER values('iu93', 'pass04', '아이유', 30, '02');
insert into TB_MEMBER values('pcs1234', 'pass05', '박철수', 20, '031');
insert into TB_MEMBER values('you_js', 'pass06', '유재석', 10, '02');
insert into TB_MEMBER values('kyh9876', 'pass07', '김영희', 20, '031');

select * from TB_MEMBER;

create table TB_GRADE(GRADE_CODE int, GRADE_NAME varchar(100));
insert into TB_GRADE values(10, '일반회원');
insert into TB_GRADE values(20, '우수회원');
insert into TB_GRADE values(30, '특별회원');

select * from TB_GRADE;

create table TB_AREA(AREA_CODE varchar(50), AREA_NAME varchar(50));
insert into TB_AREA values('02', '서울');
insert into TB_AREA values('031', '경기');
insert into TB_AREA values('032', '인천');

select * from TB_AREA;


-- 문제 1-1 김영희 회원과 같은 지역에 사는 회원들의 지역명, 아이디, 이름, 등급명을 이름 오름차순으로 조회
select a.AREA_NAME as '지역명', b.MEMBER_ID as '아이디', b.MEMBER_NAME as '이름', c.GRADE_NAME as '등급명' from TB_MEMBER b
join TB_GRADE c on(b.GRADE = c.GRADE_CODE) 
join TB_AREA a on(b.AREA_CODE = a.AREA_CODE)
where b.AREA_CODE = (select AREA_CODE from TB_MEMBER where MEMBER_NAME = '김영희') order by b.MEMBER_NAME asc;


select AREA_NAME 지역명, MEMBER_ID 아이디, MEMBER_NAME 이름, GRADE_NAME 등급명 from TB_MEMBER 
join TB_GRADE on(TB_MEMBER.GRADE = TB_GRADE.GRADE_CODE) 
join TB_AREA using(AREA_CODE)
where b.AREA_CODE = (select AREA_CODE from TB_MEMBER where 이름 = '김영희' order by 이름 asc) ;
-- ���̺� ����
create table member(no int not null, id varchar(20) primary key, pw varchar(300), 
		name varchar(100), birth timestamp, email varchar(300));
-- ������ ����        
create sequence c##test123.mem_seq increment by 1 start with 1 minvalue 1 maxvalue 9999 nocycle;

-- ������ �߰�
insert into member values (mem_seq.nextval, 'kim', '1234', '�����', '1981-12-25', 'kkt@gmail.com');
insert into member values (mem_seq.nextval, 'park', '1004', '�ڵ���', '1998-03-25', 'park@naver.com');
insert into member values (mem_seq.nextval, 'lee', '1212', '�̿���', '1979-08-15', 'lee@daum.net');
insert into member values (mem_seq.nextval, 'cho', '2848', '�����', '1989-04-05', 'cho@gmail.com');
insert into member values (mem_seq.nextval, 'yu', '7979', '����ȯ', '1995-10-15', 'yu@naver.com');
insert into member values (mem_seq.nextval, 'bae', '0909', '�����', '1999-03-26', 'bae@gmail.com');

-- ������ �˻�
select * from member;
select id,name,birth from member;

-- ����(birth)�� 1980���~1985����� ȸ���� id, name �÷� �˻�
select id,name from member 
where birth between '1980-01-01' and '1985-12-31';

-- id�� i�� e�� ���Ե� ȸ���� id,name �÷��� �˻�
select id,name from member 
where id like '%i%' or id like '%e%';
-- id like 'i%' : i�� �����ϴ�
-- id like '%i' : i�� ������

-- id�� 'kim','lee','cho','park' �� ȸ��(member) ������ �˻�
select * from member 
where id='kim' or id='lee' or id='cho' or id='park';

-- id�� 'kim','lee','cho' �� ȸ��(member) ������ �˻�
select * from member 
where id in ('kim','lee','cho');

-- id�� 'kim','lee','cho' �ƴ� ȸ��(member) ������ �˻�
select * from member 
where id not in ('kim','lee','cho');

-- �÷����� �ʹ� ��ų� �����̳� �Լ��� �����Ͽ� �÷��� ������ ��� 
-- �÷��� ���� alias(��Ī)�� ���� �� �ִ�.
-- ȸ��(member) ���̺�� ���� id, name, �̸� �߿��� ������ �˻�
select id,name,substr(name,1,1) as surname from member;
-- java���� rs.getString("surname"); ó�� alias�� ȣ���ؾ���

select * from member;

-- id�� 'lee'�� ȸ���� �̸���(email)�� 'lee@naver.com'�� ����
update member set email='lee@naver.com' where id='lee';

-- id�� 'kim'�� ȸ���� ����Ż���ϵ��� �Ѵ�.
delete from member where id='kim';

alter table member add regdate timestamp default sysdate;

alter table member add point int default 0;

alter table member rename column regdate to reg;

desc member;

select * from member;

alter table member modify pw varchar(200);

alter table member drop column point;

commit;

alter table member rename to temp1;

desc temp1;

create table temp2(no int, name varchar(200), point int);

insert into temp2 values (1, '��', 90);
insert into temp2 values (2, '��', 80);
insert into temp2 values (3, '��', 85);
insert into temp2(name, point) values ('��', 75);

select * from temp2;

delete from temp2 where no is null;

alter table temp2 add constraints key1 primary key (no);

create table emp(no int, name varchar(100), pcode int,
constraints key2 primary key (no));

insert into emp values (1, '��', 1);
insert into emp values (2, '��', 2);
insert into emp values (3, '��', 3);
insert into emp values (4, '��', 4);
insert into emp values (5, '��', 5);

update emp set name='��' where no=3;
update emp set name='��' where no=4;
update emp set name='��' where no=5;

create table pos(pcode int primary key, pname varchar(100));

insert into pos values (1, '�̻�');
insert into pos values (2, '����');
insert into pos values (3, '����');
insert into pos values (4, '���');

insert into pos values (5, '����');

select * from emp;
select * from pos;

alter table emp add constraints fkey 
foreign key (pcode) references pos(pcode);

select * from ALL_CONSTRAINTS where OWNER='C##TEST123';
select * from ALL_CONSTRAINTS where TABLE_NAME='EMP';

alter table emp drop constraint key2;

drop table pos cascade constraints;

desc emp;

commit;

-- ���� ����
create view view_emp as select * from emp;

select * from emp;
select * from view_emp;

-- �� ����2
create view view_emp2 as select * from emp where no>=3;
select * from emp where no>=3;
select * from view_emp2;

-- �� ����
drop view view_emp;
-- �� ���� : create or replace view view_emp2 as select * from emp where no>=2 or name like '%��%';

-- ������(�ڵ�����) ����/����/����/����/��ȸ
-- ������ ����
create sequence emp_seq increment by 1
start with 6 minvalue 1 maxvalue 9999 nocycle;

select * from emp;

-- ������ ����
-- alter sequence emp_seq �����ҳ���
alter sequence emp_seq increment by 1;

-- ������ ����
drop sequence emp_seq;

-- emp_seq �� ������ ���� ��ȸ
select * from all_sequences where sequence_name = 'EMP_SEQ';

select * from emp;

-- emp ���̺� no�� ���� ���� ����(nextval)���� �����Ͽ� ���ڵ� �߰�
insert into emp values (emp_seq.nextval, '��', 3); 

-- ���� �������� ��ȸ
select emp_seq.currval from dual;

-- ���̺� ����(��, ���������� ������ ���� ����)
create table emp2 as select * from emp;

desc emp2;

select * from emp2;

-- no �÷��� �⺻Ű�� ����
alter table emp2 modify no int primary key;

-- ��������(inner join)
select a.no, a.name, b.pname 
from emp a inner join pos b on a.pcode=b.pcode; 

-- �ܺ�����1(left outer join)
select a.no, a.name, b.pname 
from emp a left outer join pos b on a.pcode=b.pcode; 

-- �ܺ�����2(right outer join)
select a.no, a.name, b.pname 
from emp a right outer join pos b on a.pcode=b.pcode; 

-- ��������
select a.no, a.name, b.pname
from emp a, pos b where a.pcode=b.pcode;

select emp.no, emp.name, pos.pname
from emp, pos where emp.pcode=pos.pcode;

select * from emp2;
delete from emp2 where no=3 or no=5;
insert into emp2 values(7, '��', 4);
insert into emp2 values(8, '��', 5);


-- �������� = ��������
-- ��������(emp2 ���̺� �����ϴ� no�� emp ���̺� ��ȸ) => ��ġ����(������)
select no, name from emp
where no in (select no from emp2);

-- ��������(emp2 ���̺� �������� �ʴ� no�� emp ���̺� ��ȸ) => ����ġ����(������)
select no, name from emp
where name not in (select name from emp2);

select * from emp;
select * from emp2;

select * from emp, pos; -- �� ���̺� ���� product - emp:6, pos:5 => 6*5=30

update emp set pcode=4 where no=4 or no=6 or no=2;

select pcode, count(emp.no) as cnt 
from emp group by pcode;

-- �׷�ȭ�ϴ� �׸�� ��µǴ� �׷� �׸��� �޶�(����)
select pos.pname, count(emp.no) as cnt
from pos, emp where pos.pcode = emp.pcode
group by pos.pcode;


-- ������ �ο��� join�� -> �׷�ȭ�ϴ� �׸� : ������(pname)
select pos.pname, count(emp.no) as cnt
from pos inner join emp on pos.pcode = emp.pcode
group by pos.pname;

-- ������ �ο��� �������� -> �׷�ȭ�ϴ� �׸� : ������(pname)
select pos.pname, count(emp.no) as cnt
from pos, emp where pos.pcode = emp.pcode
group by pos.pname 
order by pos.pname; 

-- �����Լ� : count, sum, avg, max, min

-- �����Ͽ� ��� : order by �÷���;
-- �ݵ�� order by ������ �� ������ �����ؾ��ϸ�, ��µǴ� �׸��̾�� ��
select * from emp order by name desc;   -- desc:��������, ���� �Ǵ� asc:��������

-- ���տ���ÿ��� �����ϴ� �� ���� ���̺��� ������ ���ų�
-- �����ϴ� �÷�Ÿ���� ���ƾ� ��.
-- ���տ��� UNION(������), INTERSECT(������), MINUS(������) 
create view uni_view as 
(select no, pcode from emp union select no, pcode from emp2);
select * from uni_view;
create view int_view as 
(select * from emp intersect select * from emp2);
select * from int_view;

create view min_view1 as 
(select * from emp minus select * from emp2);
create view min_view2 as 
(select * from emp2 minus select * from emp);
select * from min_view1;
select * from min_view2;
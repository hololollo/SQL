select * from member;

insert into member values (mem_seq.nextval, 'kang', '1234', '������', '1992-10-21', 'kangmh1021@gmail.com');
insert into member values (mem_seq.nextval, 'park', '4321', '�ڵ���', '1998-03-25', 'park@gmail.com');
insert into member values (mem_seq.nextval, 'lee', '3421', '�̿���', '1999-05-23', 'lee@gmail.com');
insert into member values (mem_seq.nextval, 'kim', '1111', '����', '2000-04-26', 'kim@gmail.com');
insert into member values (mem_seq.nextval, 'gang', '9999', '������', '2020-01-28', 'gang@gmail.com');
insert into member values (mem_seq.nextval, 'bang', '7777', '����', '2000-01-21', 'bang@gmail.com');

select id, name, birth from member where birth>='1999-01-01' and birth<='2019-01-01';
select id, name, birth from member where birth between '1999-01-01' and '2019-01-01';

select id, name birth from member
where id like 'e%'

--������ �˻�
select * from member;

--������ 1995~2020����� ȸ���� id, name, birth �÷� �˻�
select id, name, birth from member;
select id, name, birth from member where birth between '1995-01-01' and '2020-12-31'

--id�� i�� e�� ���Ե� ȸ���� id, name �÷��� �˻�
select id, name from member where id like '%i%' or id like '%e%';

select * from member where id='kim' or id='lee' or id='kang';
select * from member where id in ('kim','lee','kang');
select * from member where id not in ('kim','lee','kang');

-- �÷����� ��ų� �����̳� �Լ��� �����Ͽ� �÷��� ������ ��� �÷��� ���� alias(��Ī)�� ���� �� �ִ�.
-- ȸ�� ���̺�κ��� id�� name, �̸� �߿��� ������ �˻�
select id, name, substr(name, 1, 1) as surname from member;
-- java���� rs.getString(""); ó�� alias�� ȣ���ؾ� ��.

select * from member;
--id�� 'lee'�� ȸ���� �̸���(email)�� 'lee@naver.com' ����
update member set email ='lee@naver.com' where id='lee';



--id�� 'kim'�� ȸ���� ����Ż���ϵ��� �Ѵ�.
delete from member where id='kim';
select * from member;
--no�� ä������ �ʴ´�.

alter table member add regdate timestamp default sysdate;    

--�⺻Ű�� �⺻���� ��µ��� �ʴ´�.
alter table member add point int default 0;

--�÷� �� ����
alter table member rename column regdate to reg;

desc member;

select * from member;
--�÷� ������ Ÿ�� ����
alter table member modify pw varchar(200);
--�÷� ����
alter table member drop column point;

commit;
--���̺�� ����
alter table member rename to temp1;

desc temp1;

create table temp2(no int, name varchar(200), point int);

insert into temp2 values (1, '��', 90);
insert into temp2 values (2, '��', 80);
insert into temp2 values (3, '��', 85);

--�������ǰ� �⺻Ű�� �����Ƿ� �߰� ����
insert into temp2(name, point) values ('��', 75);

--null���� �����Ƿ� �⺻Ű�� ���� ���� �Ұ���.
alter table temp2 add constraints key1 primary key (no);

delete from temp2 where no is null;

alter table temp2 add constraints key1 primary key (no);

--�̷��Ե� ����
create table emp(no int, name varchar(100), pcode int, constraints key2 primary key(no)); 

insert into emp values (1, '��', 1);
insert into emp values (2, '��', 2);
insert into emp values (3, '��', 3);
insert into emp values (4, '��', 4);
insert into emp values (5, '��', 5);

update emp set name='��' where no=3;
update emp set name='��' where no=4;
update emp set name='��' where no=5;

create table pos(pcode int primary key, pname varchar(100));

insert into pos values(1, '�̻�');
insert into pos values(2, '����');
insert into pos values(3, '����');
insert into pos values(4, '���');

insert into pos values(5, '����');

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
--�� ����
create view view_emp as select * from emp;

--���� ���̺� ������ �ƴ� �׷��� ���̴� ��ó��(����)
select * from emp;
select * from view_emp;

create view view_emp2 as select * from emp where no >=3;
select * from emp where no>=3;
select * from view_emp2;
--view ����
drop view view_emp;
--view�� �Ϲ������� �������� �ʴ´�.
--alter view view_emp2 as select * from emp where no >=2 or name like 

--������ ����
create sequence emp_seq increment by 1 start with 6 minvalue 1 maxvalue 9999 nocycle;

--alter sequence emp_seq ������ ����
alter sequence emp_seq increment by 1;


--emp_seq ������ ���� ��ȸ
select * from all_sequences where sequence_name = 'EMP_SEQ';

select * from emp;

-- emp ���̺��� no���� ���� ����(nextval)���� �����Ͽ� ���ڵ� �߰�
insert into emp values (emp_seq.nextval, '��', 3);

-- ���� �������� ��ȸ
select emp_seq.currval from dual;

--���̺� ����
create table emp2 as select * from emp;
--���������� �������� �ʴ´�.
desc emp2;
select * from emp2;
--no�÷��� �⺻Ű�� ����
alter table emp2 modify no int primary key;

select a.no, a.name, b.pcode, b.pname from emp a inner join pos b on  a.pcode=b.pcode

--������ ����
drop sequence emp_seq;
08 ���̺� ����, ����, ����
/*DDL : data definition language)�� ���̺� */

create table dept (
    dno  number(2),
    dname varchar2(14),
    loc varchar2(13) 
);

desc dept;

desc department;
create table dept2
as 
select * from department;

�Ϻκи� �����ö�, 
create table dept3 (dno, dname)
as 
select dno, dname from department;

desc dept3;
select*from dept3;

�Ϻκи� �����ö�, 
create table dept5 (dno, dname2)
as 
select dno, loc from department;

desc dept5;
select*from dept5;

08-2 ���̺� ���� ����
ALTER TABLE; 

desc dept2;
select*from dept2;

alter table dept2
add(
    TelNumber varchar2(10),
    Address varchar2(30)
);
--null�� ���ذ����� �־��־� �Ѵ�. 

�÷� ���� (���ڸ� ���ڷ� ���ٲ۴�, �����Ͱ� ��������� ������ ���� �ʴ´�.) ;
alter table dept2
MODIFY(
    dno varchar2(10)
);

�÷� ����;
alter table dept2
DROP COLUMN TelNumber;

���� ��ó�� ó���ϱ�
alter table dept2
set unused (address); /* ������ ������ �ʰ�, �Ⱦ��ٰ� ó���Ǿ� ������ ������ �Ⱥ���*/ 

alter table dept2
drop unused columns;

 ���̺���� ���� RENAME ��;
 
 rename dept5 to emp5;
 drop table dept3;
 
 select*from dept2;
 ���̺��� ��� �����͸� �����ϴ� ��;
 truncate table dept2;

������ ����;
select table_name from user_tables;

desc user_tables;

select owner, table_name from dba_tables
where owner = 'SCOTT';
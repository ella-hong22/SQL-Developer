09 ���� �߰� INSERT ��

�����͸� ������ ������ �����Ҷ�;
create table dept2
as 
select *from department where 0=1;

desc dept2;
select *from dept2;


������ �߰��Ҷ�;
insert into dept2
values ( 10, 'ACCOUNTING', 'NEW YORK');

insert into dept2 (dno, dname)
values ( 20, '�ѹ���');

insert into dept2 (dno, loc)
values ( 30, 'seoul');

insert into dept2 (dname, loc) /*Ư�� �÷��� ���ϰ� ������, (�÷���) �� �����ش�, ���� ���� ���� null�̴�. */ 
values ( '����', 'busan');

insert into dept2
values ( 40, '������', '����');




NULL ���� ���� �ο� ����;

insert into dept2
values ( 60, '�񼭽�', '����',to_date('2020/11/12'));
--values ( 60, '�񼭽�', '����',to_date('11/12/2020 ', 'MM,DD,YYYY')); ���� ���� 
alter table dept2
add(
    birth date
);

select *from dept2;

create table dept3
as 
select *from department where 0=1;

insert into dept
select*from department;

drop table dept2;

�����͸� �����Ҷ�, (UPDATE, SET) 
create table dept2
as 
select*from department;

select *from dept2;


update dept2
    set dname = '�����'
where dno = 10;

update dept2
    set dname = '�����2',
    loc = '����'
where dno = 10; /*where ������ ������ ��� ���� �ٲ�*/

alter table dept2
add(tel varchar2(11) ); /*11�� ���ڱ����� ���������ϴ�*/

select *from dept2;

update dept2
set tel = '010-';

update dept2
    set dname = (select dname from department  where dno = 10),
         loc = (select loc from department where dno =10)
    where dno = 10;


���̺� ������ �����ϴ� DELETE �� ;
delete from dept2
    where loc= '����';
select*from dept2;

delete from dept2;


Ʈ����� ���� (commit, rollback
delete from dept2;
commit; /*������� ������ ������ �����Ѵٴ� �ǹ�*/ 

insert into dept2
values (20,'����','��õ', null);
savepoint a1;
insert into dept2
values (10,'����','�λ�', null);
savepoint a2;
delete from dept2
where dno = 20;

rollback to a2; /*Ŀ�� ������ �ǵ�����. */ 
commit;
select*from dept2;



Chater 06_���̺� �����ϱ�

01.EQUI ������ ����Ͽ� SCOTT ����� �μ���ȣ�� �μ��̸��� ����Ͻÿ�.;
select c.dno, c.ename, b.dname
    from employee c, department b
where c.dno = b.dno
    and c.ename = 'SCOTT';

02.INNER JOIN�� ON �����ڸ� ����Ͽ� ����̸��� �Բ� �� �ÿ��� �Ҽӵ� �μ��̸��� �������� ����Ͻÿ�.
select e.eno, e.ename, d.dname , d.loc
from employee e join department d
    on e.dno = d.dno
    order by ename;
    

select * from department;
select * from employee;

03.INNER JOIN�� USING �����ڸ� ����Ͽ� 10�� �μ��� ���ϴ� ��� ��� ������ �׸��� �μ��� �������� �����Ͽ� ����Ͻÿ�.
select   e.job, d.dname , d.loc
from employee e join department d
    using (dno)
    where dno = 10;
    

04.NATURAL JOIN�� ����Ͽ� Ŀ�̼��� �޴� ��� ����� �̸�, �μ��̸�, �������� ����Ͻÿ�.
select ename, dname, loc
    from  employee  natural join department 
    where commission is not null; 

05.EQUI ���ΰ� WildCard�� ����Ͽ� �̸��� A�� ���Ե� ��� ����� �̸��� �μ����� ����Ͻÿ�.

select ename, dname
    from employee e, department d
    where ename like '%A%';

06.NATURAL JOIN�� ����Ͽ� NEWYORK�� �ٹ��ϴ� ��� ����� �̸�, ����, �μ���ȣ �� �μ����� ����Ͻÿ�.
select ename, job, dname, dno
    from  employee  natural join department
    where loc = 'NEW YORK' ;

07.SELFJOIN�� ����Ͽ� ����� �̸� �� �����ȣ�� ������ �̸� �� ������ ��ȣ�� �Բ� ����Ͻÿ�. ��, ������ ��Ī�� ��� ȭ��� ������ �Ͻÿ�.
Employee Emp# Manager Mgr#

create table MAN
as select * from employee;

select e.ename, e.eno, m.ename as "Employee Emp", m.eno as "Manager Mgr"
    from employee e, MAN m
where e.manager = m.eno; /*������ ����� �����ش�*/

08.SELFJOIN�� ����Ͽ� ����� �̸� �� �����ȣ�� ������ �̸� �� ������ ��ȣ�� �Բ� ����Ͻÿ�.
�� �����ڰ� ���� ����� ����Ͻÿ�.


select e.ename, e.eno, m.ename as "Employee Emp", m.eno as "Manager Mgr"
    from employee e, MAN m
where e.manager = m.eno(+); /*(+) null ���� ���� */

09.SELF JOIN�� �ÿ��Ͽ� ������ ����� �̸�, �μ���ȣ, ������ ����� ������ �μ����� �ٹ��ϴ� ����� ��� �Ͻÿ�. ��, �� ���� ��Ī�� �̸�, �μ���ȣ, ����� �Ͻÿ�.
select a.ename, b.ename, a.dno
from employee a, employee b
where a.ename = 'SCOTT'
    and a.dno = b.dno
    and b.ename !='SCOTT';

10.SELF JOIN�� �ÿ��Ͽ� WARD ������� �ʰ� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�.
select  b.ename, b.hiredate
from employee a, employee b
where a.ename = 'WARD'
and a.hiredate < b.hiredate;

11.SELF JOIN�� ����Ͽ� �����ں��� ���� �Ի��� ��� ����� �̸� �� �Ի����� �������� �̸� �� �Ի��ϰ� �Բ� ����Ͻÿ�. ��, �� ���� ��Ī�� ��� ȭ��� ������ �Ͻÿ�.
ENAME HIREDATE ENAME HIREDATE

select e.ename, e.hiredate, e.manager, m.ename ,m.hiredate
    from employee e, employee m
    where e.manager = m.eno
    and e.hiredate < m.hiredate;

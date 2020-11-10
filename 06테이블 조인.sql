--06 ���̺� �����ϱ� 

--Equi Join
select eno,ename, dname
from employee , department
where employee.dno = department.dno
order by eno;


select eno, ename, employee.dno, dname
from employee, department
where employee.dno= department.dno
order by employee.eno;

--��ȣ�� Į���� �ڼ��� ���� 
select e.eno, e.ename, d.dname, e.dno
    from employee e, department d
where e.dno = d.dno
and e.eno = 7788;


--natural join
select eno, ename, dname, dno
    from employee natural join department;
--���� ���� ������ �ƴϴ�. 

--USing���� ���� ����� �Ǵ� Į���� ���� 
select e.eno, e.ename, d.dname, dno
    from employee e join department d
    using(dno)
    where e.eno =7788;
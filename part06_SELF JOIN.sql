select from salgrade;
select enam, salary, grade, losal, hisal
from employee, salgrade ;


select*
    from employee a, department b, salgrade c
    where a.dno = b.dno
    and a.salary between c.losal and c.hisal;
--    �ּ� �ΰ��� �־�� �Ѵ�. 

create table TEST
    as select * from employee
select*from TEST;

select a.eno, a.ename, a.manager, b.eno, b.ename
    from employee a, TEST b
    where a.manager = b.eno;
    
    select a.eno, a.ename, a.manager, b.eno, b.ename
    from employee a, employee b
    where a.manager = b.eno;
    
    
    select a.eno, a.ename, a.manager, b.eno, b.ename
    from employee a, employee b
    where a. manager(+) = b.eno;



--Non - Equi Join    (�޿� ��� ���̺� ���� salary ����� ������.) 
select *from salgrade; 

select ename, salary, grade
    from employee, salgrade
where salary between losal and hisal;

select e.ename, d.dname, e.salary, s.grade
    from employee e, department d, salgrade s
where e.dno = d.dno /*3���� �����Ҷ�, �� ���̺��� ������� ������ְ� ������ ������ �Ǵ�*/
    and salary between losal and hisal;

    
-- self join 
create table TEST
    as select*from employee; /*table test �����Ǿ���. */

select a.eno, a.ename, a.manager, b.eno, b.ename
    from employee a, TEST b
where a.manager = b.eno;

    
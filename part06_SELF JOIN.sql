select from salgrade;
select enam, salary, grade, losal, hisal
from employee, salgrade ;


select*
    from employee a, department b, salgrade c
    where a.dno = b.dno
    and a.salary between c.losal and c.hisal;
--    최소 두개가 있어야 한다. 

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



--Non - Equi Join    (급여 등급 테이블에 따른 salary 등급을 나눈다.) 
select *from salgrade; 

select ename, salary, grade
    from employee, salgrade
where salary between losal and hisal;

select e.ename, d.dname, e.salary, s.grade
    from employee e, department d, salgrade s
where e.dno = d.dno /*3개를 조인할때, 두 테이블의 연결고리를 만들어주고 나머지 조건을 건다*/
    and salary between losal and hisal;

    
-- self join 
create table TEST
    as select*from employee; /*table test 생성되었다. */

select a.eno, a.ename, a.manager, b.eno, b.ename
    from employee a, TEST b
where a.manager = b.eno;

    
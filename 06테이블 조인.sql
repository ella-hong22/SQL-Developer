--06 테이블 조인하기 

--Equi Join
select eno,ename, dname
from employee , department
where employee.dno = department.dno
order by eno;


select eno, ename, employee.dno, dname
from employee, department
where employee.dno= department.dno
order by employee.eno;

--모호한 칼럼명 자세히 지정 
select e.eno, e.ename, d.dname, e.dno
    from employee e, department d
where e.dno = d.dno
and e.eno = 7788;


--natural join
select eno, ename, dname, dno
    from employee natural join department;
--굳이 좋은 조합은 아니다. 

--USing절에 조인 대상이 되는 칼럼을 지정 
select e.eno, e.ename, d.dname, dno
    from employee e join department d
    using(dno)
    where e.eno =7788;
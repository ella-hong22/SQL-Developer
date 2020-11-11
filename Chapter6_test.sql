Chater 06_테이블 조인하기

01.EQUI 조인을 사용하여 SCOTT 사원의 부서번호와 부서이름을 출력하시오.;
select c.dno, c.ename, b.dname
    from employee c, department b
where c.dno = b.dno
    and c.ename = 'SCOTT';

02.INNER JOIN과 ON 연산자를 사용하여 사원이름과 함께 그 시원이 소속된 부서이름과 지역명을 출력하시오.
select e.eno, e.ename, d.dname , d.loc
from employee e join department d
    on e.dno = d.dno
    order by ename;
    

select * from department;
select * from employee;

03.INNER JOIN과 USING 연산자를 사용하여 10번 부서에 속하는 모든 담당 업무와 그리고 부서의 지역명을 포함하여 출력하시오.
select   e.job, d.dname , d.loc
from employee e join department d
    using (dno)
    where dno = 10;
    

04.NATURAL JOIN을 사용하여 커미션을 받는 모든 사원의 이름, 부서이름, 지역명을 출력하시오.
select ename, dname, loc
    from  employee  natural join department 
    where commission is not null; 

05.EQUI 조인과 WildCard를 사용하여 이름에 A가 포함된 모든 사원의 이름과 부서명을 출력하시오.

select ename, dname
    from employee e, department d
    where ename like '%A%';

06.NATURAL JOIN을 사용하여 NEWYORK에 근무하는 모든 사원의 이름, 업무, 부서번호 및 부서명을 출력하시오.
select ename, job, dname, dno
    from  employee  natural join department
    where loc = 'NEW YORK' ;

07.SELFJOIN을 사용하여 사원의 이름 및 사원번호를 관리자 이름 및 관리자 번호와 함께 출력하시오. 단, 각열의 별칭은 결과 화면과 같도록 하시오.
Employee Emp# Manager Mgr#

create table MAN
as select * from employee;

select e.ename, e.eno, m.ename as "Employee Emp", m.eno as "Manager Mgr"
    from employee e, MAN m
where e.manager = m.eno; /*연결할 대상을 묶어준다*/

08.SELFJOIN을 사용하여 사원의 이름 및 사원번호를 관리자 이름 및 관리자 번호와 함께 출력하시오.
단 관리자가 없는 사람도 출력하시오.


select e.ename, e.eno, m.ename as "Employee Emp", m.eno as "Manager Mgr"
    from employee e, MAN m
where e.manager = m.eno(+); /*(+) null 값도 포함 */

09.SELF JOIN을 시용하여 지정한 사원의 이름, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력 하시오. 단, 각 열의 별칭은 이름, 부서번호, 동료로 하시오.
select a.ename, b.ename, a.dno
from employee a, employee b
where a.ename = 'SCOTT'
    and a.dno = b.dno
    and b.ename !='SCOTT';

10.SELF JOIN을 시용하여 WARD 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하시오.
select  b.ename, b.hiredate
from employee a, employee b
where a.ename = 'WARD'
and a.hiredate < b.hiredate;

11.SELF JOIN을 사용하여 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함께 출력하시오. 단, 각 열의 별칭은 결과 화면과 같도록 하시오.
ENAME HIREDATE ENAME HIREDATE

select e.ename, e.hiredate, e.manager, m.ename ,m.hiredate
    from employee e, employee m
    where e.manager = m.eno
    and e.hiredate < m.hiredate;

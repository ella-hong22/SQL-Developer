Chater 07_서브 쿼리

01.사원번호가 7788인 사원과 담당 업무가 같은 사원을 표시(사원이름과 담당 업무)하시오.

select ename, job, eno
from employee
where job = (select  job
                    from employee
                    where  eno = 7788);

02.사원번호가 7499인 사원보다 급여가 많은 사원을 표시(사원이름과 담당 업무)하시오.
select ename, eno, salary
from employee
where salary > (select salary
                    from employee
                    where eno = 7499);
                    
select*from employee;
select*from department;

03.최소 급여를 받는 사원의 이름, 담당 업무 및 급여를 표시하시오(그룹함수 사용).
select  job, salary
from employee
where salary = (select min(salary)
                        from employee);
                        
                        

04.평균 급여가 가장 적은 직급(job)과 평균 급여를 표시하시오.


select min(round(avg(salary)))
from employee
group by job;


select job, round(avg(salary))
from employee 
group by job
having round(avg(salary)) = (select min(round(avg(salary)))
                                        from employee
                                        group by job);

05.각부서의 최소 급여를 받는 사원의 이름, 급여, 부서번호를 표시하시오.
select ename, salary, dno
from employee
where (dno, salary) in (select dno, min(salary)
                    from employee
                    group by dno);


06.담당 업무가 분석가(ANALYST)인 사원보다 급여가 적으면서 업무가 분석가(ANALYST)가 아닌 사원들을 표 시(사원번호, 이름, 담당업무, 급여)하시오.
select job, min(salary)
from employee
where job= 'ANALYST'
group by job;

select eno, ename, job, salary
from employee
where salary < any (select min(salary)
                            from employee
                            where job= 'ANALYST'
                            group by job);

select *from employee
order by job;

07.부하직원이 없는 사원의 이름을 표시하시오. (X)
select eno,ename
from employee
where eno not in( select distinct manager
                         from employee
                         where manager is not null);

select distinct manager
    from employee
    where manager is not null; 

08.부하직원이 있는 사원의 이름을 표시하시오.(X)

select eno,ename
from employee
where eno in( select distinct manager
                         from employee
                         where manager is not null);

09.BLAKE와 동일한 부서에 속한 사원의 이름과 입사일을 표시하는 질의를 작성하시오(단. BLAKE는 제외).
select ename, hiredate ,dno
from employee
where dno in ( select dno
                        from employee
                        where ename = 'BLAKE')
and ename != 'BLAKE' ;

10.급여가 평균 급여 보다 많은 사원들의 사원번호와 이름을 표시하되 결과를 급여에 대해서 오름차순으로 정렬 하시오.
select eno, ename
from employee
where salary > any(select round(avg(salary),2) 
                            from employee)
order by salary;


11.이름에 K가 포함된 사원과 같은 부서에서 일하는 사원의 사원번호와 이름을 표시하는 질의를 작성하시오
select ename
from employee
where ename like '%K%';

select eno, ename, dno
from employee
where dno in (select distinct dno
                    from employee
                    where ename like '%K%');

12.부서 위치가 DALLAS인 사원의 이름과 부서번호 및 담당 업무를 표시하시오.
select ename, dno, job
from employee
where dno in (select dno
                    from  department 
                    where  loc = 'DALLAS');

select a.ename, a.dno, a.job, loc
from  employee a, department b
where a.dno = b.dno
and loc = 'DALLAS';

13.KING에게 보고하는 사원의 이름과 급여를 표시하시오.
select a.ename, a.manager, a.salary
from employee a, employee b
where a.manager = b.eno 
and b.ename ='KING';

select ename, manager, salary
from employee 
where manager = (select eno
                                from employee
                                where ename ='KING');


select*from department;


14.RESEARCH 부서의 사원에 대한 부서번호 사원이름 및 담당 업무를 표시하시오.
select a.ename, a.eno, a.job
from employee a, department b
where a.dno= b.dno
and b.dname ='RESEARCH';

select dno, ename, job
from employee
where dno = ( select dno
                    from department
                    where dname = 'RESEARCH');


15.평균 급여 보다 많은 급여를 받고 이름에 K가 포함된 사원과 같은 부서에서 근무하는 사원의 사원번호, 이름, 급여를 표시하시오.
select  eno, ename, dno
from employee
where dno in (select dno
                    from employee
                    where salary > any(select round(avg(salary),2) 
                            from employee))
and ename like '%K%';
                  
select  eno, ename, dno
from employee
where salary > (select round(avg(salary),2) 
                            from employee)
                        and dno in ( select distinct dno
                                       from employee
                                        where ename like '%K%');
        

16.평균 급여가 가장 적은 업무를 찾으시오. (gruop 일때는 where문 사용이 불가하다) 
select min( round(avg(salary)))
from employee
group by job;

select job,  round(avg(salary))
from employee
group by job
having  round(avg(salary)) = (select min( round(avg(salary)))
                    from employee
                    group by job);


17.담당 업무가 ANALYST인 사원이 소속된 부서와 동일한 부서의 사원을 표시하시오.
select ename,dno
from employee
where dno in (select dno
                    from employee
                    where  job = 'ANALYST');


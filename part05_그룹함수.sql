05. 그룹함수;

select sum(salary), round(avg(salary)),
        max(salary), min(salary)
    from employee;
    
select sum(commission)
    from employee;
--    null  값은 빼고 계산, 

그룹의 갯수를 알기위해
select count(*) from employee;
select *from employee; 

중복 제외,
select distinct job from employee;
select count(distinct job) from employee;

데이터 그룹
select dno,salary
from employee;

select dno, count(salary), sum(salary), round(avg(salary)),
max(salary), min(salary)
from employee
group by dno
order by dno;

select dno, job, count(*), sum(salary)
    from employee
group by dno, job
order by dno, job;


select dno, job, salary
from employee
order by dno, job;

그룹 결과 제한 : HAVING 절;

select dno, max(salary)
from employee
group by dno;

select dno, max(salary)
from employee
group by dno
having max(salary) > = 3000;
--//그룹핑 된 결과에 대해서 나옴 

select dno,  max(salary)
from employee
where dno!=10
group by dno
having dno >20; /*그룹 후에 조건을 건것*/



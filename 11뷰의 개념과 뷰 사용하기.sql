11. 뷰의 개념과 뷰 사용하기 (디스크 저장 공간이 할당되지 않음)

create or replace view v_emp_sample
    as
select eno, ename,job, manager, dno
from employee;

select*from user_views;
select*from v_emp_sample;

서브 쿼리문을 뷰 위치로 가져옴. 
create or replace view v_emp_salary
as
select dno,
            sum(salary) as "급여합",
            round(avg(salary),2) as " 평균 급여"
    from employee
    group by dno;
    
select * from v_emp_salary;
select "급여합" from v_emp_salary;


뷰제거
select*from user_views;

drop view v_emp_salary;

다양한 뷰 옵션 (With check option은 해당 뷰를 통해 볼수 있는 범위내에서만 update 또는 insert가 가능하다. 
create or replace view v_emp2
as
select eno,ename, dno,job
from employee
where job = 'MANAGER' with check option;

select * from  employee;
select * from v_emp2;
insert into v_emp2
    values(2112,'test1', 10, 'SALESMAN');
    
    
create view v_emp_salary2
as
select dno,
         sum(salary) as "sal_sum",
         avg(salary) as "sal_avg"
    from department
group by dno; 

create or replace view

cr
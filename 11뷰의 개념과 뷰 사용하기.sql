11. ���� ����� �� ����ϱ� (��ũ ���� ������ �Ҵ���� ����)

create or replace view v_emp_sample
    as
select eno, ename,job, manager, dno
from employee;

select*from user_views;
select*from v_emp_sample;

���� �������� �� ��ġ�� ������. 
create or replace view v_emp_salary
as
select dno,
            sum(salary) as "�޿���",
            round(avg(salary),2) as " ��� �޿�"
    from employee
    group by dno;
    
select * from v_emp_salary;
select "�޿���" from v_emp_salary;


������
select*from user_views;

drop view v_emp_salary;

�پ��� �� �ɼ� (With check option�� �ش� �並 ���� ���� �ִ� ������������ update �Ǵ� insert�� �����ϴ�. 
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
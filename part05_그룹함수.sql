05. �׷��Լ�;

select sum(salary), round(avg(salary)),
        max(salary), min(salary)
    from employee;
    
select sum(commission)
    from employee;
--    null  ���� ���� ���, 

�׷��� ������ �˱�����
select count(*) from employee;
select *from employee; 

�ߺ� ����,
select distinct job from employee;
select count(distinct job) from employee;

������ �׷�
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

�׷� ��� ���� : HAVING ��;

select dno, max(salary)
from employee
group by dno;

select dno, max(salary)
from employee
group by dno
having max(salary) > = 3000;
--//�׷��� �� ����� ���ؼ� ���� 

select dno,  max(salary)
from employee
where dno!=10
group by dno
having dno >20; /*�׷� �Ŀ� ������ �ǰ�*/



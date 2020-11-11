Chater 07_���� ����

01.�����ȣ�� 7788�� ����� ��� ������ ���� ����� ǥ��(����̸��� ��� ����)�Ͻÿ�.

select ename, job, eno
from employee
where job = (select  job
                    from employee
                    where  eno = 7788);

02.�����ȣ�� 7499�� ������� �޿��� ���� ����� ǥ��(����̸��� ��� ����)�Ͻÿ�.
select ename, eno, salary
from employee
where salary > (select salary
                    from employee
                    where eno = 7499);
                    
select*from employee;
select*from department;

03.�ּ� �޿��� �޴� ����� �̸�, ��� ���� �� �޿��� ǥ���Ͻÿ�(�׷��Լ� ���).
select  job, salary
from employee
where salary = (select min(salary)
                        from employee);
                        
                        

04.��� �޿��� ���� ���� ����(job)�� ��� �޿��� ǥ���Ͻÿ�.


select min(round(avg(salary)))
from employee
group by job;


select job, round(avg(salary))
from employee 
group by job
having round(avg(salary)) = (select min(round(avg(salary)))
                                        from employee
                                        group by job);

05.���μ��� �ּ� �޿��� �޴� ����� �̸�, �޿�, �μ���ȣ�� ǥ���Ͻÿ�.
select ename, salary, dno
from employee
where (dno, salary) in (select dno, min(salary)
                    from employee
                    group by dno);


06.��� ������ �м���(ANALYST)�� ������� �޿��� �����鼭 ������ �м���(ANALYST)�� �ƴ� ������� ǥ ��(�����ȣ, �̸�, ������, �޿�)�Ͻÿ�.
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

07.���������� ���� ����� �̸��� ǥ���Ͻÿ�. (X)
select eno,ename
from employee
where eno not in( select distinct manager
                         from employee
                         where manager is not null);

select distinct manager
    from employee
    where manager is not null; 

08.���������� �ִ� ����� �̸��� ǥ���Ͻÿ�.(X)

select eno,ename
from employee
where eno in( select distinct manager
                         from employee
                         where manager is not null);

09.BLAKE�� ������ �μ��� ���� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�(��. BLAKE�� ����).
select ename, hiredate ,dno
from employee
where dno in ( select dno
                        from employee
                        where ename = 'BLAKE')
and ename != 'BLAKE' ;

10.�޿��� ��� �޿� ���� ���� ������� �����ȣ�� �̸��� ǥ���ϵ� ����� �޿��� ���ؼ� ������������ ���� �Ͻÿ�.
select eno, ename
from employee
where salary > any(select round(avg(salary),2) 
                            from employee)
order by salary;


11.�̸��� K�� ���Ե� ����� ���� �μ����� ���ϴ� ����� �����ȣ�� �̸��� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�
select ename
from employee
where ename like '%K%';

select eno, ename, dno
from employee
where dno in (select distinct dno
                    from employee
                    where ename like '%K%');

12.�μ� ��ġ�� DALLAS�� ����� �̸��� �μ���ȣ �� ��� ������ ǥ���Ͻÿ�.
select ename, dno, job
from employee
where dno in (select dno
                    from  department 
                    where  loc = 'DALLAS');

select a.ename, a.dno, a.job, loc
from  employee a, department b
where a.dno = b.dno
and loc = 'DALLAS';

13.KING���� �����ϴ� ����� �̸��� �޿��� ǥ���Ͻÿ�.
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


14.RESEARCH �μ��� ����� ���� �μ���ȣ ����̸� �� ��� ������ ǥ���Ͻÿ�.
select a.ename, a.eno, a.job
from employee a, department b
where a.dno= b.dno
and b.dname ='RESEARCH';

select dno, ename, job
from employee
where dno = ( select dno
                    from department
                    where dname = 'RESEARCH');


15.��� �޿� ���� ���� �޿��� �ް� �̸��� K�� ���Ե� ����� ���� �μ����� �ٹ��ϴ� ����� �����ȣ, �̸�, �޿��� ǥ���Ͻÿ�.
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
        

16.��� �޿��� ���� ���� ������ ã���ÿ�. (gruop �϶��� where�� ����� �Ұ��ϴ�) 
select min( round(avg(salary)))
from employee
group by job;

select job,  round(avg(salary))
from employee
group by job
having  round(avg(salary)) = (select min( round(avg(salary)))
                    from employee
                    group by job);


17.��� ������ ANALYST�� ����� �Ҽӵ� �μ��� ������ �μ��� ����� ǥ���Ͻÿ�.
select ename,dno
from employee
where dno in (select dno
                    from employee
                    where  job = 'ANALYST');


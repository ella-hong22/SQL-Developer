���̺� ���� 
desc department;

������ ��ȸ =  Select
select * from employee;
select eno, ename from employee;
select salary, salary + 300 from employee;
select ename, salary, salary *12 from employee;

select ename, salary, job, salary* 12, salary*12+nvl(commission,0) 
from employee;

select ename, salary, salary*12+ nvl(commission, 0) ���� 
from employee; 
select ename, salary, salary*12+ nvl(commission, 0)  as �� �� 
from employee; 

select ename, salary, salary*12+ nvl(commission, 0) as "�� ��" 
from employee;

�ߺ��� ������ �ѹ��� ��� 
select eno, ename from employee;
select distinct dno from employee;

select distinct job rom employee;

DUAL ���̺�
decs dual;
select * from dual;
select sysdate from dual;

select*from employee;
select ename, salary
from employee;

���� �˻�
select ename, salary
from employee
where  salary > 1500;
select ename, job, salary
from employee
where job = 'SALESMAN';

select ename, salary from employee where dno = 10;

���� ������ ��ȸ (�빮�ڿ� �ҹ��ڰ� �ٸ����� �ݵ�� �빮�ڷ� ã��! )
select eno, ename, dno, salary
from employee where ename = 'SCOTT'; 

desc employee;
select *from employee
where hiredate <= '1981/01/01';

�� ������
select* from employee
where dno = 10 and job = 'MANAGER';
select* from employee
where dno = 10 or job = 'MANAGER';
select* from employee
where dno != 10  job = 'MANAGER';

-BETWEEN AND(�����ؼ�) 
select* from employee
where salary between 1000 and 1500;

select *from employee
where commission in(300,500,1400);
���̵�ī�� (%) ��� (F�� �����ϴ� ����)
select*from employee
where ename like'F%';

select*from employee
where ename like '%A%';
select*from employee
where commission is null;
select*from employee
where job!='SALESMAN';

---����
select * from employee
where 'HIREDATE' > '80/00/00';

���������� ���� ASC
select*from employee
order by salary asc;
select*from employee
order by hiredate;
���� ���� 
select*from employee
order by salary, ename;
��������
select*from employee
order by salary desc;

select*from employee
order by salary desc, ename asc;
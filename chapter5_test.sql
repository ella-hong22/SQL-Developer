Chapter 05 �׷��Լ� ����ϱ�;

01.��� ����� �޿� �ְ��, ������, �Ѿ� �� ��� �޿��� ����Ͻÿ�. 
Į���� ��Ī�� ��� ȭ��� �����ϰ� ���� �ϰ� ��տ� ���ؼ��� ������ �ݿø��Ͻÿ�.
[Maximum]	[Minimum]	[Sum]		[Average]

select*from employee;
select*from department;

select dno, max(salary) as "Maximun" , min(salary) as "Minimum", sum(salary) as "Sum", round(avg(salary)) as "Average"
from employee
group by dno
order by dno;
    
02.�� ���
 ���� �������� �޿� �ְ��, ������, �Ѿ� �� ��վ��� ����Ͻÿ�. Į���� ��Ī�� ��� ȭ��� �����ϰ� �����ϰ� ��տ� ���ؼ��� ������ �ݿø��Ͻÿ�.
[Job]	[Maximum]	[Minimum]	[Sum]		[Average]

select job, max(salary) as "Maximun" , min(salary) as "Minimum", sum(salary) as "Sum", round(avg(salary)) as "Average"
from employee
group by job
order by job;

03.count(*) �Լ��� �̿��Ͽ� ��� ������ ������ ��� ���� ����Ͻÿ�.
select  job, count(*) 
from employee
group by job
order by job;

04.�����ڼ��� ���Ͻÿ�.
select job, count(*)
from employee
group by job
having job= 'MANAGER';

select count(distinct manager)
from employee;

05.�޿� �ְ��, �޿� �������� ������ ����Ͻÿ�. Į���� ��Ī�� ��� ȭ���� �����ϰ� �����Ͻÿ�.
[DIFFERENCE]
select max(salary) -  min(salary) as DIFFERENCE
from employee; 

06.���޺� ����� ���� �޿��� ����Ͻÿ�. �����ڸ� �� �� ���� ��� �� ���� �޿��� 2000 �̸��� �׷��� ���ܽ�Ű�� ����� �޿��� ���� ������������ �����Ͽ� ����Ͻÿ�.
select job, min(salary)
from employee
where manager is not null
group by job
having min(salary) >= 2000
order by min(salary) desc;


07.�� �μ��� ���� �μ� �̸�, �����, �μ� ���� ��� ����� ��� �޿��� ����Ͻÿ�. Į���� ��Ī�� ��� ȭ��� �����ϰ� �����ϰ� ��� �޿��� �Ҽ��� ��° �ڸ��� �ݿø��Ͻÿ�.
[DNO]		[Number of People]		[Salary]

select decode(dno, 10, 'ȸ��',
                            20, '����ġ',
                            30 , '������',
                            40, '���۷��̵�',
                            '��Ÿ') as "�μ� �̸�",
        count(*) as "Number of People" , round( avg(salary),2)  as  "Salary"
from employee
group by "�μ� �̸�";


08.�� �μ��� ���� �μ� �̸�, ������, �����, �μ����� ��� ����� ��� �޿��� ����Ͻÿ�. Į���� ��Ī�� ��� ȭ��� �����ϰ� �����ϰ� ��� �޿��� ������ �ݿø��Ͻÿ�.
[dname]	[Location]	[Number of People]		[Salary]

select decode(dno, 10, 'ȸ��',
                            20, '����ġ',
                            30 , '������',
                            40, '���۷��̵�',
                            '��Ÿ') as "�μ� �̸�",
       decode(dno,10, 'ȸ��',
                            20, '����ġ',
                            30 , '������',
                            40, '���۷��̵�')
group by "�μ� �̸�";


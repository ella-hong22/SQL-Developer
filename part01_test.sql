Quiz
01.���� �����ڸ� �̿��Ͽ� ��� ����� ���ؼ� $300 �� �޿� �λ��� ����� �� ����� �̸�, �޿�, �λ�� �޿��� ����Ͻÿ�.
select * from employee;
select ename, salary, salary + 300 as"����� �޿�" from employee;

02.����� �̸�, �޿�, ���� �Ѽ����� �� ������ ���� �ͺ��� ���� ������ ����Ͻÿ�. ���� �Ѽ����� ���޿� 12�� ���� �� $100�� �󿩱��� ���ؼ� ����Ͻÿ�.
select ename, salary, salary*12+100 as �Ѽ��� from employee
order by �Ѽ��� desc;

03.�޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ���� �ͺ��� ���� ������ ����Ͻÿ�.
select ename, salary from employee
where salary >2000
order by salary desc;

04.�����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����Ͻÿ�.
select ename, dno from employee
where eno = 7788;

05.�޿��� 2000���� 3000 ���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ����Ͻÿ�.(re)
select ename, salary from employee
where salary <2000 or salary >3000  ;

where salary not between 2000 and 3000; 

06.1981�� 2�� 20�Ϻ��� 1981�� 5�� 1�� ���̿� �Ի��� ����� �̸�, ��� ����, �Ի����� ����Ͻÿ�.
select ename , job, hiredate from employee
where hiredate >= '81/02/20' and hiredate <= '81/05/01' ;

07.�μ� ��ȣ�� 20 �� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ� �̸��� ����(��������)���� �����ڼ����� ����Ͻÿ�.
select ename, dno from employee
where dno = 20 or dno = 30 ( where dno in (20,30); )
order by ename desc ; 

08.����� �޿��� 2000���� 3000 ���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ����ϵ� �̸� ��(��������)���� ����Ͻÿ�.
select ename, dno, salary from employee
where salary between 2000 and 3000  and (dno = 20 or dno = 30)
order by ename asc; 

09.1981�⵵�� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�(Iike �����ڿ� ���ϵ�ī�� ���).
select ename, hiredate from employee
where hiredate like '81%';

10.�����ڰ� ���� ����� �̸��� ��� ������ ����Ͻÿ�.
select ename, job from employee
where manager is null;

11.Ŀ�̼��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿� �� Ŀ�̼��� �������� �������� �����Ͽ� ǥ���Ͻÿ�.
select ename, salary, commission from employee
where commission is not null
order by salary desc, commission desc; 

12.�̸��� �� ��° ���ڰ� R�� ����� �̸��� ǥ���Ͻÿ�.
select*from employee
where ename like'__R%';

13.�̸��� A�� E�� ��� �����ϰ� �ִ� ����� �̸��� ǥ���Ͻÿ�. 
select*from employee
where ename like '%A%'
and ename like '%E%';

14.��� ������ �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸鼭 �޿��� $1600, $950 �Ǵ� $1300�� �ƴ� ����� �̸�, ��� ����, �޿��� ����Ͻÿ�.
select ename, salary, job from employee
where ( job = 'CLERK' or job = 'SALESMAN' ) and (salary != 1600 and salary != 950  and salary != 1300) ; 
-- salary not in (1600, 950 , 1300 )�� ����!


15.Ŀ�̼��� $500�̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����Ͻÿ�.
select ename, salary, commission from employee
where commission >= 500;



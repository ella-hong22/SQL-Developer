Chater 04_�پ��� �Լ� ����

select *from employee;
01.SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ����Ͻÿ�.
select  ename, hiredate, 
    substr(hiredate, 1 ,2 ),
     substr(hiredate, 4 ,2 )
    from employee;

02.SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ����Ͻÿ�.
select  ename, hiredate, 
    substr(hiredate, 1 ,2 ) as a,
     substr(hiredate, 4 ,2 ) as b
    from employee
    where  substr(hiredate, 4 ,2 ) = '04';
    
    
03.MOD �Լ��� ����Ͽ� �����ȣ�� ¦���� ����� ����Ͻÿ�.
select ename, eno
from employee
where (MOD(eno, 2) = 0);

04.�Ի����� ������ 2�ڸ�(YY), ���� ����(MON)�� ǥ���ϰ� ������ ���(DY)�� �����Ͽ� ����Ͻÿ�.
select ename,  to_char(hiredate, 'YY-MON DY') as �Ի���
    from employee;
    

05.���� ��ĥ�� �������� ����Ͻÿ�. ���� ��¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ���  ��� �Ͽ� ������ ���� ��ġ ��Ű�ÿ�.

select round(sysdate - to_date('20200101') )
    from dual;

    
06.������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� NULL �� ��� 0���� ����Ͻÿ�.
select ename,
    nvl(manager , 0)
    from employee;
    
07.DECODE �Լ��� ���޿� ���� �޿��� �λ��ϵ��� �Ͻÿ�. ������ ��ANALYST���� ����� 200, ��SALESMAN�� �� ����� 180, ��MANAGER���� ����� 150, ��CLERK���� ����� 100�� �λ��Ͻÿ�.;
select  ename, salary, salary + decode(job, 'ANALYST' ,  200,  
                                                            'SALESMAN',180, 
                                                            'MANAGER',150,
                                                            'CLERK',100,
                                                            0)   as "�λ�� �޿�"
from employee;

select  ename, salary,  decode(job, 'ANALYST' ,  salary + 200,  
                                                            'SALESMAN', salary + 180, 
                                                            'MANAGER',salary + 150,
                                                            'CLERK',salary +  100,
                                                            0)   as "�λ�� �޿�"
from employee;

select  ename, salary, salary + case when job = 'ANALYST'  then  200
                                                    when job =  'SALESMAN' then 180
                                                         when job =   'MANAGER' then 150
                                                         when job =   'CLERK' then 100
                                                          else  0 
                                                          end as "�λ�� �޿�"
from employee;

select salary
    from employee;




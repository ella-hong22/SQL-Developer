select 'Oracle mania',
UPPER('Oracle mania') �빮��,
LOWER('Oracle mania') �ҹ���,
INITCAP('oracle mania') "�ձ��ڸ� �빮��"

from dual;

select length('OracleMania'), lengthb('����Ŭ�ŴϾ�')
 from dual;
 
 ���ڿ� ���� = CONCAT
 select 'Oracle' || 'mania', concat('Oracle', 'mania')
 from dual;
 
 ���� ���ڿ� �Ϻ� ��������
 select substr('Oracle mania', 4, 3)
 from dual;
-- cle ��� 
 select substr('����Ŭ �ŴϾ�', 4, 3), substrb('����Ŭ �ŴϾ�', 4, 3)
 from dual;

���ڿ��� ��ġ ���� ���� 
select instr('Oracle mania', 'a' 3+1)
 from dual;

��������
select Lpad(salary, 10, '*') 
 from employee;
 
 select Rpad(salary, 10, '*') 
 from employee;
 
 ���ڿ��� ù���ڳ� ������ ���ڸ� �߶� 
 select 'AA' || trim(' Oracle mania ') || 'BB'
 from dual;
  select 'AA' || trim('O' from 'Oracle mania ') || 'BB'
 from dual;
-- O �� ����� 

04 �����Լ�
select 98.7654,
        ROUND(98.7654),
        ROUND(98.7654, 2),
        ROUND(98.7654 , -1),
        ROUND(98.7654)
    from dual;
        
select 98.7654,
        TRUNC(98.7654),
        TRUNC(98.7654, 2),
        TRUNC(98.7654 , -1)
    from dual;

select mod(5,2) from dual;

05 ��¥ �Լ�
select sysdate from dual;
select sysdate -1 ����,
     sysdate ����,
     sysdate +1 ����
 from dual;
 
 ��¥ �ݿø�
select round(sysdate - hiredate) as aaa
 from employee
order by aaa;

select hiredate, round(hiredate, 'MONTH'), trunc(hiredate, 'MONTH')
from employee;
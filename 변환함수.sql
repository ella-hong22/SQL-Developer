desc employee;
select * from employee;
select ename, salary from employee;
select ename, salary from employee
where salary < 1000
    and salary < 2000
order by salary desc;

04 ��ȯ �Լ� 

 select hiredate, round(hiredate,'MONTH') as a, trunc(hiredate, 'MONTH') as b
 from employee
    order by a;

��¥�� ��¥ ������ ���� ��
select ename, sysdate, hiredate, trunc(months_between(sysdate,hiredate))
    from employee;

Ư�� ���� �� ���ϴ� �Լ�
select hiredate, add_months(sysdate + 3)
    from dual;

�ش� ��¥ �������� �����ϴ� ���� ��¥ ��ȯ
select sysdate, next_day(sysdate, '�����')
    from dual;

�ش� ��¥�� ���� ���� ������ ��¥ ��ȯ
select hiredate, last_day(hiredate)
    from employee;

������������ ��ȯ
select ename, hiredate,
    to_char(hiredate, 'YY-MM'),
    to_char(hiredate, 'YY-MON-DD DY')
    from employee;
    
���ڿ��� ��¥ ������ ��ȯ   

select ename, hiredate
    from employee
    where hiredate > to_date('810220'); 
--    to_date �����̸� �ڵ� ���� ����. 

desc employee;

Ư�������͸� ���ڷ� ��ȯ
 select to_number('1000') - '100'
    from dual;
    
select '1000' - '100'
from dual; 
--to_ number�� �����Ǿ� �ִٰ� ����ȴ�. 

�Ϲ� �Լ�
select ename, nvl2(commission, commission *1.1,0)
    from employee;

select nullif('A','A')
from dual;

Null  �ƴ� ù��° �μ� ��ȯ
select ename, salary, commission,
    coalesce(commission, salary,0)
    from employee;

���ǿ� ���� ���� 
select ename, dno,
    decode(dno, 10, 'ȸ��',
                        20, '����ġ',
                        30,'����',
                        40 ,' �',
                        'DEFAULT') as �μ��̸�
        from employee;

IF else ������ ������ CASE / END
select ename, dno,
        case when dno =10 then 'ȸ��'
            when dno = 20 then '����ġ'
            when dno = 30 then '����'
            when dno =40 then '�'
            else 'DEFAULT'
        end  as �μ��̸�
    from employee;
UNION & UNION ALL;

�����հ� ���� ����(�� ���̺� ���� ������ �����ʹ� �ѹ��� ��ȸ��); 
delete from employee where eno = 8000;
commit;
select eno, ename, dno from employee
    where dno !=10
union all
    select eno, ename, dno from employee
    where dno !=20
    order by ename;
    
union all
select dno, dname from department

INTERSECT  (������);
select eno, ename, dno from employee
    where dno !=10
intersect 
    select eno, ename, dno from employee
    where dno !=20
    order by ename;
    
MINUS (,������); 
select eno, ename, dno from employee
    where dno !=10
minus 
    select eno, ename, dno from employee
    where dno !=20
    order by ename;
    
REPLACE; ('����ڿ�', '�񱳹��ڿ�', �ٲܹ��ڿ�')
select replace('ABCDEFG','C','123')
from dual;

select translate('ABCDEFG','CFG','123')
from dual;

select translate('ABCDEFG','CFG','1')
from dual; /*���ڿ��� ���ָ� �ƿ� ����� ������ */

�������� ;



UNION & UNION ALL;

합집합과 같은 개념(한 테이블 기준 동일한 데이터는 한번만 조회됨); 
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

INTERSECT  (교집합);
select eno, ename, dno from employee
    where dno !=10
intersect 
    select eno, ename, dno from employee
    where dno !=20
    order by ename;
    
MINUS (,차집합); 
select eno, ename, dno from employee
    where dno !=10
minus 
    select eno, ename, dno from employee
    where dno !=20
    order by ename;
    
REPLACE; ('대상문자열', '비교문자열', 바꿀문자열')
select replace('ABCDEFG','C','123')
from dual;

select translate('ABCDEFG','CFG','123')
from dual;

select translate('ABCDEFG','CFG','1')
from dual; /*문자열을 안주면 아예 사라져 버린다 */

문자제거 ;



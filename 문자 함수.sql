select 'Oracle mania',
UPPER('Oracle mania') 대문자,
LOWER('Oracle mania') 소문자,
INITCAP('oracle mania') "앞글자만 대문자"

from dual;

select length('OracleMania'), lengthb('오라클매니아')
 from dual;
 
 문자열 결합 = CONCAT
 select 'Oracle' || 'mania', concat('Oracle', 'mania')
 from dual;
 
 기존 문자열 일부 가져오기
 select substr('Oracle mania', 4, 3)
 from dual;
-- cle 결과 
 select substr('오라클 매니아', 4, 3), substrb('오라클 매니아', 4, 3)
 from dual;

문자열내 위치 정보 제공 
select instr('Oracle mania', 'a' 3+1)
 from dual;

왼쪽정렬
select Lpad(salary, 10, '*') 
 from employee;
 
 select Rpad(salary, 10, '*') 
 from employee;
 
 문자열의 첫글자나 마지막 글자를 잘라냄 
 select 'AA' || trim(' Oracle mania ') || 'BB'
 from dual;
  select 'AA' || trim('O' from 'Oracle mania ') || 'BB'
 from dual;
-- O 가 사라짐 

04 숫자함수
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

05 날짜 함수
select sysdate from dual;
select sysdate -1 어제,
     sysdate 오늘,
     sysdate +1 내일
 from dual;
 
 날짜 반올림
select round(sysdate - hiredate) as aaa
 from employee
order by aaa;

select hiredate, round(hiredate, 'MONTH'), trunc(hiredate, 'MONTH')
from employee;
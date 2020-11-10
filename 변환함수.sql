desc employee;
select * from employee;
select ename, salary from employee;
select ename, salary from employee
where salary < 1000
    and salary < 2000
order by salary desc;

04 변환 함수 

 select hiredate, round(hiredate,'MONTH') as a, trunc(hiredate, 'MONTH') as b
 from employee
    order by a;

날짜와 날짜 사이의 개월 수
select ename, sysdate, hiredate, trunc(months_between(sysdate,hiredate))
    from employee;

특정 개월 수 더하는 함수
select hiredate, add_months(sysdate + 3)
    from dual;

해당 날짜 기준으로 도래하는 요일 날짜 반환
select sysdate, next_day(sysdate, '토요일')
    from dual;

해당 날짜가 속한 달의 마지막 날짜 반환
select hiredate, last_day(hiredate)
    from employee;

데이터형으로 변환
select ename, hiredate,
    to_char(hiredate, 'YY-MM'),
    to_char(hiredate, 'YY-MON-DD DY')
    from employee;
    
문자열을 날짜 형으로 변환   

select ename, hiredate
    from employee
    where hiredate > to_date('810220'); 
--    to_date 숫자이면 자동 생략 가능. 

desc employee;

특정데이터를 숫자로 변환
 select to_number('1000') - '100'
    from dual;
    
select '1000' - '100'
from dual; 
--to_ number가 생략되어 있다고 보면된다. 

일반 함수
select ename, nvl2(commission, commission *1.1,0)
    from employee;

select nullif('A','A')
from dual;

Null  아닌 첫번째 인수 반환
select ename, salary, commission,
    coalesce(commission, salary,0)
    from employee;

조건에 따른 선택 
select ename, dno,
    decode(dno, 10, '회계',
                        20, '리서치',
                        30,'영업',
                        40 ,' 운영',
                        'DEFAULT') as 부서이름
        from employee;

IF else 유사한 구조의 CASE / END
select ename, dno,
        case when dno =10 then '회계'
            when dno = 20 then '리서치'
            when dno = 30 then '영업'
            when dno =40 then '운영'
            else 'DEFAULT'
        end  as 부서이름
    from employee;